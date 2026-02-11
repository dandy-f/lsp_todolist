import 'package:flutter/material.dart';
import 'package:todo_list/presentation/widgets/confirm_box.dart';
import 'package:todo_list/presentation/widgets/dialog_box.dart';
import 'package:todo_list/presentation/widgets/list_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _editController = TextEditingController();

  List toDoList = [
    ["Tugas Bahasa Inggris", false, "Belum"],
    ["Tugas Bahasa Indonesia", true, "Selesai"],
  ];

  void CreateNewTaks() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

   void editItem(int index) {
    setState(() {
      toDoList[index][0] = _controller.text;
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteItem(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
    Navigator.of(context).pop();
  }


   void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false, "Belum"]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void editTask(int index) {
    _controller.text = toDoList[index][0];
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: () => editItem(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmBox(
          onConfirm: () => deleteItem(index),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void popUpDone(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return ConfirmDone(
          isDone: toDoList[index][1],
          onConfirm: () {
            setState(() {
              toDoList[index][1] = !toDoList[index][1];
              toDoList[index][2] = toDoList[index][1] ? "Selesai" : "Belum";
            });
            Navigator.of(context).pop();
          },
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[100],
      appBar: AppBar(
        title: const Text('Todo List'),
        backgroundColor: Colors.orange[300],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: CreateNewTaks,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ListContent(
            taskName: toDoList[index][0],
            taskStatus: toDoList[index][2],
            taskCompleted: toDoList[index][1],
            onChange: (value) => checkBoxChanged(value, index),
            onEdit: () => editTask(index),
            onDelete: () => deleteTask(index),
            onDone: () => popUpDone(index),
          );
        },
      ),
    );
  }
}
