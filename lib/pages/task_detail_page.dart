import 'package:flutter/material.dart';
import 'package:task_management/data/task_model.dart';

class TaskDetailPage extends StatelessWidget {
  static const routeName = '/task-details';
  final Task task;

  const TaskDetailPage(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Detail')),
      body: const Center(
        child: Text('TODO: Create the task details page here'),
      ),
    );
  }
}
