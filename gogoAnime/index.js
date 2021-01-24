const elegantSpinner = require('elegant-spinner');
const logUpdate = require('log-update');
const fs = require('fs');
const progress = require('request-progress');
const request = require('request'); 
const cheerio = require('cheerio'); 
const inquirer = require('inquirer');

//Asking validating and flitering answers
let quality = ['360p','480p','720p']
let qualityZ;
let folder
var questions = [
    {
        //Remove '/catogory/' if there is in the link and change it to '/'
        type:'input',
        name:'link',
        message:'Enter show link of gogoAnime : ',
        filter:val=>{
            let l;
            try{
                l = val.replace('/category/','/')
            }catch{
                l = val;
            }
            let spltVal = l.split('-');
            if (spltVal[spltVal.length-2]=='episode') {
                spltVal.pop()
                spltVal.pop()
                joinVal = spltVal.join('-');
                return joinVal
            }else{
                joinVal = spltVal.join('-');
                return joinVal
            }
        },
        validate: val=>{
            if(validURL(val)){
                let a = val.split("/");
                let b = a[a.length-1]
                let c = b.split('-')
                let d;
                if(c[c.length-1]=="dub"){
                    c.pop()
                    d = c.join(' ')
                }else{
                    d = c.join(' ')
                }

                folder = d.charAt(0).toUpperCase() + d.slice(1)
                return true;
            }
            else return "Please enter a valid value"
        }
    },
    {
        type: 'input',
        name: 'start',
        message: "Episode to start from : ",
        validate: val=>{
            if(Number(val) && Number(val)!=0 && number(Number(val))) return true;
            return 'Please enter a valid value'
        }
    },
    {
        type: 'input',
        name: 'end',
        message: "Episode to end to : ",
        validate: val=>{
            if(Number(val)&& Number(val)!=0 && number(Number(val))) return true;
            return 'Please enter a valid value'
        }
    },
    {
        type: 'list',
        name: 'qualityA',
        message: 'What should be its initial quality',
        choices: quality,
        filter: function (val) {
            for(i=0;i<quality.length;i++){
                if(quality[i].indexOf(val)>-1){
                    quality.splice(i,1)
                }
            }
            return Number(val.slice(0, -1));
        },
    },
    {
        type: 'list',
        name: 'qualityB',
        message: 'What should be its secondary quality',
        choices: quality,
        filter: function (val) {
            for(i=0;i<quality.length;i++){
                if(quality[i].indexOf(val)>-1){
                    quality.splice(i,1)
                }
            }
            qualityZ = Number(quality[0].slice(0,-1));
            return Number(val.slice(0, -1));
        }
    },  
];






//Getting answers
inquirer.prompt(questions).then((answers) => {
    linkCreator(answers.link,answers.start,answers.end,answers);
});

// Create gogoAnime website links
let linkCreator = async (link,start,end,all)=>{
    try{
        fs.mkdirSync('/home/admin/prinix/others/.Entertainment/Anime/series/'+folder)
    }catch{
        console.log()
    }
    for(i=0;i<(end-start+1);i++){
        let dlPage = await downloadPageLink(`${link}-episode-${Number(start)+i}`)
        let dlLinks = await downloadLinks(dlPage) 
        let ans = linkAccordingToAnswer(all.qualityA,all.qualityB,qualityZ,dlLinks)
        let downloaded = await download(ans,`Episode ${Number(start)+i}.mp4`)
        console.log(downloaded)
    }
}

//Download button links of individual episode Link
let downloadPageLink = (start)=>{
    return new Promise((resolve, reject) => {
        request(start,(err,res,body)=>{
            let $ = cheerio.load(body)
            resolve($('.dowloads > a').attr('href'))
        }) 
    })
}

//Different quality download links
let downloadLinks = (start)=>{
    return new Promise((resolve, reject) => {
        request(start,(err,res,body)=>{
            let $ = cheerio.load(body);
            let a = $('#main > div > div.content_c > div > div:nth-child(5) > div:nth-child(3) > a')
            let b = a.parent().next().children('a')
            let c = b.parent().next().children('a')
            let d = c.parent().next().children('a')
            let link = [{
                quality:a.text().trim(),
                link:a.attr('href')
            },{
                quality:b.text().trim(),
                link:b.attr('href')
            },{
                quality:c.text().trim(),
                link:c.attr('href')
            },{
                quality:d.text().trim(),
                link:d.attr('href')
            }]

            let linksA = []
            link.map(arr=>{
                if(arr.quality){
                    let a = arr.quality;
                    if(a.indexOf('480') > -1){
                        linksA.push({
                            quality:480,
                            link:arr.link
                        })
                    }else if(a.indexOf('360') > -1){
                        linksA.push({
                            quality:360,
                            link:arr.link
                        })
                    }else if(a.indexOf('720') > -1){
                        linksA.push({
                            quality:720,
                            link:arr.link
                        })
                    }
                }else{
                    return ""
                }
            })
            resolve(linksA)
        }) 
    })
}

//Gives correct link according to the quality selected
let linkAccordingToAnswer = (a,b,c,links)=>{
    let qal = [a,b,c]
    for(let i=0;i<3;i++){
        for(let j=0;j<links.length;j++){
            if(links[j].quality==qal[i]){
                return links[j].link
            }
        }
    }
}

let download = (link,fileName,folderName)=>{
    let TotalSize;
    return new Promise((resolve, reject) => {
        const frame = elegantSpinner();
        progress(request(link), {}).on('progress', function (e) {
            TotalSize = e.size.total
            let percentage = Math.floor((e.size.transferred/e.size.total)*100) + 1;
            let rep = [
                '>          ',
                '=>         ',
                '==>        ',
                '===>       ',
                '====>      ',
                '=====>     ',
                '======>    ',
                '=======>   ',
                '========>  ',
                '=========> ',
                '==========>',
            ]
            var mind = e.time.remaining % (60 * 60);
            var minutes = Math.floor(mind / 60);
            var secd = mind % 60;
            let kbs = Math.floor((e.speed/1000))>1000 ? Math.floor((e.speed/1000000))+'MB/s' : Math.floor((e.speed/1000))+'KB/s'  
            let size = niceBytes(e.size.transferred) 
            var seconds = Math.ceil(secd);
            logUpdate(fileName+'  '+frame()+'     '+percentage+'%['+rep[Math.floor(percentage/10)]+']',size+'   '+kbs+'    '+'eta',minutes+' min '+seconds+' sec');
        })
            .on('error', function (err) {
                logUpdate(`${fileName} ⠸⠸    100%[xxxxxxxxxxx]    Error.`);
                fs.unlinkSync(fileName)
                resolve("")
            })
            .on('end', function () {
                logUpdate(`${fileName} ⠸⠸    100%[==========>] ${niceBytes(TotalSize)}   Completed.`);
                resolve("")
            }).pipe(fs.createWriteStream("/home/admin/prinix/others/.Entertainment/Anime/series/"+folder+"/"+fileName));
    })
}
//
//
//
//
//Coversion logic
const units = ['bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];

function niceBytes(x){

    let l = 0, n = parseInt(x, 10) || 0;

    while(n >= 1024 && ++l){
        n = n/1024;
    }
    //include a decimal point and a tenths-place digit if presenting 
    //less than ten of KB or greater units
    return(n.toFixed(n < 10 && l > 0 ? 1 : 0) + units[l]);
}

//Verifyling url

function validURL(str) {
    var pattern = new RegExp('^(https?:\\/\\/)?'+ // protocol
        '((([a-z\\d]([a-z\\d-]*[a-z\\d])*)\\.)+[a-z]{2,}|'+ // domain name
        '((\\d{1,3}\\.){3}\\d{1,3}))'+ // OR ip (v4) address
        '(\\:\\d+)?(\\/[-a-z\\d%_.~+]*)*'+ // port and path
        '(\\?[;&a-z\\d%_.~+=-]*)?'+ // query string
        '(\\#[-a-z\\d_]*)?$','i'); // fragment locator
    return !!pattern.test(str);
}


//Number Checker

function number(n)
{
   var result = (n - Math.floor(n)) !== 0; 
   
  if (result)
    return false;
   else
     return true;
  }

//TODO: Output problem
