import 'package:flutter/material.dart';

import 'create.page.dart';
import 'list.page.dart';

class AndroidApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListPage(),
      routes: {
        '/lista':(context) => ListPage(),
        '/create':(context) => CreatePage(),
      }
    );
  }
}