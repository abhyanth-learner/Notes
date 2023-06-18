var count =0
document.write("The prime numbers between 5 to 50 are:<br>")
for(i=5;i<=50;i++){
    for(j=2;j<=Math.round(i/2);j++){
        if(i%j==0){
            count++;
        }
    }
    if(count==0){
        document.write(i+" is a prime number<br>");
        
    }
    count=0
}