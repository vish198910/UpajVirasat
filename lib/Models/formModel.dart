class FormModel{
  String name;
  String aadharNumber;
  String mobileNumber;
  String villageName;
  String districtName;
  String stateName;
  String lastCropName;
  String currentCropName;
  String nextCropName;
  double areaOfLand;
  double grainsPerHead;
  double headsPerM2;

  FormModel({this.name,this.aadharNumber,this.mobileNumber,this.villageName,this.districtName,this.stateName,this.lastCropName,this.currentCropName,this.nextCropName,this.areaOfLand,this.grainsPerHead,this.headsPerM2});


  FormModel.FromJSON(Map<String,dynamic> json) {
    name= json["name"];
    aadharNumber = json["aadharNumber"];
    mobileNumber= json["mobileNumber"];
    villageName = json["villageName"];
    districtName = json["districtName"];
    stateName = json["stateName"];
    lastCropName = json["lastCropName"];
    currentCropName = json["currentCropName"];
    nextCropName = json["nextCropName"];
    areaOfLand = json["areaOfLand"];
    grainsPerHead = json["grainsPerHead"];
    headsPerM2 = json["headsPerM2"];
  }

  Map<String,dynamic> toJSON(){
    return {
      "name": name,
      "aadharNumber":aadharNumber,
      "mobileNumber":mobileNumber,
      "villageName":villageName,
      "districtName":districtName,
      "stateName":stateName,
      "lastCropName":lastCropName,
      "currentCropName":currentCropName,
      "nextCropName":nextCropName,
      "areaOfLand":areaOfLand,
      "grainsPerHead" : grainsPerHead,
      "headsPerM2" : headsPerM2
    };
  }
}