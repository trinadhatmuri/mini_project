import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:medic/screens/home/upload.dart';

class DoctorInfo extends StatefulWidget {
  @override
  _DoctorInfoState createState() => _DoctorInfoState();
}

class _DoctorInfoState extends State<DoctorInfo> {
  //formkey
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  //controllers
  TextEditingController fullName = TextEditingController();
  TextEditingController specialisation = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController mobileNum = TextEditingController();
  TextEditingController licenseNum = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController email = TextEditingController();
  //firestore instance
  final CollectionReference _ref = Firestore.instance.collection('Doctors');
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: SingleChildScrollView(
          child: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Full Name ', hintText: 'John Doe'),
                controller: fullName,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter a name';
                  }
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Specialisation',
                    hintText: 'Cardiologist... if none enter NONE'),
                controller: specialisation,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter a Specialisation.. if none enter NONE';
                  }
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Full address',
                    hintText: 'D/No , street , city , PIN'),
                controller: address,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter an address';
                  }
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Mobile number', hintText: '9876543210'),
                controller: mobileNum,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter a Mobile Number';
                  } else if (value.length != 10) {
                    return 'Enter a valid Mobile Number';
                  }
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'License Number', hintText: '1234'),
                controller: licenseNum,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter your license number';
                  }
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Qualification', hintText: 'MBBS...'),
                controller: qualification,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter your Quailfication';
                  }
                }),
            SizedBox(height: 10.0),
            TextFormField(
                decoration: InputDecoration(
                    labelText: 'Email', hintText: 'johndoe@gmail.com'),
                controller: email,
                validator: (value) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value)) {
                    return 'Enter a valid Email';
                  }
                }),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => uploadImage()));
              },
              child: Text('Upload image'),
            ),
            SizedBox(height: 10.0),
            RaisedButton(
                onPressed: () async {
                  final FirebaseUser user = await auth.currentUser();
                  final uid = user.uid;
                  if (_formkey.currentState.validate()) {
                    _ref.document(uid).setData({
                      "uid": uid,
                      "fullName": fullName.text,
                      "specialisation": specialisation.text,
                      "address": address.text,
                      "mobile": mobileNum.text,
                      "licenseNumber": licenseNum.text,
                      "qualification": qualification.text,
                      "email": email.text
                    }).whenComplete(() => Navigator.pop(context));
                  }
                },
                child: Text('submit'))
          ],
        ),
      )),
    );
  }
}
