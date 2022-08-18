import 'package:dart_todolist/dart_todolist.dart' as dart_todolist;

import 'ihm.dart';
import 'todolist.dart';

void main(List<String> arguments) async{
  IHM.afficheTitre();
  await Future.delayed(Duration(seconds: 1));
  ToDoList toDoList = new ToDoList();
  await IHM.menu(toDoList);
}
