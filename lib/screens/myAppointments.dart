import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:medic/myAppointmentsList.dart';

class MyAppointments extends StatefulWidget {
  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  String _documentID;

  Future<void> _getUser() async {
    user = await _auth.currentUser();
  }

  Future<void> deleteAppointment(String docID) async {
    return Firestore.instance
        .collection('appointments')
        .document(user.uid)
        .collection('pending')
        .document(docID)
        .delete();
  }

  String _dateFormatter(String _timestamp) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(_timestamp));
    return formattedDate;
  }

  String _timeFormatter(String _timestamp) {
    String formattedTime =
        DateFormat('kk:mm').format(DateTime.parse(_timestamp));
    return formattedTime;
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        deleteAppointment(_documentID);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Delete"),
      content: Text("Are you sure you want to delete this Appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _checkDiff(DateTime _date) {
    var diff = DateTime.now().difference(_date).inHours;
    if (diff > 2) {
      return true;
    } else {
      return false;
    }
  }

  _compareDate(String _date) {
    if (_dateFormatter(DateTime.now().toString())
            .compareTo(_dateFormatter(_date)) ==
        0) {
      return true;
    } else {
      return false;
    }
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
      body: SafeArea(
        child: StreamBuilder(
          stream: Firestore.instance
              .collection('appointments')
              .document(user.uid)
              .collection('pending')
              .orderBy('date')
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return snapshot.data.documents.length == 0
                ? Center(
                    child: Text(
                      'No Appointment Scheduled',
                      style: GoogleFonts.lato(
                        color: Colors.grey,
                        fontSize: 18,
                      ),
                    ),
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot document =
                          snapshot.data.documents[index];
                      print(_compareDate(document['date'].toDate().toString()));
                      if (_checkDiff(document['date'].toDate())) {
                        deleteAppointment(document.documentID);
                      }
                      return Card(
                        elevation: 2,
                        child: InkWell(
                          onTap: () {},
                          child: ExpansionTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    document['doctor'],
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Text(
                                  _compareDate(
                                          document['date'].toDate().toString())
                                      ? "TODAY"
                                      : "",
                                  style: GoogleFonts.lato(
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 0,
                                ),
                              ],
                            ),
                            subtitle: Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                _dateFormatter(
                                    document['date'].toDate().toString()),
                                style: GoogleFonts.lato(),
                              ),
                            ),
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 20, right: 10, left: 16),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Patient name: " + document['name'],
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "Time: " +
                                              _timeFormatter(
                                                document['date']
                                                    .toDate()
                                                    .toString(),
                                              ),
                                          style: GoogleFonts.lato(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                      tooltip: 'Delete Appointment',
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.black87,
                                      ),
                                      onPressed: () {
                                        print(
                                            ">>>>>>>>>" + document.documentID);
                                        _documentID = document.documentID;
                                        showAlertDialog(context);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
