import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:medic/myAppointmentsList.dart';

class MyAppointments extends StatefulWidget {
  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;

  Future<void> _getUser() async {
    user = await _auth.currentUser();
  }

  @override
  Void initState() {
    super.initState();
    _getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'My Appointments',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        padding: EdgeInsets.only(right: 10, left: 10, top: 10),
        child: MyAppointmentList(),
      ),
    );
  }
}
