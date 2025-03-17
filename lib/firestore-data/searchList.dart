import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_and_doctor_appointment/screens/doctorProfile.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

class SearchList extends StatefulWidget {
  final String searchKey;

  SearchList({required this.searchKey});

  @override
  _SearchListState createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  // Static data to replace Firebase data
  final List<Map<String, dynamic>> doctors = [
    {
      'name': 'Dr. John Doe',
      'image': 'https://via.placeholder.com/150',
      'type': 'Cardiologist',
      'rating': 4.5
    },
    {
      'name': 'Dr. Jane Smith',
      'image': 'https://via.placeholder.com/150',
      'type': 'Dermatologist',
      'rating': 4.7
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: doctors.isEmpty
            ? Center(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Doctor found!',
                        style: GoogleFonts.lato(
                          color: Colors.blue[800],
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/error-404.jpg'),
                        height: 250,
                        width: 250,
                      ),
                    ],
                  ),
                ),
              )
            : Scrollbar(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: doctors.length,
                  itemBuilder: (context, index) {
                    var doctor = doctors[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Card(
                        color: Colors.blue[50],
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 9,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DoctorProfile(
                                    doctor: doctor['name'],
                                  ),
                                ),
                              );
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(doctor['image']),
                                  radius: 25,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      doctor['name'],
                                      style: GoogleFonts.lato(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      doctor['type'],
                                      style: GoogleFonts.lato(
                                          fontSize: 16, color: Colors.black54),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Icon(
                                          Typicons.star_full_outline,
                                          size: 20,
                                          color: Colors.indigo[400],
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          doctor['rating'].toString(),
                                          style: GoogleFonts.lato(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.indigo,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
