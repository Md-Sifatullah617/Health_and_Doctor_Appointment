import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DiseaseDetail extends StatefulWidget {
  final String disease;
  const DiseaseDetail({required this.disease});
  @override
  _DiseaseDetailState createState() => _DiseaseDetailState();
}

class _DiseaseDetailState extends State<DiseaseDetail> {
  // Static data to replace Firebase data
  final Map<String, dynamic> diseaseData = {
    'Description': 'This is a description of the disease.',
    'Spread': 'This is how the disease spreads.',
    'Symtomps': 'These are the symptoms of the disease.',
    'Warning': 'These are the warning signs to seek medical attention.'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          widget.disease,
          style: GoogleFonts.lato(color: Colors.black),
        ),
      ),
      body: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  child: Text(
                    diseaseData['Description'],
                    style:
                        GoogleFonts.lato(color: Colors.black54, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'How does it spread?',
                        style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        diseaseData['Spread'],
                        style: GoogleFonts.lato(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Symtomps',
                        style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        diseaseData['Symtomps'],
                        style: GoogleFonts.lato(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15),
                  padding: EdgeInsets.only(left: 20, right: 20),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blueGrey[50],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Warning Signs - Seek medical attention',
                        style: GoogleFonts.lato(
                            color: Colors.black87,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        diseaseData['Warning'],
                        style: GoogleFonts.lato(
                          color: Colors.black54,
                          fontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
