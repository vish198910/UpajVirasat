import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/dashboard.dart';
import 'sign_in.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String aadharNumber;
  TextEditingController aadharNumberController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Container(
          color: Colors.white,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24.0,96,24,24),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("images/drib2.png"),
                  SizedBox(height: 50),
                  TextField(
                    controller: aadharNumberController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText:"Enter your aadhar Number"
                    ),
                    onChanged: (value){
                      setState(() {
                        aadharNumber = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: _signInButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    aadharNumber = (aadharNumberController.text);
    print(aadharNumber);
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().whenComplete(() {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return MainPage(user: name, aadharNumber: aadharNumber,);
              },
            ),
          );
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}