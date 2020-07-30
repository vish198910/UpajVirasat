import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

// Access a Cloud Firestore instance from your Activity
Firestore db = Firestore.instance;

class FarmDataList extends StatefulWidget {
  final String aadharNumber;

  FarmDataList({Key key, this.aadharNumber});

  @override
  _FarmDataListState createState() => _FarmDataListState();
}

class _FarmDataListState extends State<FarmDataList> {
// Reference to a Collection
  CollectionReference notesCollectionRef = db.collection('notes');
  QuerySnapshot lands;

  getData(String cropName, {int aadharNumber}) async {
    return await Firestore.instance
        .collection('Crops')
        .document("$cropName")
        .collection("Yield")
        .getDocuments();
  }

  @override
  void initState() {
    getData("wheat").then((results) {
      setState(() {
        lands = results;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: _carList(),
        ),
      ),
    );
  }

  Widget _carList() {
    if (lands != null) {
      return ListView.builder(
        itemCount: lands.documents.length,
        padding: EdgeInsets.all(5.0),
        itemBuilder: (context, i) {
          print(lands.documents[i].documentID);
          print(widget.aadharNumber);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTile(
              lands.documents[i].documentID == widget.aadharNumber ? ListTile(
                title: lands.documents[i].documentID == widget.aadharNumber
                    ? Text(
                        lands.documents[i].data['yield']
                            .toString()
                            .toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ): Text(
                        "Check Your Aadhar Number",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text("Current Crop Name : Land ${i + 1}"),
              ) : Center(),
              
            ),
          );
        },
      );
    } else {
      return Text('Loading, Please wait..');
    }
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 10.0,
        borderRadius: BorderRadius.circular(20.0),
        shadowColor: Color(0xFFEEFFE0),
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

  Stream<QuerySnapshot> getNoteList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = db.collection('notes').snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }
}
