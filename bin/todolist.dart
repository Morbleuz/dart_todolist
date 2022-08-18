import 'task.dart';

class ToDoList{
  List<Task> _todolist = [];

  ToDoList();

  bool isEmpty(){
    if (_todolist.isEmpty){
      return true;
    }else{
      return false;
    }
  }
  List<Task> getList(){
    return _todolist;
  }

  void addTask(Task task){
    _todolist.add(task);
  }
}