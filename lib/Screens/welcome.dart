import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/sign_in.dart';
import 'package:upajVirasat/authentication/login_page.dart';
import 'package:upajVirasat/styles/style.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
          child: Center(
        child: Stack(
          alignment: Alignment.lerp(Alignment.topCenter, Alignment.bottomCenter, 0.9),
          children: <Widget>[
            Image.asset("images/drib2.png"),
            Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(fontSize: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,8,20,8),
                    child: Text(
                      "Login to continue and if not a member then Sign-up to register",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () => signUp(context),
                    color: welcomeTheme["lightColor"],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text("Mobile Sign In "),
                  ),
                ),
                SizedBox(
                  height:20,
                  width: double.infinity,
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 50,
                  child: RaisedButton(
                    onPressed: () => signIn(context),
                    color: welcomeTheme["darkColor"],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Text("Google Sign In"),
                  ),
                ),
              ])
            ],
          ),
          ],
        ),
      )),
    );
  }

  void signUp(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginScreen();
    }));
  }

  void signIn(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LoginPage();
    }));
  }
}
