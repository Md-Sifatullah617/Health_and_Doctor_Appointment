import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_and_doctor_appointment/screens/bookingScreen.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorProfile extends StatefulWidget {
  final String doctor;

  DoctorProfile({required this.doctor});
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  _launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    // Static data to replace Firebase data
    final Map<String, String> document = {
      'image': 'https://example.com/doctor.jpg',
      'name': 'Dr. John Doe',
      'type': 'Cardiologist',
      'rating': '4',
      'specification': 'Specialist in heart diseases and conditions.',
      'address': '123 Main St, Springfield, USA',
      'phone': '123-456-7890',
      'openHour': '9:00 AM',
      'closeHour': '5:00 PM',
    };

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 5),
                      child: IconButton(
                        icon: Icon(
                          Icons.chevron_left_sharp,
                          color: Colors.indigo,
                          size: 30,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(document['image']!),
                      radius: 80,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      document['name']!,
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      document['type']!,
                      style:
                          GoogleFonts.lato(fontSize: 18, color: Colors.black54),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (var i = 0; i < int.parse(document['rating']!); i++)
                          Icon(
                            Icons.star_rounded,
                            color: Colors.indigoAccent,
                            size: 30,
                          ),
                        if (5 - int.parse(document['rating']!) > 0)
                          for (var i = 0;
                              i < 5 - int.parse(document['rating']!);
                              i++)
                            Icon(
                              Icons.star_rounded,
                              color: Colors.black12,
                              size: 30,
                            ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 22, right: 22),
                      alignment: Alignment.center,
                      child: Text(
                        document['specification']!,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.place_outlined),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Text(
                              document['address']!,
                              style: GoogleFonts.lato(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height / 12,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.phone),
                          SizedBox(
                            width: 11,
                          ),
                          TextButton(
                            onPressed: () =>
                                _launchCaller("tel:" + document['phone']!),
                            child: Text(
                              document['phone']!,
                              style: GoogleFonts.lato(
                                  fontSize: 16, color: Colors.blue),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 0,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.access_time_rounded),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Working Hours',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      padding: EdgeInsets.only(left: 60),
                      child: Row(
                        children: [
                          Text(
                            'Today: ',
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            document['openHour']! +
                                " - " +
                                document['closeHour']!,
                            style: GoogleFonts.lato(
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          elevation: 2,
                          backgroundColor: Colors.indigo.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookingScreen(
                                doctor: document['name']!,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          'Book an Appointment',
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
