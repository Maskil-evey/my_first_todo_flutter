// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/service/hive_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../model/todo_model.dart';

class TodoController extends GetxController {
   Box<TodoModel>? todoBox;
   List<TodoModel> get todos => todoBox?.values.toList() ?? [];

  @override
  void onInit() async{
   EasyLoading.show();
   await HiveService.openBox<TodoModel>('todos').then((value) async{
      todoBox =  Hive.box<TodoModel>('todos');
    });
     update();
     EasyLoading.dismiss();
      super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    HiveService.closeBox('todos');
  }

  

 void addTask(taskName) {
    if (todoBox != null) {
      final todo = TodoModel(
        id: todoBox!.length + 1,
        taskName: taskName,
        isDone: false,
      );
      todoBox?.add(todo);

      // print(todoBox?.values);
      update();
    }
  }

 void updateTodoCompleted(int index, bool completed) {
    if (todoBox != null) {
      final todo = todoBox?.getAt(index);
      if (todo != null) {
        todo.isDone = completed;
        todoBox?.putAt(index, todo);
        update();
      }
    }
  }

   void deleteTodoAt(int index) {
    if (todoBox != null) {
      todoBox?.deleteAt(index);
      update();
    }
}
}
