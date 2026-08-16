import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class EditScreen extends StatefulWidget {
  final int index;
   EditScreen({super.key, required this.index});


  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  var task = Hive.box('tasks');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Task',style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
        ),),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                labelText: 'Task Title',
                hintText: 'Enter task title',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.shade800,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                labelText: 'Task Description',
                hintText: 'Enter task description',
                labelStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
                hintStyle: TextStyle(
                  color: Colors.grey.shade800,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    fixedSize: Size(double.infinity, 60),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: (){
                    var data={
                      'title': titleController.text,
                      'description': descriptionController.text
                    };
                    Hive.box('tasks').putAt(widget.index, data);
                    Navigator.pop(context);
                    titleController.clear();
                    descriptionController.clear();
                  },
                  child:  Text('Update'),),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    foregroundColor: Colors.black,
                    fixedSize: Size(double.infinity, 60),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child:  Text('Cancel'),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
