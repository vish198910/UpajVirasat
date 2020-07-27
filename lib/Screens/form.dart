import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:upajVirasat/Models/formModel.dart';
import 'package:upajVirasat/styles/style.dart';

Firestore db = Firestore.instance;

class DataCollectionForm extends StatefulWidget {
  @override
  _DataCollectionFormState createState() => _DataCollectionFormState();
}

class _DataCollectionFormState extends State<DataCollectionForm> {
  List<String> questions = [
    "What is your name?",
    "What is the address of your Farm?",
    "Which crop was sown here before the last harvest?",
    "Which crop you are  growing in this period?",
    "Which crop you are planning to grow in the after the next harvest?",
    "What is the area of your land?",
  ];

  String name = "";
  String address = "";
  String lastCropName = "";
  String currentCropName = "";
  String nextCropName = "";
  double areaOfLand = 0.0;

  TextEditingController answer1Controller = new TextEditingController();
  TextEditingController answer2Controller = new TextEditingController();
  TextEditingController answer3Controller = new TextEditingController();
  TextEditingController answer4Controller = new TextEditingController();
  TextEditingController answer5Controller = new TextEditingController();
  TextEditingController answer6Controller = new TextEditingController();

  CollectionReference usersCollectionReference = db.collection("users");

  FormModel formModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10,20,10,1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                child: Center(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        height: MediaQuery.of(context).size.height / 2,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal),
                    items: questions.map((i) {
                      int index = questions.indexOf(i);
                      print(index);
                      return Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                            child: Container(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(
                                    color: Color(0xFFEEFFE0),
                                    borderRadius: BorderRadius.circular(30),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.lightGreenAccent,
                                        offset: Offset(1, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.lightGreenAccent,
                                        offset: Offset(1, 2),
                                      ),
                                      BoxShadow(
                                        color: Colors.lightGreenAccent,
                                        offset: Offset(2, 3),
                                      ),
                                      BoxShadow(
                                        color: Colors.lightGreenAccent,
                                        offset: Offset(-3, -3),
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        '$i',
                                        style: TextStyle(fontSize: 25.0),
                                      ),
                                      TextField(
                                        controller: index == 0
                                            ? answer1Controller
                                            : index == 1
                                                ? answer2Controller
                                                : index == 2
                                                    ? answer3Controller
                                                    : index == 3
                                                        ? answer4Controller
                                                        : index == 4
                                                            ? answer5Controller
                                                            : index == 5
                                                                ? answer6Controller
                                                                : null,
                                        decoration: InputDecoration(
                                            hintText: "Your Answer"),
                                      )
                                    ],
                                  ),
                                )),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Stack(
                alignment: Alignment.lerp(
                    Alignment.topCenter, Alignment.bottomCenter, 0.30),
                children: <Widget>[
                  Image.asset(
                    "images/drib2.png",
                    height: MediaQuery.of(context).size.height/3,
                  ),
                  Container(
                    color: Colors.transparent,
                    child: ButtonTheme(
                      minWidth: 200,
                      height: 50,
                      child: RaisedButton(
                        onPressed: () {
                          print(answer3Controller.text);
                          createLand(
                              name: answer1Controller.text,
                              address: answer2Controller.text,
                              lastCropName: answer3Controller.text,
                              currentCropName: answer4Controller.text,
                              nextCropName: answer5Controller.text,
                              areaOfLand: double.parse(answer6Controller.text));
                        },
                        color: welcomeTheme["darkColor"],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Text("Submit"),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<FormModel> createLand(
      {String name,
      String address,
      String lastCropName,
      String currentCropName,
      String nextCropName,
      double areaOfLand}) async {
    print(name);
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds =
          await tx.get(db.collection('users').document());

      var dataMap = new Map<String, dynamic>();
      dataMap['name'] = name;
      dataMap['address'] = address;
      dataMap["lastCropName"] = lastCropName;
      dataMap["currentCropName"] = currentCropName;
      dataMap["nextCropName"] = nextCropName;
      dataMap["areaOfLand"] = areaOfLand;

      await tx.set(ds.reference, dataMap);

      return dataMap;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return FormModel.FromJSON(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });

    
  }
}
