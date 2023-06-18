const arr=[];
for(i=0;i<10;i++){
    temp=parseInt(prompt("Enter a number"));
    arr.push(temp)
}
document.write("The array is:"+arr)
arr.sort().reverse()
document.write("<br>The 2 largest numbers in the array is "+arr[0]+"and"+arr[1]);
