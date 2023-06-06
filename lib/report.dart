
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';
import 'getData.dart';

bool swiftcolor = false;

class Report extends StatefulWidget {
  final String name;
  const Report({required this.name, super.key});

  @override
  State<Report> createState() => _ReportState();
}


class _ReportState extends State<Report> {
      late Map<String, dynamic> weatherData = {};

    @override
    void initState() {
      super.initState();
      fetchWeatherData().then((data) {
        setState(() {
          weatherData = data;
        });
      }).catchError((error) {
        print('Error fetching weather data: $error');
      });
    }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor:
            swiftcolor ? lightThemeBackgroundColor : darkThemeBackgroundColor,
        appBar: AppBar(
          title: RichText(
            text: TextSpan(
                text: 'Hi ',
                style: TextStyle(
                    fontFamily: 'Opens Sans',
                    fontSize: 20,
                    color: swiftcolor ? Colors.black : Colors.white),
                children: [
                  TextSpan(
                      text: widget.name + '!',
                      style: GoogleFonts.sourceSansPro(
                          fontWeight: FontWeight.bold))
                ]),
          ),
          backgroundColor:
              swiftcolor ? lightThemeBackgroundColor : darkThemeBackgroundColor,
          elevation: 0.0,

          actions: [
            Icon(Icons.dark_mode,
                color: swiftcolor ? Colors.black : Colors.white),
            Switch(
              value: swiftcolor,
              activeColor: Colors.black,
              activeTrackColor: Colors.grey,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
              onChanged: (value) {
                setState(() {
                  swiftcolor = value;
                });
              },
            ),
            Icon(
              Icons.light_mode,
              color: swiftcolor ? Colors.black : Colors.white,
            ),
          ],
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
                    fontSize: 21,
                    color: swiftcolor ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: size.height * 0.50,
                width: size.width,
                margin: const EdgeInsets.only(right: 30, left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    gradient: swiftcolor
                        ? const LinearGradient(
                            colors: [
                                Color.fromRGBO(0, 0, 0, 1.0),
                                Color.fromRGBO(67, 67, 67, 1.0)
                              ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)
                        : const LinearGradient(
                            colors: [
                                Color.fromRGBO(93,65,87, 1.0),
                                Color.fromRGBO(168,202,186, 1.0)
                              ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['location']['name']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            color: swiftcolor ? Colors.white : Colors.white,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['location']['localtime']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            color: swiftcolor ? Colors.white : Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w300)),
                    const SizedBox(height: 15),
                    Image.network(
                      weatherData.isNotEmpty &&
                              weatherData['current']['condition']['icon'] !=
                                  null
                          ? 'https:' +
                              weatherData['current']['condition']['icon']
                          : 'https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                      height: 50,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['condition']['text']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            color: swiftcolor ? Colors.white : Colors.white,
                            fontSize: 25)),
                    const SizedBox(
                      height: 15,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: weatherData.isNotEmpty
                                ? '${weatherData['current']['temp_c']}'
                                : 'Loading...',
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
                      height: 35,
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
                              color: swiftcolor ? Colors.white : Colors.white,
                              width: size.width * 0.08,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weatherData.isNotEmpty
                                  ? '${weatherData['current']['wind_kph']}'
                                  : 'Loading...',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Wind',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15, color: Colors.white),
                            )
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/cloudy.png',
                              width: size.width * 0.08,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weatherData.isNotEmpty
                                  ? '${weatherData['current']['cloud']}'
                                  : 'Loading...',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Humidity',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15, color: Colors.white),
                            )
                          ],
                        )),
                        Expanded(
                            child: Column(
                          children: [
                            Image.asset(
                              'assets/winddirection.png',
                              width: size.width * 0.08,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              weatherData.isNotEmpty
                                  ? '${weatherData['current']['wind_dir']}'
                                  : 'Loading...',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Direction',
                              style: GoogleFonts.sourceSansPro(
                                  fontSize: 15, color: Colors.white),
                            )
                          ],
                        ))
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Gust',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 15,
                            color: swiftcolor ? Colors.black : Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['gust_kph']}'
                            : 'Loading',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: swiftcolor ? Colors.black38 : Colors.grey),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'UV',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 15,
                            color: swiftcolor ? Colors.black : Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['uv']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: swiftcolor ? Colors.black38 : Colors.grey),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Wind',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 15,
                            color: swiftcolor ? Colors.black : Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['wind_kph']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: swiftcolor ? Colors.black38 : Colors.grey),
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
                            fontSize: 15,
                            color: swiftcolor ? Colors.black : Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['pressure_mb']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: swiftcolor ? Colors.black38 : Colors.grey),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Precipitation',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 15,
                            color: swiftcolor ? Colors.black : Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['precip_mm']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 18,
                            color: swiftcolor ? Colors.black38 : Colors.grey),
                      ),
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text(
                        'Last Update',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 15,
                            color: swiftcolor ? Colors.black : Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        weatherData.isNotEmpty
                            ? '${weatherData['current']['last_updated']}'
                            : 'Loading...',
                        style: GoogleFonts.sourceSansPro(
                            fontSize: 15, color: Colors.green[700]),
                      ),
                    ],
                  )),
                ],
              )
            ],
          ),
        ));
  }
}
