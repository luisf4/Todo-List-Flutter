// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task_list/controllers/task.controller.dart';

import '../../models/task.model.dart';

class CreatePage extends StatelessWidget {

  String? name;
  final formKey = GlobalKey<FormState>();

  void save(BuildContext context) async {
    formKey.currentState!.save();
    var taskController = TaskController();
    await taskController.create(Task(name, finished: false));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) => name = value,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: ElevatedButton(
                onPressed: () => save(context), 
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}