const posts=[];
function getPosts()
{
    setTimeout(()=>{
        let output="";
        posts.forEach((post)=>{
            output+=`<li>${post.title}</li>`;
        });
        document.body.innerHTML=output;
    },3000);

}
function GetVideo(post)
{
    return new Promise((resolve,reject)=>{
        setTimeout(()=>
        {
            posts.push(post);
            const error= false;
            if(!error)
            {
                resolve()
            }
            else
            {
                reject("Error:Something went wrong")
            }
        },3000);
    });
}
function AddIntro(post)
{
    return new Promise((resolve,reject)=>{
        setTimeout(()=>
        {
            posts.push(post);
            const error= false;
            if(!error)
            {
                resolve()
            }
            else
            {
                reject("Error:Something went wrong")
            }
        },3000);
    });

}
function AddSummary(post)
{
    return new Promise((resolve,reject)=>{
        setTimeout(()=>
        {
            posts.push(post);
            const error= false;
            if(!error)
            {
                resolve()
            }
            else
            {
                reject("Error:Something went wrong")
            }
        },3000);
    });
}
GetVideo,AddIntro,AddSummary({title:"Got Video, Intro Added, Summary Added"})

.then(getPosts)

.catch(error => console.log(error));

