import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/report.dart';
import 'colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 90,
            ),
            const Center(
              child: Image(
                height: 200,
                width: 200,
                image: AssetImage(
                  'assets/welcomeicon.png',
                ),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
             Text(
              "Discover the Weather",
              style: GoogleFonts.sourceSansPro(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
             Text(
              "in Your City",
              style: GoogleFonts.sourceSansPro(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
             Text(
              "Get to know your weather maps and",
              style: GoogleFonts.sourceSansPro(
                  color: Colors.grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 5.0,
            ),
             Text(
              "radar precipatation forecase",
              style: GoogleFonts.sourceSansPro(
                  color: Colors.grey,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            textBox('Enter your name', namecontroller, TextInputType.name),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
              onPressed: () {
                if (namecontroller.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      'Name Field Required',
                      style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    behavior: SnackBarBehavior.floating,
                  ));
                } else {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Report(name: namecontroller.text.trim()),
                      ),
                      (route) => false);
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 149, 255, 1.0),
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 90.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  textStyle: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  )),
              child: const Text('Get Started'),
            )
          ],
        ),
      ),
    );
  }

  Widget textBox(
      String hint, TextEditingController controller, TextInputType type) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      margin: const EdgeInsets.symmetric(vertical: 12),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(217, 217, 217, 1.0),
          borderRadius: BorderRadius.circular(12)),
      height: 50,
      child: TextFormField(
        keyboardType: type,
        cursorColor: Colors.black,
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        decoration: InputDecoration(hintText: hint, border: InputBorder.none),
      ),
    );
  }
}
