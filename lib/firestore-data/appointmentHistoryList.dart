import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class AppointmentHistoryList extends StatefulWidget {
  @override
  _AppointmentHistoryListState createState() => _AppointmentHistoryListState();
}

class _AppointmentHistoryListState extends State<AppointmentHistoryList> {
  // Static data to replace Firebase data
  final List<Map<String, String>> appointments = [
    {
      'doctor': 'Dr. John Doe',
      'date': '2023-10-01T10:00:00',
    },
    {
      'doctor': 'Dr. Jane Smith',
      'date': '2023-09-25T14:30:00',
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: appointments.isEmpty
          ? Text(
              'History Appears here...',
              style: GoogleFonts.lato(
                color: Colors.grey,
                fontSize: 18,
              ),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 5),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.blueGrey[50],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment['doctor'] ?? '',
                            style: GoogleFonts.lato(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _dateFormatter(appointment['date'] ?? ''),
                            style: GoogleFonts.lato(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
