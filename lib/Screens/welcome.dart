import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/sign_in.dart';
import 'package:upajVirasat/authentication/login_page.dart';
import 'package:upajVirasat/localizations/application.dart';
import 'package:upajVirasat/localizations/app_translations.dart';
import 'package:upajVirasat/styles/style.dart';


class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  String label = languagesList[0];

  @override
  void initState() {
    super.initState();
    application.onLocaleChanged = onLocaleChange;
    onLocaleChange(Locale(languagesMap["Hindi"]));
  }

  void onLocaleChange(Locale locale) async {
    setState(() {
      AppTranslations.load(locale);
    });
  }
   void _select(String language) {
    print("dd "+language);
    onLocaleChange(Locale(languagesMap[language]));
    setState(() {
      if (language == "Hindi") {
        label = "हिंदी";
      } else {
        label = language;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
            PopupMenuButton<String>(
              // overflow menu
              onSelected: _select,
              icon: Padding(
                padding: const EdgeInsets.fromLTRB(4.0,8,24,20),
                child: new Icon(Icons.language, color: Colors.black),
              ),
              itemBuilder: (BuildContext context) {
                return languagesList
                    .map<PopupMenuItem<String>>((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
      ),

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
                    "${AppTranslations.of(context).text("welcome1")}",
                    style: TextStyle(fontSize: 50),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20,8,20,8),
                    child: Text(
                      "${AppTranslations.of(context).text("welcome2")}",
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
                    child: Text("${AppTranslations.of(context).text("MLogin")}"),
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
                    child: Text("${AppTranslations.of(context).text("GLogin")}"),
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
