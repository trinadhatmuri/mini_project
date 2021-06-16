import 'package:flutter/material.dart';
import 'package:medic/screens/appointments.dart';
import 'package:medic/screens/home/profile.dart';
import 'package:medic/screens/reports/reports.dart';
import 'package:medic/services/auth.dart';

class NavBar extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    TextStyle ProfileStyle = TextStyle(color: Colors.black87);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              'User',
              style: ProfileStyle,
            ),
            accountEmail: Text('example@gmail.com', style: ProfileStyle),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(),
            ),
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
                  MaterialPageRoute(builder: (context) => Appointments()));
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
