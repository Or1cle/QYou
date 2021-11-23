// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:flutter/material.dart';

import 'Add.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QYou',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const MyHomePage(title: 'QYou'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<String> names = [];
  late List<String> descs = [];
  late List<DateTime> times = [];
  late DateTime _timeNow;
  // This block of code gets the current time and formats it pretty
  // setState() is called which rebuilds the widgets, upadting the display
  // if this isnt called data remains static
  // initState calls get time every second which forces a state update
  @override
  void initState() {
    _timeNow = DateTime.now();
    Timer.periodic(Duration(milliseconds: 100), (Timer t) => _getTime());
    super.initState();
  }
  void _getTime() {
    final DateTime now = DateTime.now();
    setState(() {
      _timeNow = now;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: ListView.builder
        (
          itemCount: names.length,
          itemBuilder: (BuildContext ctxt, int index){
            return Dismissible(
            child: ListTile(
              title: Text(
                names[index].toString() + " Time in queue: " 
                +  _timeNow.difference(times[index]).toString().substring(0,7)
                ,style: TextStyle(fontSize: 20)),
              subtitle: Text(descs[index], style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic)),
             ),
            key: Key(names[index].toString()+times[index].toString()),
            background: Container(
              color: Colors.red,
              child: const Icon(Icons.delete)
            ),
            onDismissed: (direction) {
              setState(() {
                times.removeAt(index);
                descs.removeAt(index);
                names.removeAt(index);
              });});
          },
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final userIn = await Navigator.push(context,
            MaterialPageRoute(builder: (context) => Add()),
          );
          //Splits string
          var parts = userIn.split(':');
          var userName = parts[0].trim();
          var userDesc = parts.sublist(1).join(':').trim();

          names.add(userName);
          descs.add(userDesc);
          times.add(DateTime.now());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}