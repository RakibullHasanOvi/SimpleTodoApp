import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/Pages/setting_page.dart';
import 'package:todo_app/Widgets/list_widget.dart';
import 'package:todo_app/data/database.dart';
import '../Widgets/drawer.dart';
import '../dialoag_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//Refarance the box
  final _myBox = Hive.box('Mybox');
  TodoDatabase db = TodoDatabase();

  @override
  void initState() {
// if this is the 1st time ever opening the app, then create defult value..
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
//When user exitst the app..
    } else {
      db.loadData();
    }
    super.initState();
  }

//Text Controller..
  final _controller = TextEditingController();

//ist of totolist task...
  // List totolist = [
  //   ['Rakibull Hasan Ovi', false],
  //   ['Mrs. Rakibull Hasan', false],
  // ];

//Chnage fuctions ..
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.totolist[index][1] = !db.totolist[index][1];
    });
    db.updateDatabase();
  }

//Create saveTask Fuction..
  void saveTask() {
    setState(() {
      db.totolist.add(
        [_controller.text, false],
      );
      _controller.clear();
    });
    Navigator.pop(context);
    db.updateDatabase();
  }

//Build createNewRask fuctions..
  void createNewRask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSaved: saveTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
    db.updateDatabase();
  }

  //Create deletTask functions..
  void deletTask(int index) {
    setState(() {
      db.totolist.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: Colors.yellow[200],
//FlotingActionButton Add...
        floatingActionButton: FloatingActionButton(
          onPressed: createNewRask,
          child: const Icon(
            Icons.add,
            size: 40,
          ),
        ),
//Build Drawer ..
        drawer: const DrawerWifget(),
//Appbar
        appBar: AppBar(
          elevation: 1,
          title: const Text('Todo App'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          SettingPage(
                              controller1: _controller,
                              // controller2: _controller,
                              // controller3: _controller,
                              // controller4: _controller,
                              submit: saveTask)),
                );
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
//Working body..
        body: ListView.builder(
          //Todolist calling..
          itemCount: db.totolist.length,
          itemBuilder: (context, index) {
            return ListWidget(
              name: db.totolist[index][0],
              cValue: db.totolist[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deletFuction: (context) => deletTask(index),
            );
          },
        ),
      ),
    );
  }
}
