class FormModel{
  String name;
  String address;
  String lastCropName;
  String currentCropName;
  String nextCropName;
  double areaOfLand;

  FormModel({this.name,this.address,this.lastCropName,this.currentCropName,this.nextCropName,this.areaOfLand});


  FormModel.FromJSON(Map<String,dynamic> json) {
    name= json["name"];
    address = json["address"];
    lastCropName = json["lastCropName"];
    currentCropName = json["currentCropName"];
    nextCropName = json["nextCropName"];
    areaOfLand = json["areaOfLand"];
  }

  Map<String,dynamic> toJSON(){
    return {
      "name": name,
      "address":address,
      "lastCropName":lastCropName,
      "currentCropName":currentCropName,
      "nextCropName":nextCropName,
      "areaOfLand":areaOfLand
    };
  }
}