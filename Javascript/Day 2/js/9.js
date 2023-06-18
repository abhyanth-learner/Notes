function fun9(arg1,arg2,arg3) {
    var max=Math.max(arg1,arg2,arg3)
    document.write("The max of the given number: "+arg1+","+arg2+","+arg3+" is: "+max);
  }
  arr1=[300,40,50]
  fun9(...arr1)