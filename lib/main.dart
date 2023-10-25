import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import '../Pages/home_page.dart';

void main() async {
//init the hive
  await Hive.initFlutter();
//Open box
  // ignore: unused_local_variable
  var box = await Hive.openBox('MyBox');

  //
  runApp(const Todo_App());
}

class Todo_App extends StatelessWidget {
  const Todo_App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const HomePage(),
    );
  }
}
