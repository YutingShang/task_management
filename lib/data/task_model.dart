enum CompletionStatus { notStarted, inProgress, completed, cancelled }

class Task {
  final String title;
  final String description;
  final String? imageUrl;
  final String creator;
  final String creatorImgUrl =
      'https://us.123rf.com/450wm/cunaplus/cunaplus1601/cunaplus160100017/50383487-portrait-of-a-saleswoman-with-crossed-arms-at-the-supermarket.jpg?ver=6';
  final CompletionStatus status;
  final String completeBy;

  Task({
    required this.title,
    required this.description,
    this.imageUrl,
    required this.creator,
    required this.status,
    required this.completeBy,
  });

  String getCompletionStatusText() {
    switch (status) {
      case CompletionStatus.notStarted:
        return 'Not started';
      case CompletionStatus.inProgress:
        return 'In progress';
      case CompletionStatus.completed:
        return 'Completed';
      case CompletionStatus.cancelled:
        return 'Cancelled';
    }
  }
}
