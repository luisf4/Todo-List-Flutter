class Task
{
  int? id;
  String? name;
  bool? finished;

  Task(this.name, {this.finished=false});

  Task.fromMap(Map<dynamic, dynamic> map) {
    id = map['id'];
    name = map['name'];
    finished = map['finished'] == 1 ? true : false;
  }

  Map<String, dynamic> toMap() {    
    return {
      'id': id,
      'name': name,
      'finished': finished! ? 1 : 0,
    };
  }
}