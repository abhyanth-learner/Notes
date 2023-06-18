const arr=[];
for(i=0;i<5;i++){
    temp=prompt("Enter a word");
    arr.push(temp);
}
for(j=0;j<arr.length;j++){
    temp=[]
    temp=arr[j].split("")
    len=temp.length
    temp[len-1]=temp[len-1].toUpperCase()
    arr[j]=temp.join("")
}
document.write(arr)
