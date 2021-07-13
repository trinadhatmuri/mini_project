import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:medic/screens/home/profile.dart';
import 'package:path/path.dart' as p;
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

class uploadReport extends StatefulWidget {
  @override
  _uploadReportState createState() => _uploadReportState();
}

class _uploadReportState extends State<uploadReport> {
  File file;
  String filename;
  String result;
  bool isUploaded = true;
  String filetype;
  String uploadDestination;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future filePicker(BuildContext context) async {
    if (filetype == 'others') {
      file = await FilePicker.getFile(type: FileType.ANY);
      filename = p.basename(file.path);
      setState(() {
        filename = p.basename(file.path);
      });
      print(filename);
      _uploadFile(file, filename);
    }
  }

  Future<Void> _uploadFile(File file, String filename) async {
    final FirebaseUser _user = await _auth.currentUser();
    final uid = _user.uid;
    uploadDestination = uid.toString() + '/Reports/' + filename;
    StorageReference storageReference;
    storageReference =
        FirebaseStorage.instance.ref().child('$uploadDestination');
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("URL is $url");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('upload reports'),
      ),
      body: ListTile(
        title: Text(
          'Attach',
          style: TextStyle(color: Colors.black54),
        ),
        leading: Icon(
          Icons.attach_file,
          color: Colors.redAccent,
        ),
        onTap: () {
          setState(() {
            filetype = 'others';
          });
          filePicker(context);
        },
      ),
    );
  }
}
