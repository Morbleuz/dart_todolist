import 'task.dart';

class ToDoList{
  List<Task> _todolist = [];

  ToDoList();

  List<Task> getList(){
    return _todolist;
  }

  void addTask(Task task){
    _todolist.add(task);
  }
}