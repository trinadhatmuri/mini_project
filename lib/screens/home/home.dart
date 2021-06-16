import 'package:flutter/material.dart';
import 'package:medic/screens/home/doctorInfo.dart';
import 'package:medic/services/auth.dart';
import 'package:medic/screens/home/sideNavBar.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Text('Medic'),
      ),
      body: Center(
        child: Text('Home Screen', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
