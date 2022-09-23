// ignore_for_file: use_key_in_widget_constructors, unused_import, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_list/views/android/list.page.dart';


class CreatePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Task'),),
      body: Form(child: Column(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width,
          child: TextField()),
          SizedBox(
            width: MediaQuery.of(context).size.width -30,
            child: ElevatedButton(
              onPressed: () {Navigator.of(context).pop();},
              child: Text('Save'),
            ),
          ),
        ],
      )),
    );
  }
}