import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:medic/screens/home/profile.dart';

class uploadImage extends StatefulWidget {
  @override
  _uploadImageState createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
  final Profile _profile = Profile();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String imageUrl;
  String uploadDestination;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Upload Image')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            (imageUrl != null)
                ? Image.network(imageUrl)
                : Placeholder(
                    fallbackHeight: 200.0, fallbackWidth: double.infinity),
            SizedBox(height: 20.0),
            RaisedButton(
                child: Text('Upload Image'),
                color: Colors.lightBlue,
                onPressed: () async {
                  await uploadImage();
                }),
          ],
        ),
      ),
    );
  }

  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    final FirebaseUser user = await _auth.currentUser();
    final uid = user.uid.toString();

    uploadDestination = uid + '/profilePicture';

    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null) {
        var snapshot = await _storage
            .ref()
            .child('$uploadDestination')
            .putFile(file)
            .onComplete;

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        setState(() {
          print('No path Recieved');
        });
      }
    } else {
      setState(() {
        print('Grant permission and try again');
      });
    }
  }
}
