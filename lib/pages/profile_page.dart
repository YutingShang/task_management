import 'package:flutter/material.dart';
import 'package:task_management/data/profile.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  const ProfilePage({Key? key}) : super(key: key);

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

    final person = ramona; //change the profile here

    final noProfileURL =
        'https://www.nailseatowncouncil.gov.uk/wp-content/uploads/blank-profile-picture-973460_1280.jpg';

    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: SingleChildScrollView(
        child: Card(
            margin: EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.only(
                //  right: 16,
                //  left: 16,
                top: 16,
              ),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.stretch, //made Wrap fit the entire row

                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        person.name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF3D3A3D),
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: CircleAvatar(
                        radius: 82,
                        backgroundImage:
                            NetworkImage(person.profileImgURL ?? noProfileURL),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: "${person.name} ${person.surname}",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Full Name",
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            initialValue: "${person.department}",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Department",
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            initialValue: "${person.reportingTo}",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Reporting to",
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            initialValue: "${person.shiftHours}",
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Shift",
                              contentPadding: EdgeInsets.all(16),
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Color(0xFF79747E)),
                              shape: const StadiumBorder(),
                              padding: const EdgeInsets.only(
                                  left: 16, right: 24, top: 10, bottom: 10),
                            ),
                            onPressed: () {
                              print('logout pressed');
                            },
                            icon: const Padding(
                              padding: EdgeInsets.zero,
                              child: Icon(
                                Icons.logout,
                                size: 18,
                                color: Color(0xFF6750A4),
                              ),
                            ),
                            label: const Text('Logout',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF6750A4),
                                    letterSpacing: 0.1,
                                    fontFamily: 'Roboto')),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
