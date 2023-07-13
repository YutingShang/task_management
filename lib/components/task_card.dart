import 'package:flutter/material.dart';
import 'package:task_management/data/task_model.dart';
import 'package:flutter/rendering.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard(this.task, {Key? key}) : super(key: key);

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
    var buttonSize;
    if (task.status == CompletionStatus.notStarted) {
      statusButton = notStartedButton;
      buttonSize = 102;
    } else if (task.status == CompletionStatus.inProgress) {
      statusButton = inProgressButton;
      buttonSize = 191;
    }

    //return const Text('TODO: Make your card component here');
    return Column(
      //wrap your card in a Column because the inner Column take full height
      children: [
        Card(
            margin: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                //  right: 16,
                //  left: 16,
                top: 24,
                bottom: 16,
              ),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, //made Wrap fit the entire row
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
                    if (task.imageUrl != null) Image.network(task.imageUrl!),
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
                      padding:
                          const EdgeInsets.only(top: 16, right: 16, left: 16),
                      child: Wrap(
                        //Wrap - place in row if space, otherwise wrap
                        direction: Axis.horizontal,
                        alignment: WrapAlignment
                            .spaceBetween, //adds space between, like Expanded or Spacer() for Flex widgets (row or column)
                        runSpacing: 8,
                        children: [
                          FittedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .start, //align both rows to the left
                              children: [
                                Row(
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
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
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
                              ],
                            ),
                          ),
                          AdjustableLineButtonWidget(
                              statusButton: statusButton,
                              buttonSize: buttonSize)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}

class AdjustableLineButtonWidget extends StatelessWidget {
  final OutlinedButton statusButton;
  final buttonSize;
  const AdjustableLineButtonWidget(
      {super.key, required this.statusButton, required this.buttonSize});

  @override
  Widget build(BuildContext context) {
    // debugPaintSizeEnabled = true;
    return LayoutBuilder(builder: (context, constraints) {
      final leftTextSize = 120; //width of the time and status

      final bool buttonOnNextLine =
          constraints.maxWidth - buttonSize < leftTextSize;
      if (!buttonOnNextLine) {
        // print('buttonSize $buttonSize');
        return statusButton;
      } else {
        // print('buttonSize $buttonSize');
        // print('context ${constraints.maxWidth}');
        return Align(alignment: Alignment.centerRight, child: statusButton);
      }
    });
  }
}
