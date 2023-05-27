import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class Report extends StatefulWidget {
  String name;
  Report({required this.name, super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              text: 'Hi ',
              style: const TextStyle(
                fontFamily: 'Opens Sans',
                fontSize: 20,
              ),
              children: [
                TextSpan(
                    text:  widget.name + '!',
                    style:
                        GoogleFonts.sourceSansPro(fontWeight: FontWeight.bold))
              ]),
        ),
        backgroundColor: backgroundColor,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Text(
                "Today's Report",
                style: GoogleFonts.sourceSansPro(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
