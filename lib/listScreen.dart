import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  Map<String, bool> _tasks = {
    'Task 1': true,
    'Task 2': true,
    'Task 3': true,
    'Task 4': true,
    'Task 5': true,
    'Task 6': true,
  };

  TextEditingController _txtNewTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(10.0),
          children: _tasks.keys.map((String key) {
            return CheckboxListTile(
              title: Text(key),
              value: _tasks[key],
              onChanged: (bool? newValue) {
                setState(() {
                  _tasks[key] = newValue!;
                });
              },
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0)),
            ),
            backgroundColor: Colors.white,
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        'Add New Task',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.teal, fontSize: 26),
                      ),
                      SizedBox(height: 5.0),
                      TextField(
                        controller: _txtNewTask,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          if (_txtNewTask.text != "") {
                            setState(() {
                              _tasks[_txtNewTask.text] = false;
                              _txtNewTask.clear();
                              Navigator.pop(context);
                            });
                          }
                        },
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
