// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import '../../models/task.model.dart';
import '/controllers/task.controller.dart';

class ListPage extends StatefulWidget {
  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final taskController = TaskController();

  Future<List<Map>>? tasks;

  @override
  void initState() {
    tasks = taskController.read();
    super.initState();
  }

  void updateState() {
    setState(() {
      tasks = taskController.readFiltro(_searchController);
    });
  }

  void updateTask(Task task) async {
    await taskController.update(task);
    updateState();
  }

  Future<void> deleteTask(Task task) async {
    await taskController.delete(task);
    // updateState();
  }

TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task List"),
      ),
      body: Column(
        children: [
           Padding(
             padding: const EdgeInsets.all(10.0),
             child: TextField(
              controller: _searchController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Search',
              ),
          ),
           ),
          Expanded(
            child: FutureBuilder<List<Map<dynamic, dynamic>>>(future:tasks, builder:(context, snapshot){
                  if (!snapshot.hasData)
                    return Center(
                      child: CircularProgressIndicator(),
                    );

                  if (snapshot.hasError) return Text(snapshot.error!.toString());

                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (_, index) {
                      var tasks = snapshot.data!;
                      final task = Task.fromMap(tasks[index]);
                      return Dismissible(
                        key: UniqueKey(),
                        onDismissed: (_) async => await deleteTask(task),
                        background: Container(color: Colors.red),
                        child: CheckboxListTile(
                          value: task.finished,
                          onChanged: (value) {
                            task.finished = value;
                            updateTask(task);
                          },
                          title: Text(task.name!),
                        ),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed('/create');
          updateState();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
