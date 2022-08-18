class Task{
  String _task = "";
  bool _done = false;

  Task(String task, bool done){
    _task = task;
    _done = false;
  }

  String getTask(){
    return _task;
  }
  void setDone(bool done){
    _done = done;
  }
  bool isDone(){
    if(_done){
      return true;
    }else{
      return false;
    }
  }
}