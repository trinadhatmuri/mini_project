import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:medic/screens/home/bookingScreen.dart';
import 'package:medic/screens/home/profile.dart';

class docProfile extends StatefulWidget {
  DocumentSnapshot refDoc;
  docProfile({this.refDoc});

  @override
  _docProfileState createState() => _docProfileState();
}

class _docProfileState extends State<docProfile> {
  Profile profile = new Profile();

  @override
  Future<Widget> _getImage(BuildContext context) async {
    String imageName;

    final id = widget.refDoc.documentID;

    Profile profile = Profile();
    final String uploadFolderName = profile.targetFolder();

    imageName = uploadFolderName + '/' + id + '/profilePicture';
    print(imageName);

    Image image;
    await FireStorageService.loadImage(context, imageName).then((value) {
      image = Image.network(
        value.toString(),
        fit: BoxFit.fill,
      );
    });
    return image;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's Profile"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: CircleAvatar(
                minRadius: 75.0,
                maxRadius: 90.0,
                child: FutureBuilder(
                    future: _getImage(context),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 1.2,
                          child: snapshot.data,
                        );
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          width: 100.0,
                          height: 100.0,
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Container();
                    }),
              ),
            ),
            SizedBox(height: 20),
            Text("Name: " + widget.refDoc.data['fullName']),
            SizedBox(height: 10.0),
            Text("Email: " + widget.refDoc.data['email']),
            SizedBox(height: 10.0),
            Text("Mobile: " + widget.refDoc.data['mobile']),
            SizedBox(height: 10.0),
            Text("Specialisation: " + widget.refDoc.data['specialisation']),
            SizedBox(height: 10.0),
            Text("Qualification:  " + widget.refDoc.data['qualification']),
            SizedBox(height: 10.0),
            Text("License Number: " + widget.refDoc.data['licenseNumber']),
            SizedBox(height: 10.0),
            Text("Address: " + widget.refDoc.data['address']),
            SizedBox(height: 10.0),
            RaisedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => BookingScreen(
                              doctor: widget.refDoc.data['fullName'])));
                },
                child: Text('Book')),
          ],
        ),
      ),
    );
  }
}

class FireStorageService extends ChangeNotifier {
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context, String Image) async {
    return await FirebaseStorage.instance.ref().child(Image).getDownloadURL();
  }
}
