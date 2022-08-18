import 'dart:io';

import 'couleur.dart';
import 'fonction.dart';
import 'task.dart';
import 'todolist.dart';

class IHM{
  static void afficheTitre(){
    Couleur.effaceScreen();
    print(                                                                                                                                                                                               
                                                                                                                                                                                                
"TTTTTTTTTTTTTTTTTTTTTTT     OOOOOOOOO     DDDDDDDDDDDDD             OOOOOOOOO     LLLLLLLLLLL             IIIIIIIIII   SSSSSSSSSSSSSSS TTTTTTTTTTTTTTTTTTTTTTT                        1111111\n"   
"T:::::::::::::::::::::T   OO:::::::::OO   D::::::::::::DDD        OO:::::::::OO   L:::::::::L             I::::::::I SS:::::::::::::::ST:::::::::::::::::::::T                       1::::::1\n"   
"T:::::::::::::::::::::T OO:::::::::::::OO D:::::::::::::::DD    OO:::::::::::::OO L:::::::::L             I::::::::IS:::::SSSSSS::::::ST:::::::::::::::::::::T                      1:::::::1\n"   
"T:::::TT:::::::TT:::::TO:::::::OOO:::::::ODDD:::::DDDDD:::::D  O:::::::OOO:::::::OLL:::::::LL             II::::::IIS:::::S     SSSSSSST:::::TT:::::::TT:::::T                      111:::::1\n"   
"TTTTTT  T:::::T  TTTTTTO::::::O   O::::::O  D:::::D    D:::::D O::::::O   O::::::O  L:::::L                 I::::I  S:::::S            TTTTTT  T:::::T  TTTTTTvvvvvvv           vvvvvvv1::::1\n"   
"        T:::::T        O:::::O     O:::::O  D:::::D     D:::::DO:::::O     O:::::O  L:::::L                 I::::I  S:::::S                    T:::::T         v:::::v         v:::::v 1::::1\n"   
"        T:::::T        O:::::O     O:::::O  D:::::D     D:::::DO:::::O     O:::::O  L:::::L                 I::::I   S::::SSSS                 T:::::T          v:::::v       v:::::v  1::::1\n"   
"        T:::::T        O:::::O     O:::::O  D:::::D     D:::::DO:::::O     O:::::O  L:::::L                 I::::I    SS::::::SSSSS            T:::::T           v:::::v     v:::::v   1::::l\n"   
"        T:::::T        O:::::O     O:::::O  D:::::D     D:::::DO:::::O     O:::::O  L:::::L                 I::::I      SSS::::::::SS          T:::::T            v:::::v   v:::::v    1::::l\n"   
"        T:::::T        O:::::O     O:::::O  D:::::D     D:::::DO:::::O     O:::::O  L:::::L                 I::::I         SSSSSS::::S         T:::::T             v:::::v v:::::v     1::::l\n"   
"        T:::::T        O:::::O     O:::::O  D:::::D     D:::::DO:::::O     O:::::O  L:::::L                 I::::I              S:::::S        T:::::T              v:::::v:::::v      1::::l\n"  
"        T:::::T        O::::::O   O::::::O  D:::::D    D:::::D O::::::O   O::::::O  L:::::L         LLLLLL  I::::I              S:::::S        T:::::T               v:::::::::v       1::::l\n"  
"      TT:::::::TT      O:::::::OOO:::::::ODDD:::::DDDDD:::::D  O:::::::OOO:::::::OLL:::::::LLLLLLLLL:::::LII::::::IISSSSSSS     S:::::S      TT:::::::TT              v:::::::v     111::::::111\n"
"      T:::::::::T       OO:::::::::::::OO D:::::::::::::::DD    OO:::::::::::::OO L::::::::::::::::::::::LI::::::::IS::::::SSSSSS:::::S      T:::::::::T               v:::::v      1::::::::::1\n"
"      T:::::::::T         OO:::::::::OO   D::::::::::::DDD        OO:::::::::OO   L::::::::::::::::::::::LI::::::::IS:::::::::::::::SS       T:::::::::T                v:::v       1::::::::::1\n"
"      TTTTTTTTTTT           OOOOOOOOO     DDDDDDDDDDDDD             OOOOOOOOO     LLLLLLLLLLLLLLLLLLLLLLLLIIIIIIIIII SSSSSSSSSSSSSSS         TTTTTTTTTTT                 vvv        111111111111\n");
  }
  static Future<void> menu(ToDoList toDoList) async{
    bool valide = false;
    while(!valide){
    Couleur.effaceScreen();
          print(
    "Bienvenue dans ToDoListV1 développer en Dart dans le terminal\n"       
    "Vous pouvez choisir une option pour continuer : \n"
    "1 - Voir les tâches\n"
    "2 - Ajouter une/plusieurs tâches\n"
    "Q - Fin du programme\n");

    String option = stdin.readLineSync().toString();
      if(option == "1"){
        await changeTask(toDoList);
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
    Couleur.effaceScreen();
    bool taskValide = false;
    while(!taskValide){
      print("Saisir la tâche que vous souhaitez ajouter (ex: 'Faire des pâtes pour toto')"+"\n'R' pour revenir sur le menu principal\n");
      String task = stdin.readLineSync().toString();
        if(task == 'R'){
          taskValide=true;
        }else{
            toDoList.addTask(new Task(task,false));
        }
      } 
    }
  //Visualiser les tâches d'une Todolist
  static Future<void> seeTask(ToDoList todolist)async{
    if(!todolist.isEmpty()){
        int compteur = 0;
        for(Task task in todolist.getList()){
          compteur++;
          if(task.isDone()){
            stdout.write(Couleur.green() + compteur.toString() + "-" +task.getTask() + Couleur.reset() + "\n");
          }else{
            stdout.write(Couleur.rouge() +  compteur.toString() + "-" + task.getTask() + Couleur.reset() + "\n");
          }
        }
    }else{
        stdout.write("La liste est vide.\n");
        await Future.delayed(Duration(seconds: 1));
      }
  }
  static Future<void> changeTask(ToDoList todoList) async{



    Couleur.effaceScreen();
    if(!todoList.isEmpty()){
      bool souhaiteLeave = false;
      while(!souhaiteLeave){
      await seeTask(todoList);
        print("Vous pouvez sélectionner une tâche afin de la marquer faite...\n('0' pour revenir au menu)");
        int reponse = Fonction.saisirInt();
        if(reponse != 0){
          if(reponse <= todoList.getList().length){
            reponse = reponse - 1;
            if(!todoList.getList()[reponse].isDone()){
               try{           
                  todoList.getList()[reponse].setDone(true);
                }catch(e){
                  print("Saisir un numéro valide");
                  print("Erreur dans le programme : "+e.toString());
                }
            }else{
                try{           
                  todoList.getList()[reponse].setDone(false);
                }catch(e){
                  print("Saisir un numéro valide");
                  print("Erreur dans le programme : "+e.toString());
                }
            }
           
          }else{
            print(Couleur.rouge() + "Saisir un nombre valide." + Couleur.reset());
            await Future.delayed(Duration(seconds: 1));
          }
        }else{
          souhaiteLeave = true;
        }
      }
  }else{
        await seeTask(todoList);
      }
    }
  }
