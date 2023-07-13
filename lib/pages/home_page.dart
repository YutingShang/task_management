import 'package:flutter/material.dart';
import 'package:task_management/components/task_card.dart';
import 'package:task_management/data/task_model.dart';
import 'package:task_management/data/tasks.dart';

import '../components/filter_pills.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/home';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String filterState = 'All tasks';
  List<Task> filteredList = taskList;
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
            filteredList = taskList;
            filterState = value;
            CompletionStatus completionStatus;
            if (filterState != 'All tasks') {
              //if it is, no filtering needed

              switch (filterState) {
                case "Not started":
                  completionStatus = CompletionStatus.notStarted;
                  break;
                case "In progress":
                  completionStatus = CompletionStatus.inProgress;
                  break;
                case "Completed":
                  completionStatus = CompletionStatus.completed;
                  break;
                default:
                  throw UnimplementedError("no state for filter $filterState");
              }
              //filter it
              filteredList = taskList
                  .where((task) => task.status == completionStatus)
                  .toList();
            }

            setState(() {}); //update the ui
          }),
          Expanded(
            //TODO: Later this needs to be replaced with a list of cards
            child: Center(
                child: //TaskCard(taskList[0])
                    ListView.builder(
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          return TaskCard(
                            filteredList[index],
                          );
                        })),
          ),
        ],
      ),
    );
  }
}
