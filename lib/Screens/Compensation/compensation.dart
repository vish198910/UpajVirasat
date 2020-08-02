import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rounded_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'compensationAccept.dart';
import 'compensationReject.dart';

class Compensation extends StatefulWidget {
  Compensation({this.aadharNumber,this.user});
  final String aadharNumber;
  final String user;

  @override
  _CompensationState createState() => _CompensationState();
}

class _CompensationState extends State<Compensation> {
  TextEditingController controller;
  String reason = "";
  int count = 0;

  Future<List<dynamic>> finalCropList()async{
    List currentCropName = [];
    var docRef = await Firestore.instance.collection("users").document(widget.aadharNumber).collection("lands").getDocuments();

    for (int i = 0; i < docRef.documents.length; i++) {
      currentCropName.add(docRef.documents[i].data["currentCropName"]);
    }
    print(currentCropName);
    //List<dynamic> distinctCurrentCropName = currentCropName.toSet().toList();
    return currentCropName;

  }

  Future<int> getMax(List distinctCurrentCropName,int i) async{
    var docRef = await Firestore.instance.collection("Crops").document(distinctCurrentCropName[i]).get();
    return docRef.data["req"];
  }

  Future<double> getSum(List distinctCurrentCropName,int i) async{
    double sum = 0;
    var docRef = await Firestore.instance.collection("Crops").document(distinctCurrentCropName[i]).collection("Yield").getDocuments();
    for(int j=0; j<docRef.documents.length; j++){
      sum = sum + docRef.documents[j].data["yield"];
    }
    return sum;
  }

  Future<void> compensate(int count) async {
    List<dynamic> distinctCurrentCropName = await finalCropList();
    print(distinctCurrentCropName);

    if(distinctCurrentCropName.length == 0){
      //TODO
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CompensationReject(user: widget.user,aadharNumber: widget.aadharNumber,)));
      print("Compensation Rejected");
    }else{
      for(int k=0; k<distinctCurrentCropName.length; k++){
        var max = await getMax(distinctCurrentCropName, k);
        print(max);
        double sum = await getSum(distinctCurrentCropName, k);
        print(sum);
        print(count);
        if(sum > max){
          count = count +1;
        }
      }
      print(count);
      if(count == 0){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompensationReject(aadharNumber: widget.aadharNumber,user: widget.user,)));
      }else{
        Firestore.instance.collection("Compensation").document(widget.aadharNumber).setData({"Compensation Level" : count ,"Reason" :reason });
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CompensationAccept(aadharNumber: widget.aadharNumber,user: widget.user,)));
    }
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Center(child: Text("Compensation Request")),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                "Enter Reason for Compensation?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
                  )),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: TextField(
                  
                  maxLines: 15,
                  controller: controller,
                  onChanged: (val) {
                    setState(() {
                      reason = val;

                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Reason Here',
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightGreen, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.lightGreen, width: 2.0),
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: RoundedButton(
                  buttonTitle: "Submit",
                  onPressed: () async {
                    compensate(count);
                  },
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
