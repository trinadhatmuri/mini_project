import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medic/screens/home/doctorInfo.dart';
import 'package:medic/screens/home/patientInfo.dart';
import 'package:medic/services/auth.dart';

class Profile extends StatelessWidget {
  AuthService auth = AuthService();
  String uploadFolderName = '';
  String targetFolder() {
    return uploadFolderName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyProfile'),
        backgroundColor: Colors.green[400],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                    'Fill your profile. If you are a doctor click on Doctor else click on Patient. Note: This cannot be changed later.'),
              ),
            ),
            Container(
              height: 30.0,
              width: double.infinity,
              color: Colors.grey[100],
              child: Row(
                children: [
                  SizedBox(width: 50),
                  FlatButton(
                      onPressed: () async {
                        final uid = await auth.getcurrentUID();
                        await Firestore.instance
                            .collection('Doctors')
                            .document(uid)
                            .updateData({"uploadFolderName": "Doctors"});
                        uploadFolderName = 'Doctors';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DoctorInfo()));
                      },
                      child: Text('Doctor')),
                  SizedBox(width: 20),
                  FlatButton(
                      onPressed: () async {
                        final uid = await auth.getcurrentUID();
                        await Firestore.instance
                            .collection('Patients')
                            .document(uid)
                            .updateData({"uploadFolderName": "Patients"});
                        uploadFolderName = 'Patients';
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientInfo()));
                      },
                      child: Text('Patient')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
