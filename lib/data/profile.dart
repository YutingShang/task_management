class Profile {
  final String name;
  final String? profileImgURL;
  final String surname;
  final String department;
  final String reportingTo;
  final String shiftHours;

  Profile(
      {required this.name,
      required this.surname,
      this.profileImgURL,
      required this.department,
      required this.reportingTo,
      required this.shiftHours});
}

Profile ramona = Profile(
    name: "Ramona",
    surname: "Davies",
    department: "Groceries",
    profileImgURL:
        'https://www.bizcover.com.au/bizwitty/wp-content/uploads/2020/03/thumbnail_2580807_Supermarket-worker.jpg',
    reportingTo: "Sandra Thomas",
    shiftHours: "07:00 - 15:00");

Profile john = Profile(
    name: "John",
    surname: "Jackson",
    department: "Groceries",
    reportingTo: "Sandra Thomas",
    shiftHours: "09:00 - 18:00");
