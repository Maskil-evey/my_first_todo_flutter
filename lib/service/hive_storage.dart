// import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:todo_app/model/todo_model.dart';

class HiveService {
  static Future<void> initHive() async {
    final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
    
    Hive.init(appDocumentDir.path);
    // Hive.initFlutter(appDocumentDir.path);
    Hive.registerAdapter<TodoModel>(TodoModelAdapter());
  }

  static Future<void> openBox<T>(String boxName) async {
    await Hive.openBox<T>(boxName);
  }

  static Future<void> closeBox(String boxName) async {
    await Hive.box(boxName).close();
  }
}
