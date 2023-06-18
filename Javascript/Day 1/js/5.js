const arr=[];
for(i=0;i<10;i++){
    temp=parseInt(prompt("Enter a number"));
    arr.push(temp)
}
document.write("The array is:"+arr)
arr.sort().reverse()
document.write("<br>The sorted array is"+arr);