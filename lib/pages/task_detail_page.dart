import 'package:flutter/material.dart';
import 'package:task_management/data/task_model.dart';

class TaskDetailPage extends StatelessWidget {
  static const routeName = '/task-details';
  final Task task;

  const TaskDetailPage(this.task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.titleSmall!.copyWith(
      fontSize: 16,
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w500,
      color: Color(0xFF49454F),
      letterSpacing: 0.1,
    );

    final textStyle = theme.textTheme.titleSmall!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: Color(0xFF4C4C4C),
        letterSpacing: 0.1,
        fontFamily: 'Roboto');

    var notStartedButton = OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Color(0xFF79747E)),
        shape: const StadiumBorder(),
        padding:
            const EdgeInsets.only(left: 16, right: 24, top: 10, bottom: 10),
      ),
      onPressed: () {
        print('onPressed');
      },
      icon: const Padding(
        padding: EdgeInsets.zero,
        child: Icon(
          Icons.start,
          size: 18,
        ),
      ),
      label: const Text('Start',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6750A4),
              letterSpacing: 0.1,
              fontFamily: 'Roboto')),
    );

    var inProgressButton = OutlinedButton.icon(
      style: OutlinedButton.styleFrom(
        backgroundColor: const Color(0xFF6750A4),
        side: const BorderSide(color: Color(0xFF6750A4)),
        shape: const StadiumBorder(),
        padding:
            const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
      ),
      onPressed: () {
        print('onPressed');
      },
      icon: const Padding(
        padding: EdgeInsets.zero,
        child: Icon(
          Icons.check_circle,
          size: 18,
          color: Colors.white,
        ),
      ),
      label: const Text('Mark as Complete',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              letterSpacing: 0.1,
              fontFamily: 'Roboto')),
    );

    var statusButton;

    if (task.status == CompletionStatus.notStarted) {
      statusButton = notStartedButton;
    } else if (task.status == CompletionStatus.inProgress) {
      statusButton = inProgressButton;
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Task Detail')),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
              margin: EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                  //  right: 16,
                  //  left: 16,
                  top: 24,
                  bottom: 24,
                ),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment
                        .stretch, //made Wrap fit the entire row

                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, bottom: 24),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.checklist,
                              size: 28,
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Text(
                              task.title,
                              style: titleStyle,
                            ),
                          ],
                        ),
                      ),
                      // const SizedBox(
                      //   height: 24,
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 16, left: 16, top: 8, bottom: 8),
                        child: Row(
                          children: [
                            FittedBox(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                    size: 24,
                                    color: Color(0xFF4C4C4C),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    task.completeBy,
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            FittedBox(
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.remove_circle_outline,
                                    size: 24,
                                    color: Color(0xFF4C4C4C),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    task.getCompletionStatusText(),
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (task.imageUrl != null)
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.network(task.imageUrl!),
                        ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, right: 16, left: 16),
                        child: Text(task.description,
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: ' Roboto',
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF49454F),
                              letterSpacing: 0.25,
                            )),
                      ),
                      Padding(
                        //Avatar of the task creator
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 16, right: 16),
                        child: Row(
                          children: [
                            CircleAvatar(
                                radius: 21,
                                backgroundImage:
                                    NetworkImage(task.creatorImgUrl)),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              'Assigned by ${task.creator}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xFF4C4C4C),
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Roboto',
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 24, right: 16, left: 16),
                        child: Wrap(
                          //Wrap - place in row if space, otherwise wrap
                          direction: Axis.horizontal,
                          alignment: WrapAlignment
                              .spaceBetween, //adds space between, like Expanded or Spacer() for Flex widgets (row or column)
                          runSpacing: 8,
                          children: [
                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                side:
                                    const BorderSide(color: Color(0xFF79747E)),
                                shape: const StadiumBorder(),
                                padding: const EdgeInsets.only(
                                    left: 16, right: 24, top: 10, bottom: 10),
                              ),
                              onPressed: () {
                                print('cannot complete pressed');
                              },
                              icon: const Padding(
                                padding: EdgeInsets.zero,
                                child: Icon(
                                  Icons.cancel_outlined,
                                  size: 18,
                                ),
                              ),
                              label: const Text('Cannot Complete',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF6750A4),
                                      letterSpacing: 0.1,
                                      fontFamily: 'Roboto')),
                            ),
                            statusButton,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
