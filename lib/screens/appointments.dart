import 'package:flutter/material.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Find your doctor'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.location_pin),
          ),
        ],
      ),
      body: Center(
        child: GridView.extent(
          primary: false,
          padding: const EdgeInsets.all(16),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200.0,
          children: <Widget>[
            Container(
              width: 100.00,
              height: 150.00,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.greenAccent, Colors.lightBlueAccent]),
              ),
              child: Center(
                child: Column(
                  // add Column
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Welcome',
                        style: TextStyle(
                            // your text
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pinkAccent)),
                    FlatButton(
                      onPressed: () {},
                      child: Text('Button'),
                    ), // your button beneath text
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
