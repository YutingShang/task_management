import 'package:task_management/data/task_model.dart';

final List<Task> taskList = [
  Task(
    title: 'Clean Spillage On Aisle 4',
    description:
        'Clear up using mop & cleaning solution found in store cupboard B',
    creator: 'Sandra Thomas',
    status: CompletionStatus.notStarted,
    completeBy: "08:30 am",
  ),
  Task(
    title: 'Unpack Deliveries',
    description:
        'Delivieries in Bay 6 need to be unpacked before the store opens',
    imageUrl:
        'https://i.pinimg.com/564x/81/0f/63/810f6358f7981bc162534e8208cfcc0a.jpg',
    creator: 'Sandra Thomas',
    status: CompletionStatus.inProgress,
    completeBy: "09:00 am",
  ),
  Task(
    title: 'Re-merchandise Aisle 6',
    description:
        'Use the updated planagram to merchandise aisle 6 (drinks). Check in with Stefan to make sure he’s fully unpacked Bay 5’s deliveries before you start. If you need help, Alex will be working on aisle 4 so will be on hand to support.',
    creator: 'Sandra Thomas',
    status: CompletionStatus.notStarted,
    completeBy: "11:00 am",
  ),
  Task(
    title: 'Restock Aisles 2-4',
    description:
        'Audit and restock canned foods to sauces. If you need any help Alex will be on hand to givea assitance. Make sure to properly cycle any stock in the backroom.',
    creator: 'Sandra Thomas',
    status: CompletionStatus.notStarted,
    completeBy: "12:00 pm",
  ),
];
