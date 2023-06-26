import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/controller/todo+controller.dart';
// import 'package:todo_app/controller/todo+controller.dart';
import 'package:todo_app/widget/todo_tile.dart';

// import '../service/hive_storage.dart';

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final controller = Get.find<TodoController>(tag: 'TodoController');

  @override
  void initState() {
    
    super.initState();

    controller.onInit();
  }

  @override
  Widget build(BuildContext context) =>
      GetBuilder<TodoController>(builder: (cont) {

        if(cont.todos.isNotEmpty){
           return ListView.builder(
            // itemCount: controller.list.length,
            itemCount: cont.todos.length,
            itemBuilder: (context, index) {
              return TodoTile(
                id: cont.todos[index].id,
                isDone: cont.todos[index].isDone,
                taskName: cont.todos[index].taskName,
                onChanged: (bool? value) {
                  cont.updateTodoCompleted(index, value!);
                },
                onDelete: (p0) {
                  cont.deleteTodoAt(index);
                },
              );
            },
          );}else{
            return const Center(child: Text('No Task Added'),);
          }
      });
}
