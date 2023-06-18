function fun1(num){
    fact=1;
    for(j=num;j>0;j--){         
        fact=fact*j
        // document.write("<br>"+fact);
    }
    document.write("The factorial of the number "+num+" is equal to:"+fact);
}
fun1(5)
