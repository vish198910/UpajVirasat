import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:upajVirasat/Screens/CRUD/crud.dart';

// Access a Cloud Firestore instance from your Activity
Firestore db = Firestore.instance;

class FarmDataList extends StatefulWidget {
  @override
  _FarmDataListState createState() => _FarmDataListState();
}

class _FarmDataListState extends State<FarmDataList> {
// Reference to a Collection
  CollectionReference notesCollectionRef = db.collection('notes');

  CrudMedthods crudObj;
  QuerySnapshot lands;

  getData(int aadharNumber) async {
    return await Firestore.instance
        .collection('users')
        .document("$aadharNumber")
        .collection("lands")
        .getDocuments();
  }

  @override
  void initState() {
    getData(222222222222).then((results) {
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
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: _buildTile(
              ListTile(
                title: Text(lands.documents[i].data['currentCropName'].toString().toUpperCase(),style: TextStyle(fontWeight:FontWeight.bold),),
                subtitle: Text("Current Crop Name : Land ${i+1}"),
              ),
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
