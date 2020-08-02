import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:upajVirasat/Screens/FarmDataList.dart';
import 'package:upajVirasat/Screens/ShopScreens/Images.dart';
import 'package:upajVirasat/Screens/ShopScreens/main_shop.dart';
import 'package:upajVirasat/Screens/form.dart';
import 'package:upajVirasat/Screens/weather.dart';
import 'package:upajVirasat/authentication/sign_in.dart';

Firestore db = Firestore.instance;

class MainPage extends StatefulWidget {
  MainPage({this.user, this.aadharNumber});
  final String user;
  final String aadharNumber;
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  QuerySnapshot lands;

  getData({int aadharNumber}) async {
    return await db.collection('Crops').getDocuments();
  }

  @override
  void initState() {
    getData().then((results) {
      setState(() {
        lands = results;
      });
    });
    reqyieldText(actualDropdown); 
    super.initState();
  }

  /* final List<List<double>> charts = [
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
    ],
    [
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4,
      0.0,
      0.3,
      0.7,
      0.6,
      0.55,
      0.8,
      1.2,
      1.3,
      1.35,
      0.9,
      1.5,
      1.7,
      1.8,
      1.7,
      1.2,
      0.8,
      1.9,
      2.0,
      2.2,
      1.9,
      2.2,
      2.1,
      2.0,
      2.3,
      2.4,
      2.45,
      2.6,
      3.6,
      2.6,
      2.7,
      2.9,
      2.8,
      3.4
    ]
  ]; */

String reqYielda = " ";

  Future<void> reqyieldText(String actualDropdown) async {
    var docRef = await Firestore.instance
        .collection("Crops")
        .document(actualDropdown)
        .get();

    print(docRef.data["req"]);
    setState(() {
      reqYielda = docRef.data["req"].toString();
    });
  }

  String yielda = " ";

  Future<void> yieldText(String actualDropdown)async{
    double sum = 0;
    var docRef = await Firestore.instance.collection("Crops").document(actualDropdown).collection("Yield").getDocuments();
    for(int j=0; j<docRef.documents.length; j++){
      sum = sum + docRef.documents[j].data["yield"];
    }
    setState(() {
      yielda = sum.toString();
    });


  }

  static final List<String> chartDropdownItems = [
    "rice",
    "wheat",
    "maize",
    "arhar",
    "urad",
    "moong",
    "gram",
    "peas",
    "lentils",
    "potato",
    "onion",
    "eggplant",
    "cauliflower",
    "lychee",
    "pineapple",
    "mango",
    "banana",
    "guava",
    "sugarcane",
    "jute"
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.account_balance_wallet,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.settings,
              color: Colors.black,
              size: 30,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(6.0),
              child: IconButton(
                onPressed: () async {
                  await googleSignIn.signOut();
                  print("User Signed Out");
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
        ],
        title: Padding(
          padding: const EdgeInsets.fromLTRB(2,12,2,24),
          child: Text('Dashboard',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0)),
        ),
      ),
      body: StaggeredGridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        children: <Widget>[
          _buildTile(
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('How may I help you?',
                              style: TextStyle(color: Colors.blueAccent)),
                          Text(widget.user,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 30.0))
                        ],
                      ),
                      Material(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(24.0),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(Icons.line_weight,
                                color: Colors.white, size: 30.0),
                          )))
                    ]),
              ),
              onTap: () => {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DataCollectionForm();
                    }))
                  }),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.blue,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Icon(Icons.equalizer,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Farm Data',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text("Keep an eye on Farms",
                        style: TextStyle(color: Colors.black45)),
                  ]),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return FarmDataList(aadharNumber: widget.aadharNumber);
                }),
              ),
            },
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.amber,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.notifications,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 16.0)),
                    Text('Weather',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text('Next Week', style: TextStyle(color: Colors.black45)),
                  ]),
            ),
            onTap: () => checkWeather(context),
          ),
          _buildTile(
              Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Crop Yield',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 30.0)),
                              Text('Data',
                                  style: TextStyle(color: Colors.green)),
                            ],
                          ),
                          DropdownButton(
                              hint: Text("Select Crop"),
                              isDense: true,
                              value: actualDropdown,
                              onChanged: (String value) => setState(() {
                                    actualDropdown = value;
                                    yieldText(actualDropdown);
                                    reqyieldText(actualDropdown);
                                    actualChart = chartDropdownItems
                                        .indexOf(value); // Refresh the chart
                                  }),
                              items: chartDropdownItems.map((String title) {
                                return DropdownMenuItem(
                                  value: title,
                                  child: Text(title,
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0)),
                                );
                              }).toList())
                        ],
                      ),
                      Padding(padding: EdgeInsets.only(bottom: 2.0)),
                      Text("Total Yield of $actualDropdown"),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(yielda,
                                style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text('Mg/ha')
                          ],
                        ),
                      ),
                      Text("Required yield of $actualDropdown"),
                      FittedBox(
                        fit: BoxFit.cover,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(reqYielda,
                                style: TextStyle(
                                  color: Colors.green[400],
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w700,
                                )),
                            Text('Mg/ha')
                          ],
                        ),
                      ),
                      /*
                      Sparkline(
                        data: charts[actualChart],
                        lineWidth: 5.0,
                        lineColor: Colors.greenAccent,
                      )

                       */
                    ],
                  )),
            ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.teal,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.attach_money,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 24.0)),
                    Text('Compensation',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 19.0)),
                    Text("Request Compensation",
                        style: TextStyle(color: Colors.black45, fontSize: 14)),
                  ]),
            ),
          ),
          _buildTile(
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Material(
                        color: Colors.red,
                        shape: CircleBorder(),
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.store_mall_directory,
                              color: Colors.white, size: 30.0),
                        )),
                    Padding(padding: EdgeInsets.only(bottom: 8.0)),
                    Text('Shop',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0)),
                    Text("The Farmer's Shop",
                        style: TextStyle(color: Colors.black45)),
                  ]),
            ),
            onTap: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => MyShop())),
          ),
        ],
        staggeredTiles: [
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(2, 250.0),
          StaggeredTile.extent(1, 180.0),
          StaggeredTile.extent(1, 180.0),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return Images(aadharNumber: widget.aadharNumber,);
        }));
      },child:Icon(Icons.camera),backgroundColor: Colors.lightGreen,),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Colors.white,
        color: Colors.white,
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }

  void checkWeather(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WeatherScreen();
    }));
  }
}
