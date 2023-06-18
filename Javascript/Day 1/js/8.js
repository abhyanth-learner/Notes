var str="CITIUSTECH";
arr=[];
var count=0;
arr=str.split("");
for(i=0;i<arr.length;i++){
    if(arr[i]=="A" || arr[i]=="E" || arr[i]=="I" || arr[i]=="O" || arr[i]=="U"){
        count++
    }
}
document.write(count)