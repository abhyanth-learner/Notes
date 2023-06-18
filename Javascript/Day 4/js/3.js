function oddarr(arr){
    resarr=[]
    for(i=0;i<arr.length;i++){
        if(arr[i]%2!=0){
            resarr.push(arr[i])
        }

           }
          
         console.log(resarr)  
}

function evenarr(arr){
    resarr=[]
    for(i=0;i<arr.length;i++){
        if(arr[i]%2==0){
            resarr.push(arr[i])
        }

           }
          
         console.log(resarr)  
}

function primearr(arr){
    resarr=[]
    for (i=0;i<arr.length;i++){
        
        var count=0
        for(n=1;n<=arr[i];n++)
        {if(arr[i]%n==0){
            count+=1;
             }
        }
        if (count<=2){
            
            resarr.push(arr[i]);
        }

    }
    console.log(resarr)
}

function opt(arr,mycallback){
    mycallback(arr)
}
