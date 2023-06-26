import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
// import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/service/hive_storage.dart';
import 'package:todo_app/views/homepage.dart';

import 'controller/todo+controller.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initHive();
 var box = Get.put<TodoController>(TodoController(), tag: 'TodoController'); 
  box.onInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          primaryColor: Colors.yellow,
          useMaterial3: true,
        ),
        home: TodoHomepage(),
        builder: EasyLoading.init(),);
  }
}
