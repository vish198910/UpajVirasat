import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/Compensation/compensation.dart';
import 'package:upajVirasat/Screens/dashboard.dart';

import '../dashboard.dart';

class CompensationReject extends StatelessWidget {

  CompensationReject({this.user,this.aadharNumber});
  final String user;
  final String aadharNumber;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: Text("❌",style: TextStyle(fontSize: 70),)),
            ),
            SizedBox(
              height: 4,
            ),
            Text("Request Declined!",style: TextStyle(fontSize: MediaQuery.of(context).size.width/10,fontFamily: 'DMSans')),

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
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage(user: this.user,aadharNumber: this.aadharNumber,))),
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
