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
              height: size.height * 0.55,
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
                  const SizedBox(
                    height: 5,
                  ),
                  Text("Sunny",
                      style: GoogleFonts.sourceSansPro(
                          color: Colors.white, fontSize: 35)),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '17',
                          style: GoogleFonts.sourceSansPro(fontSize: 35),
                        ),
                        TextSpan(
                          text: '°',
                          style: GoogleFonts.sourceSansPro(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              textBaseline: TextBaseline.alphabetic),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/wind.png',
                            color: Colors.white,
                            width: size.width * 0.10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '19.1 km/h',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Wind',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'assets/cloudy.png',
                            width: size.width * 0.10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '81',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Humidity',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      )),
                      Expanded(
                          child: Column(
                        children: [
                          Image.asset(
                            'assets/winddirection.png',
                            width: size.width * 0.10,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'SE',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18, color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            ' Direction',
                            style: GoogleFonts.sourceSansPro(
                                fontSize: 18, color: Colors.white),
                          )
                        ],
                      ))
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Gust',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '32.0 kp/h',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'UV',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '1.0',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Wind',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '19.1 km/h',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, color: Colors.white),
                    ),
                  ],
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Pressure',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '1025.0hpa',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Precipitation',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '0.0',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, color: Colors.white),
                    ),
                  ],
                )),
                Expanded(
                    child: Column(
                  children: [
                    Text(
                      'Last Update',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      '2022-03-20 21:30',
                      style: GoogleFonts.sourceSansPro(
                          fontSize: 18, color: Colors.green[700]),
                    ),
                  ],
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
