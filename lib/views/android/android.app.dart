// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:task_list/views/android/create.page.dart';
import 'package:task_list/views/android/list.page.dart';


class AndroidApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
      routes: {
        '/lista':(context) => ListPage(),
        '/create':(context) => CreatePage(),
      },
    );
  }
}