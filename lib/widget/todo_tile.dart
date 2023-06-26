import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:todo_app/controller/todo+controller.dart';

class TodoTile extends StatelessWidget {
   TodoTile({super.key, required this.taskName, required this.isDone, required this.id, this.onChanged, this.onDelete});
  final String taskName;
  final bool isDone;
  final int id;
  final Function(bool?)? onChanged;
  final Function(BuildContext?)? onDelete;

  final TodoController controller = Get.find<TodoController>();



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25,top:25),
      child: Slidable(
        endActionPane: ActionPane(
          motion:const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onDelete,
              backgroundColor: Colors.red,
              icon: Icons.delete,
              label: 'Delete',
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding:const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children:[
                //ckeckbox
                Checkbox(
                  value: isDone,
                  onChanged: onChanged,
                  checkColor: Colors.white,
                  fillColor: MaterialStateProperty.all(Colors.black),
                ),
                // taskname
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 20,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                  ),
                ),
            ]
          ),
        ),
      ),
    );
  }
}