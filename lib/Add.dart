// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Add extends StatelessWidget{
  late String name;
  late String desc;

  Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          child: const Text('Enter Customer Information',style: TextStyle(fontSize: 24))
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          child: TextFormField(
            onChanged: (text) {name = text;}, 
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter Customer Name',
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
          child: TextFormField(
            onChanged: (text) {desc = text;}, 
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Enter reason for vist',
            ),
          ),
        ),
  ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              Navigator.pop(context,name + ":" + desc);
        },
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}