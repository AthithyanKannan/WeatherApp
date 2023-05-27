import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class Report extends StatefulWidget {
  final String name;
  const Report({required this.name, super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    text: widget.name + '!',
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
            const SizedBox(
              height: 20,
            ),
            Container(
              height: size.height * 0.65,
              width: size.width,
              margin: const EdgeInsets.only(right: 15, left: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  gradient: const LinearGradient(colors: [
                    Color.fromRGBO(20, 136, 204, 1.0),
                    Color.fromRGBO(43, 50, 178, 1.0)
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Chennai',
                      style: GoogleFonts.sourceSansPro(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text('Mon 03 2023',
                      style: GoogleFonts.sourceSansPro(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300)),
                  const SizedBox(height: 10),
                  Image.asset(
                    'assets/sunny1.png',
                    height: 80,
                  ),
                  Text("Sunny",
                      style: GoogleFonts.sourceSansPro(
                          color: Colors.white, fontSize: 35)),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: '17',
                          style: TextStyle(fontSize: 35), // Normal text style
                        ),
                        TextSpan(
                          text: '°',
                          style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
