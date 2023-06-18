function fun7(){
    sum=0
    if((arguments.length)==0){
        document.write("No arguments passed<br>")
    }
    else{
    for(i=0;i<arguments.length;i++){
        sum=sum+arguments[i]
        
        
    }
    document.write("The sum is:"+sum+"<br>")
}
}
fun7()
fun7(1,55,4,5,3,34,56,89,65,43)