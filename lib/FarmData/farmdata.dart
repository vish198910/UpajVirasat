import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FarmData extends StatefulWidget {
  @override
  _FarmDataState createState() => _FarmDataState();

  FarmData({this.aadharNumber});
  final String aadharNumber;
}

class _FarmDataState extends State<FarmData> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    infoList(widget.aadharNumber);
  }

  @override
  String name;
  String mobNo;
  String aadharNum;
  String areaOfLand;
  String villageName;
  String districtName;
  String stateName;
  String LCN;
  String CCN;
  String NCN;
  String GPH;
  String HPM2;
  String yield;
  List<Widget> dataList = [];
  Future<List<Widget>> infoList(String aadharNumber) async {
    print(aadharNumber);

    var docRef = await Firestore.instance
        .collection("users")
        .document(widget.aadharNumber)
        .collection("lands")
        .getDocuments();
    //var docRef2 = await Firestore.instance.collection("Crops").document().collection("Yield").getDocuments();

    for (int i = 0; i < docRef.documents.length; i++) {
      setState(() {
        name = docRef.documents[i].data["name"].toString();
        mobNo = docRef.documents[i].data["mobileNumber"].toString();
        aadharNum = docRef.documents[i].data["aadharNumber"].toString();
        areaOfLand = docRef.documents[i].data["areaOfLand"].toString();
        villageName = docRef.documents[i].data["villageName"].toString();
        districtName = docRef.documents[i].data["districtName"].toString();
        stateName = docRef.documents[i].data["stateName"].toString();
        LCN = docRef.documents[i].data["lastCropName"].toString();
        CCN = docRef.documents[i].data["currentCropName"].toString();
        NCN = docRef.documents[i].data["nextCropName"].toString();
        GPH = docRef.documents[i].data["grainsPerHead"].toString();
        HPM2 = docRef.documents[i].data["headsPerM2"].toString();
        dataList.add(DisplayCard(
          widget: widget,
          name: name,
          mobNo: mobNo,
          aadharNum: aadharNumber,
          areaOfLand: areaOfLand,
          villageName: villageName,
          districtName: districtName,
          stateName: stateName,
          LCN: LCN,
          CCN: CCN,
          NCN: NCN,
          GPH: GPH,
          HPM2: HPM2,
        ));
        dataList.add(SizedBox(
          height: 18,
        ));
        //yield = ;
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 10.0,
          backgroundColor: Colors.white,
          title: Text("Farmer's Data",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 25.0)),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 40,
                ),
                /*
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: GFAvatar(
                    backgroundImage:NetworkImage(widget.user.photoUrl),
                    shape: GFAvatarShape.standard,
                    size: 120,
                  ),
                ),
              ),


              SizedBox(
                height: 20,
              ),

               */
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      child: Column(
                        children: dataList,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

class DisplayCard extends StatelessWidget {
  DisplayCard(
      {@required this.widget,
      this.name,
      this.mobNo,
      this.aadharNum,
      this.areaOfLand,
      this.villageName,
      this.districtName,
      this.stateName,
      this.LCN,
      this.CCN,
      this.NCN,
      this.GPH,
      this.HPM2});

  final FarmData widget;
  final String name;
  final String mobNo;
  final String aadharNum;
  final String areaOfLand;
  final String villageName;
  final String districtName;
  final String stateName;
  final String LCN;
  final String CCN;
  final String NCN;
  final String GPH;
  final String HPM2;
  //final String yield;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      elevation: 4,
      onPressed: () {},
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(color: Colors.black54),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Name:",
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        name,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Aadhar Number:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        aadharNum,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Aad Number
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Mobile NO:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        mobNo,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Mob Number
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Area of Land:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        areaOfLand,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Area of Land
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Village Name:",
                        style: TextStyle(
                            fontFamily: 'DMSans',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        villageName,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Village Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("District Name:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        districtName,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //District Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("State Name:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        stateName,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //State Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Last Crop:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        LCN,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Last Crop Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Current Crop:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        CCN,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Current Crop Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Next Crop:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        NCN,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Next Crop Name
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Grains Per Head:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        GPH,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ), //Grains Per Head
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Heads Per M^2:",
                          style: TextStyle(
                              fontFamily: 'DMSans',
                              fontWeight: FontWeight.w500,
                              fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Text(
                        HPM2,
                        style: TextStyle(fontSize: 14, fontFamily: 'DMSans'),
                      )),
                    ],
                  ),
                ),
              ),
            ],
          ),
          /*//Heads Per M2
          Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text("Yield:",style:
                      TextStyle(fontFamily: 'DMSans',fontWeight: FontWeight.w500,fontSize: 16)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(child: Text(yield, style: TextStyle(fontSize: 14,fontFamily: 'DMSans'),)),
                    ],
                  ),
                ),
              ),
            ],
          ),//Yield
          */
        ],
      ),
    );
  }
}
