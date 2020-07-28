import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;

class Images extends StatefulWidget {
  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  File _image;
  String _uploadedFileURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
          children: <Widget>[    
            Text('Selected Image'),    
            _image != null    
                ? Image.asset(    
                    _image.path,    
                    height: 150,    
                  )    
                : Container(height: 150),    
            _image == null    
                ? RaisedButton(    
                    child: Text('Choose File'),    
                    onPressed: chooseFile,    
                    color: Colors.cyan,    
                  )    
                : Container(),    
            _image != null    
                ? RaisedButton(    
                    child: Text('Upload File'),    
                    onPressed: uploadFile,    
                    color: Colors.cyan,    
                  )    
                : Container(),    
            _image != null    
                ? RaisedButton(    
                    child: Text('Clear Selection'),    
                    onPressed: clearSelection,    
                  )    
                : Container(),    
            Text('Uploaded Image'),    
            _uploadedFileURL != null    
                ? Image.network(    
                    _uploadedFileURL,    
                    height: 150,    
                  )    
                : Container(),    
          ],    
        ),
      ),    
    );
  }
  Future chooseFile() async {    
   await ImagePicker.pickImage(source: ImageSource.gallery).then((image) {    
     setState(() {    
       _image = image;    
     });    
   });    
 } 

 Future uploadFile() async {    
   StorageReference storageReference = FirebaseStorage.instance    
       .ref()    
       .child('FarmerImages/${Path.basename(_image.path)}}');    
   StorageUploadTask uploadTask = storageReference.putFile(_image);    
   await uploadTask.onComplete;    
   print('File Uploaded');    
   storageReference.getDownloadURL().then((fileURL) {    
     setState(() {    
       _uploadedFileURL = fileURL;    
     });    
   });    
 }

 void clearSelection(){

 }
}
