const arr=[];
const arr2=[];
var fact=1;
for(i=0;i<5;i++){
    temp=parseInt(prompt("Enter a number"));
    arr.push(temp);
}
document.write("The array is:"+arr);
for(k=0;k<arr.length;k++){
    for(j=arr[k];j>0;j--){
         
        fact=fact*j
        // document.write("<br>"+fact);
    }
    // document.write("<br>"+fact);
    arr2.push(fact)
    fact=1
}
document.write("<br>"+arr2);