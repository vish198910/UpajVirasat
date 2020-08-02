import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Analysis {
  final String cropName;
  final double grainsPerHead;
  final double headsPerM2;
  final String aadharNumber;

  Analysis(
      {@required this.cropName,
      @required this.grainsPerHead,
      @required this.headsPerM2,
      @required this.aadharNumber}){



    if(grainWeight1000[this.cropName] != null){
      double yield = ((grainsPerHead * headsPerM2) * grainWeight1000[this.cropName])/100000;
      Firestore.instance.collection("Crops").document(this.cropName).collection("Yield").document(this.aadharNumber).setData({"yield" : yield});
    }




  }

  //1000-grain weight
  var grainWeight1000 = {
    "rice": 20.5,
    "wheat": 37.5,
    "maize": 252.5,
    "arhar": 96.4,
    "urad": 38.0,
    "moong": 29.25,
    "gram" : 390.0,
    "peas" : 200.0,
    "lentils" : 40.0,
    "potato" : 59.0,
    "onion" : 3.25,
    "eggplant" : 4.75,
    "cauliflower" : 4.0,
    "lychee" : 30.0,
    "pineapple" : 46.0,
    "mango" : 84.0,
    "banana" : 40.0,
    "guava" : 9.56,
    "sugarcane" : 32.0,
    "jute" : 2.484
  };

}
