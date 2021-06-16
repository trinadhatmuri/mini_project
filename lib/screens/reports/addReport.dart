import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddReport extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  final CollectionReference ref = Firestore.instance.collection('medic');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        FlatButton(
            onPressed: () {
              ref.add({
                'title': title.text,
                'content': content.text
              }).whenComplete(() => Navigator.pop(context));
            },
            child: Text('save')),
      ]),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: title,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TextField(
              controller: content,
              decoration: InputDecoration(hintText: 'Content'),
              maxLines: null,
              expands: true,
            ),
          ))
        ]),
      ),
    );
  }
}
