import 'package:dart_todolist/dart_todolist.dart' as dart_todolist;

import 'ihm.dart';
import 'todolist.dart';

void main(List<String> arguments) async{
  ToDoList toDoList = new ToDoList();
  await IHM.menu(toDoList);
}
