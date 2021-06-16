import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medic/screens/reports/addreport.dart';
import 'package:medic/screens/reports/editreport.dart';

class Reports extends StatelessWidget {
  final String uid;

  Reports({this.uid});

  final ref = Firestore.instance.collection('medic');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Reports'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => AddReport()));
          },
        ),
        body: StreamBuilder(
            stream: ref.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount:
                      snapshot.hasData ? snapshot.data.documents.length : 0,
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => Editreport(
                                    docToEdit:
                                        snapshot.data.documents[index])));
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 150,
                        color: Colors.grey[200],
                        child: Column(
                          children: [
                            Text(snapshot.data.documents[index].data['title']),
                            Text(snapshot.data.documents[index].data['content'])
                          ],
                        ),
                      ),
                    );
                  });
            }));
  }
}
