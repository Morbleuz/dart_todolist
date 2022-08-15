import 'dart:io';

import 'task.dart';
import 'todolist.dart';

class IHM{

  static Future<void> menu(ToDoList toDoList) async{
    bool valide = false;
    while(!valide){
          print(
    "Choisir une option\n"
    "1 - Voir les tâches\n"
    "2 - Ajouter une/plusieurs tâches\n"
    "Q - Fin du programme\n");

    String option = stdin.readLineSync().toString();
      if(option == "1"){
        await seeTask(toDoList);
      }else if(option == "2"){
         await addTask(toDoList);
      }else if(option == "Q"){
        valide = true;
      }else{
        print("Saisir une option valide.");
      }
    }
  }
  static Future<void> addTask(ToDoList toDoList)async{
    bool taskValide = false;
    while(!taskValide){
      print("Saisir la tâche que vous souhaitez ajouter (ex: 'Faire des pâtes pour toto')");
      String task = stdin.readLineSync().toString();
      print(
      "La tâche que vous souhaitez est bien: \n"+
      task+
      "\n y/n"
      );
      String reponse = stdin.readLineSync().toString();
      if(reponse == "y"){
        toDoList.addTask(new Task(task));
        taskValide=true;
      }
    }
  }
  static Future<void> seeTask(ToDoList todoList) async{
      if(!todoList.getList().isEmpty){
        int compteur = 0;
        for(Task task in todoList.getList()){
          compteur++;
          stdout.write(compteur.toString() + "-" + task.getTask()+"\n");
        }
      }else{
        stdout.write("La liste est vide.\n");
      }

  }
}