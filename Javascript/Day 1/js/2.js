num=parseInt(prompt("Enter the number to be reversed",0));
var rev=0

while(num>0){
    rem=num%10;
    rev=(rev*10)+rem;
    num=parseInt(num/10);
    
}
document.write(rev+"<br>");
