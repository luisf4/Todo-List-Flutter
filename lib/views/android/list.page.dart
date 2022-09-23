// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_list/controllers/task.controller.dart';

class ListPage extends StatelessWidget {
  final taskControler = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Task List"), actions: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Icon(Icons.task),
        )
      ]),
      body: ListView.builder(
          itemCount: taskControler.read().length,
          itemBuilder: (_, index) {
            final task = taskControler.read()[index];
            return CheckboxListTile(
              value: task.finished,
              onChanged: null,
              title: Text(task.name!),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/create');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
