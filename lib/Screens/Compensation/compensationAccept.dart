
import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/Compensation/compensation.dart';

import '../dashboard.dart';

class CompensationAccept extends StatelessWidget {

  CompensationAccept({this.user,this.aadharNumber});
  final String user;
  final String aadharNumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("✔",style: TextStyle(fontSize: 70,color: Colors.green),)),
            ),
            Center(child: Text("Compensation Request Accepted!",textAlign: TextAlign.center, style: TextStyle(fontSize: MediaQuery.of(context).size.width/15,),)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("Amount will be transferred in your bank soon.",textAlign: TextAlign.center,style: TextStyle(fontSize: MediaQuery.of(context).size.width/20,fontFamily: 'DMSans'),)),
            ),
            SizedBox(
              height: 5,
            ),

          ],
        ),
      ),
      onWillPop: () => showDialog<bool>(
        context: context,
        builder: (c) => AlertDialog(
          title: Text('Warning'),
          content: Text('Do you really want to exit'),
          actions: [
            FlatButton(
              child: Text('Yes'),
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(aadharNumber: this.aadharNumber,user: this.user,))),
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () => Navigator.pop(c, false),
            ),
          ],
        ),
      ),
    );
  }


}




