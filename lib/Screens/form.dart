import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:upajVirasat/Models/formModel.dart';
import 'package:upajVirasat/styles/style.dart';
import '../Math/analysis.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Firestore db = Firestore.instance;

class DataCollectionForm extends StatefulWidget {
  @override
  _DataCollectionFormState createState() => _DataCollectionFormState();
}

class _DataCollectionFormState extends State<DataCollectionForm> {
  List<String> questions = [
    "What is your name?",
    "Aadhar Number",
    "Mobile Number",
    "Village Name",
    "District Name",
    "State Name",
    "Which crop was sown here before the present harvest?",
    "Which crop you are  growing in this period?",
    "Which crop are you planning to grow after the present harvest?",
    "What is the area of your land?",
    "What is the number of grains per head of your current crop?",
    "What is number of the heads per metre square of your current crop?"
  ];

  TextEditingController answer1Controller = new TextEditingController();
  TextEditingController answer2Controller = new TextEditingController();
  TextEditingController answer3Controller = new TextEditingController();
  TextEditingController answer4Controller = new TextEditingController();
  TextEditingController answer5Controller = new TextEditingController();
  TextEditingController answer6Controller = new TextEditingController();
  TextEditingController answer7Controller = new TextEditingController();
  TextEditingController answer8Controller = new TextEditingController();
  TextEditingController answer9Controller = new TextEditingController();
  TextEditingController answer10Controller = new TextEditingController();
  TextEditingController answer11Controller = new TextEditingController();
  TextEditingController answer12Controller = new TextEditingController();

  CollectionReference usersCollectionReference = db.collection("users");

  FormModel formModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 1),
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
                          return Builder(
                            builder: (BuildContext context) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(3, 2, 3, 2),
                                child: Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
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
                                            keyboardType: index == 9
                                                ? TextInputType.number
                                                : index == 2
                                                    ? TextInputType.phone
                                                    : index == 1
                                                        ? TextInputType.number
                                                        : TextInputType.text,
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
                                                                    : index == 6
                                                                        ? answer7Controller
                                                                        : index ==
                                                                                7
                                                                            ? answer8Controller
                                                                            : index == 8
                                                                                ? answer9Controller
                                                                                : index == 9 ? answer10Controller : index == 10 ? answer11Controller : index == 11 ? answer12Controller : null,
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
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Image.asset(
                          "images/drib2.png",
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                      Container(
                        color: Colors.transparent,
                        child: ButtonTheme(
                          minWidth: 200,
                          height: 50,
                          child: RaisedButton(
                            elevation: 10,
                            onPressed: () async {
                              print(answer1Controller.text);
                              print(answer2Controller.text);
                              print(answer3Controller.text);
                              print(answer4Controller.text);
                              print(answer5Controller.text);
                              print(answer6Controller.text);
                              print(answer7Controller.text);
                              print(answer8Controller.text);
                              print(answer9Controller.text);
                              print(answer10Controller.text);
                              print(answer11Controller.text);
                              print(answer12Controller.text);
                              if (answer1Controller.text == "" ||
                                  answer2Controller.text == "" ||
                                  answer3Controller.text == "" ||
                                  answer4Controller.text == "" ||
                                  answer5Controller.text == "" ||
                                  answer6Controller.text == "" ||
                                  answer7Controller.text == "" ||
                                  answer8Controller.text == "" ||
                                  answer9Controller.text == "" ||
                                  answer10Controller.text == "" ||
                                  answer11Controller.text == "" ||
                                  answer12Controller.text == "") {
                                Alert(
                                        context: context,
                                        title: "Incomplete Details",
                                        desc: "Fill all the details")
                                    .show();
                                print("In If");
                              } else {
                                print("In hulalala");
                                await Analysis(
                                    cropName: answer8Controller.text,
                                    grainsPerHead:
                                        double.parse(answer11Controller.text),
                                    headsPerM2:
                                        double.parse(answer12Controller.text),
                                    aadharNumber: answer2Controller.text);
                                print("Database added");

                                createLand(
                                    name: answer1Controller.text,
                                    aadharNumber: answer2Controller.text,
                                    mobileNumber: answer3Controller.text,
                                    villageName: answer4Controller.text,
                                    districtName: answer5Controller.text,
                                    stateName: answer6Controller.text,
                                    lastCropName: answer7Controller.text,
                                    currentCropName: answer8Controller.text,
                                    nextCropName: answer9Controller.text,
                                    areaOfLand:
                                        double.parse(answer10Controller.text),
                                    grainsPerHead:
                                        double.parse(answer11Controller.text),
                                    headsPerM2:
                                        double.parse(answer12Controller.text));
                                Navigator.pop(context);
                              }
                            },
                            color: welcomeTheme["darkColor"],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.lightGreenAccent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Text(
                              "Submit",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<FormModel> createLand(
      {String name,
      String aadharNumber,
      String mobileNumber,
      String villageName,
      String districtName,
      String stateName,
      String lastCropName,
      String currentCropName,
      String nextCropName,
      double areaOfLand,
      double grainsPerHead,
      double headsPerM2}) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(db
          .collection('users')
          .document(aadharNumber)
          .collection("lands")
          .document());

      var dataMap = new Map<String, dynamic>();
      dataMap['name'] = name;
      dataMap['aadharNumber'] = aadharNumber;
      dataMap['mobileNumber'] = mobileNumber;
      dataMap["villageName"] = villageName;
      dataMap["districtName"] = districtName;
      dataMap["stateName"] = stateName;
      dataMap["lastCropName"] = lastCropName;
      dataMap["currentCropName"] = currentCropName;
      dataMap["nextCropName"] = nextCropName;
      dataMap["areaOfLand"] = areaOfLand;
      dataMap["grainsPerHead"] = grainsPerHead;
      dataMap["headsPerM2"] = headsPerM2;
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
