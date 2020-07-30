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

    double yield = ((grainsPerHead * headsPerM2) * grainWeight1000[cropName])/100000;
    Firestore.instance.collection("Crops").document(this.cropName).collection("Yield").document(this.aadharNumber).setData({"yield" : yield});
  }

  //1000-grain weight
  var grainWeight1000 = {
    "rice": 20.5,
    "wheat": 37.5,
    "maize": 252.5,
    "arhar": 96.4,
    "urad": 38,
    "moong": 29.25,
    "gram" : 390,
    "peas" : 200,
    "lentils" : 40,
    "potato" : 59,
    "onion" : 3.25,
    "eggplant" : 4.75,
    "cauliflower" : 4,
    "lychee" : 30,
    "pineapple" : 46,
    "mango" : 84,
    "banana" : 40,
    "guava" : 9.56,
    "sugarcane" : 32,
    "jute" : 2.484
  };

}
