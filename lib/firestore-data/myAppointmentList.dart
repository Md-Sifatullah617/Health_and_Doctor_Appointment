import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MyAppointmentList extends StatefulWidget {
  @override
  _MyAppointmentListState createState() => _MyAppointmentListState();
}

class _MyAppointmentListState extends State<MyAppointmentList> {
  // Static data to replace Firebase data
  final List<Map<String, dynamic>> appointments = [
    {
      'id': '1',
      'doctor': 'Dr. Smith',
      'date': DateTime.now().toString(),
      'name': 'John Doe',
    },
    {
      'id': '2',
      'doctor': 'Dr. Jane',
      'date': DateTime.now().add(Duration(days: 1)).toString(),
      'name': 'Alice',
    },
  ];

  String _dateFormatter(String _timestamp) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(_timestamp));
    return formattedDate;
  }

  String _timeFormatter(String _timestamp) {
    String formattedTime =
        DateFormat('kk:mm').format(DateTime.parse(_timestamp));
    return formattedTime;
  }

  showAlertDialog(BuildContext context, String docID) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        setState(() {
          appointments.removeWhere((appointment) => appointment['id'] == docID);
        });
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Delete"),
      content: Text("Are you sure you want to delete this Appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  _compareDate(String _date) {
    if (_dateFormatter(DateTime.now().toString())
            .compareTo(_dateFormatter(_date)) ==
        0) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: appointments.isEmpty
          ? Center(
              child: Text(
                'No Appointment Scheduled',
                style: GoogleFonts.lato(
                  color: Colors.grey,
                  fontSize: 18,
                ),
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                var appointment = appointments[index];
                return Card(
                  elevation: 2,
                  child: InkWell(
                    onTap: () {},
                    child: ExpansionTile(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              appointment['doctor'] ?? '',
                              style: GoogleFonts.lato(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            _compareDate(appointment['date'] ?? '')
                                ? "TODAY"
                                : "",
                            style: GoogleFonts.lato(
                                color: Colors.green,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 0,
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          _dateFormatter(appointment['date'] ?? ''),
                          style: GoogleFonts.lato(),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, right: 10, left: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Patient name: " +
                                        (appointment['name'] ?? ''),
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Time: " +
                                        _timeFormatter(
                                          appointment['date'] ?? '',
                                        ),
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                tooltip: 'Delete Appointment',
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  showAlertDialog(context, appointment['id']);
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
