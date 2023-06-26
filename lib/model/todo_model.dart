import 'package:hive/hive.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel extends HiveObject{
  @HiveField(0)
  int id;
  @HiveField(1)
  String taskName;
  @HiveField(2)
  bool isDone;

  TodoModel( {required this.id, required this.taskName, required this.isDone});
}