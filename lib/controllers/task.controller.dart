import '../models/task.model.dart';

class TaskController {
  final tasks = [
    Task('Comprar leite'),
    Task("comer feijão ", finished: true),
  ];

  void create(Task task){
    tasks.add(task);
  }

  List<Task> read() {
    return tasks;
  }
  void update(Task task){}
  void delete(Task task){}

}