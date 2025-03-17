import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_and_doctor_appointment/updateUserDetails.dart';

class UserDetails extends StatefulWidget {
  @override
  _UserDetailsState createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  // Static user data to replace Firebase data
  final Map<String, String> userData = {
    'name': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '123-456-7890',
    'bio': 'A short bio about John Doe.',
    'birthDate': '01/01/1990',
    'city': 'New York',
  };

  List<String> labelName = [
    'Name',
    'Email',
    'Mobile Number',
    'Bio',
    'Birthday',
    'City',
  ];

  List<String> value = [
    'name',
    'email',
    'phone',
    'bio',
    'birthDate',
    'city',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        children: List.generate(
          6,
          (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: InkWell(
              splashColor: Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UpdateUserDetails(
                              label: labelName[index],
                              field: value[index],
                            )));
              },
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  height: MediaQuery.of(context).size.height / 14,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        labelName[index],
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        userData[value[index]]?.isEmpty ?? true
                            ? 'Not Added'
                            : userData[value[index]] ?? '',
                        style: GoogleFonts.lato(
                          color: Colors.black54,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
