import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'add_screen.dart';
import 'edit_screen.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: Hive.box('tasks').length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Card(
              color: Colors.grey.shade400,
              child: ListTile(
                title: Text(
                  Hive.box('tasks').getAt(index)['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Text(
                  Hive.box('tasks').getAt(index)['description'],
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.black),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditScreen(index: index),
                          ),
                        ).then((value) => setState(() {}));
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        Hive.box('tasks').deleteAt(index);
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          ).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add, size: 30, color: Colors.black),
      ),
    );
  }
}
