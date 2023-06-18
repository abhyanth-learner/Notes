function fun3(){
    count=0
    for(i=0;i<arguments.length;i++){
        document.write("The argument sent is:"+arguments[i]+"<br>")
        
    }
    document.write("Number of arguments are: "+arguments.length+"<br>");
}
fun3(1,5,6,7,55,55555,356,53,3434,3434,34332,565)