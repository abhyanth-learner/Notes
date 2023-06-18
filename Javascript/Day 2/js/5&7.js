function vehicle(vehicleid,brand,model,varient){
    this.vehicleid=vehicleid;
    this.brand=brand;
    this.model=model;
    this.varient=varient;

};
function specs () {
    this.firstgear=function() {
        return"First Gear<br>"
    }
    this.secondgear=function(){
        return "Second Gear<br>"
    }
    this.maxspeed= function(){
        return "140KMpH<br>"
    }
   this.changegear= function() {
         return [this.firstgear(),this.secondgear()]
    }
  }
var v1=new vehicle(132,"fiat","vxi","z+");
var v2=new specs()
document.write("VehicleId:"+v1.vehicleid+" ,Brand:"+v1.brand+" ,Model:"+v1.model+" ,Varient:"+v1.varient+"<br><br>");
document.write(v2.changegear())
document.write(v2.maxspeed())


fun7=(v1)=>{
    s="VehicleId:"+v1.vehicleid+" ,Brand:"+v1.brand+" ,Model:"+v1.model+" ,Varient:"+v1.varient;
    return s
}
var res=fun7(v1)
document.write("<br>"+res)