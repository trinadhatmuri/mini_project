import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:medic/appointmentsdata.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:medic/screens/appointments.dart';
import 'package:medic/screens/home/profile.dart';
import 'package:medic/screens/reports/reports.dart';
import 'package:medic/services/auth.dart';

String uid;

class NavBar extends StatelessWidget {
  final AuthService _auth = AuthService();

  final ref = Firestore.instance.collection('$uploadFolderName');

  static const url = 'https://symptomate.com/diagnosis';
  Future<Void> _launcher() async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false);
    } else {
      throw "could not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    TextStyle ProfileStyle = TextStyle(color: Colors.black87);

    Future<Widget> _getImage(BuildContext context) async {
      String imageName;
      final FirebaseAuth auth = FirebaseAuth.instance;
      final FirebaseUser user = await auth.currentUser();
      final uid = user.uid.toString();

      imageName = uploadFolderName + '/' + uid + '/ProfilePicture';

      Image image;
      await FireStorageService.loadImage(context, imageName).then((value) {
        image = Image.network(
          value.toString(),
          fit: BoxFit.scaleDown,
        );
      });
      return image;
    }

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'User',
              style: ProfileStyle,
            ),
            accountEmail: Text('Example@gmail.com'),
            currentAccountPicture: FutureBuilder(
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
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: MediaQuery.of(context).size.width / 1.2,
                      child: CircularProgressIndicator(),
                    );
                  }

                  return Container();
                }),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Profile()));
            },
          ),
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Appointments'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => doctorsData()));
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Reports'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Reports()));
            },
          ),
          ListTile(
            leading: Icon(Icons.web),
            title: Text('symptom checker'),
            onTap: () {
              _launcher();
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('logout'),
            onTap: () {
              _auth.signOut();
            },
          )
        ],
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
