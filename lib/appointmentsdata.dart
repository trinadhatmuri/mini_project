import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class doctorsData extends StatefulWidget {
  @override
  _doctorsDataState createState() => _doctorsDataState();
}

class _doctorsDataState extends State<doctorsData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctors'),
      ),
      body: StreamBuilder(
        stream: Firestore.instance.collection('Doctors').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: snapshot.hasData ? snapshot.data.documents.length : 0,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {},
                child: ProductBox(
                  name: snapshot.data.documents[index].data["fullName"],
                  address: snapshot.data.documents[index].data["address"],
                  mobile_number: snapshot.data.documents[index].data["mobile"],
                  specialisation:
                      snapshot.data.documents[index].data["specialisation"],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox(
      {Key key,
      this.name,
      this.address,
      this.mobile_number,
      this.specialisation})
      : super(key: key);
  final String name;
  final String address;
  final String mobile_number;
  final String specialisation;

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 110,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(this.name,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(this.address),
                    Text(this.mobile_number),
                    Text(this.specialisation)
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
