import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Editreport extends StatefulWidget {
  DocumentSnapshot docToEdit;
  Editreport({this.docToEdit});

  @override
  _EditreportState createState() => _EditreportState();
}

class _EditreportState extends State<Editreport> {
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState() {
    title = TextEditingController(text: widget.docToEdit.data['title']);
    content = TextEditingController(text: widget.docToEdit.data['content']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        FlatButton(
            onPressed: () {
              widget.docToEdit.reference.updateData({
                'title': title.text,
                'content': content.text
              }).whenComplete(() => Navigator.pop(context));
            },
            child: Text('save')),
        FlatButton(
            onPressed: () {
              widget.docToEdit.reference
                  .delete()
                  .whenComplete(() => Navigator.pop(context));
            },
            child: Text('Delete')),
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
