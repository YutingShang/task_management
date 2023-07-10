import 'package:flutter/material.dart';
import 'package:task_management/components/task_card.dart';
import 'package:task_management/data/tasks.dart';

import '../components/filter_pills.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task Management'),
        centerTitle: true,
        leading: const Icon(Icons.person),
      ),
      body: Column(
        children: [
          FilterPills(onSelected: (value) {
            // TODO: Add filter code here
          }),
          Expanded(
            //TODO: Later this needs to be replaced with a list of cards
            child: Center(child: TaskCard(taskList[0])),
          ),
        ],
      ),
    );
  }
}
