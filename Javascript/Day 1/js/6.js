const arr=[];
for(i=0;i<10;i++){
    temp=parseInt(prompt("Enter a number"));
    arr.push(temp);
}
document.write("The array is:"+arr);
var sum=0;
for(j in arr){
    
    if(arr[j]%2==0){
        sum=sum+arr[j];
        
    }

}
if (sum==0){
    document.write("<br>NO EVEN NUMBERS FOUND")
}
document.write("<br>The sum of even nubers is:"+sum);