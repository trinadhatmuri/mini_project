import 'package:medic/models/user.dart';
import 'package:medic/screens/authenticate/Authenticate.dart';
import 'package:flutter/material.dart';
import 'package:medic/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
