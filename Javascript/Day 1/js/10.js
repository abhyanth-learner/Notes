var num="7312140905"
document.write("The number given is:"+num+"<br>")
var count=0;
arr=num.split("")
for(i=0;i<arr.length-2;i++){
    for(j=i+1;j<arr.length-1;j++){
        if(num[i]==num[j]){
            count++
        }
    }
}
document.write(count+":digits are repeated in the above number")
