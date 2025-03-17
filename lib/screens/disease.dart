import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_and_doctor_appointment/screens/diseasedetail.dart';

class Disease extends StatefulWidget {
  @override
  _DiseaseState createState() => _DiseaseState();
}

class _DiseaseState extends State<Disease> {
  // Static data to replace Firebase data
  final List<Map<String, String>> diseases = [
    {'Name': 'Disease 1', 'Symtomps': 'Symptom 1, Symptom 2'},
    {'Name': 'Disease 2', 'Symtomps': 'Symptom 3, Symptom 4'},
    {'Name': 'Disease 3', 'Symtomps': 'Symptom 5, Symptom 6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Disease',
            style: GoogleFonts.lato(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: diseases.length,
            itemBuilder: (context, index) {
              final disease = diseases[index];
              return Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 10,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.black87,
                    width: 0.2,
                  ))),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DiseaseDetail(
                                  disease: disease['Name'] ?? 'Unknown',
                                )),
                      );
                    },
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              disease['Name'] ?? 'Unknown',
                              style: GoogleFonts.lato(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              disease['Symtomps'] ?? 'No symptoms available',
                              style: GoogleFonts.lato(
                                  fontSize: 14, color: Colors.black54),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
