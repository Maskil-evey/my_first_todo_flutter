import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app/widget/list_view.dart';

import '../controller/todo+controller.dart';
// import '../widget/todo_dialog.dart';
// import 'package:todo_app/widget/todo_tile.dart';

class TodoHomepage extends StatelessWidget {
  TodoHomepage({super.key});
  final TextEditingController _text = TextEditingController();
  final TodoController contrl = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: const Text(
          'TO DO',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.yellow,
        elevation: 0,
        centerTitle: true,
      ),
      body: const TodoListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.dialog(AlertDialog(
            title: const Text('Add Task'),
            backgroundColor: Colors.yellow[200],
            content: TextField(
              controller: _text,
              decoration: const InputDecoration(
                hintText: 'Enter Task Name',
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  contrl.addTask(_text.text);
                  // contrl.updateTask();
                  _text.clear();
                  Get.back();

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  foregroundColor: Colors.black,
                ),
                child: const Text('Add'),
              ),
            ],
          ));
        },
        backgroundColor: Colors.yellow,
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
    );
  }
}
