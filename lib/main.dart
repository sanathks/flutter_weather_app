import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/widget/dashboard_clipper.dart';
import 'package:weapp/widget/day_summary.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(title: 'Flutter Demo Home Page'),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: primaryColor,
            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height - 300) ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("Colombo", style: GoogleFonts.roboto(
                                fontSize: 26,
                                color: textColor
                            ))
                          ],
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on,
                              color: textColor,
                              size: 20.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 3),
                              child: Text("Sri Lanka", style: GoogleFonts.openSans(
                                  fontSize: 20,
                                  color: textColor
                              )),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 35),
                    child: Row(
                      children: [
                        Text("28\u00B0", style: GoogleFonts.roboto(
                          fontSize: 100,
                          color: textColor,
                          fontWeight: FontWeight.w200
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.light_mode,
                                  color: textColor,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Sunny", style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: textColor,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.device_thermostat,
                                  color: textColor,
                                  size: 20.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("H:34\u00B0 L:20\u00B0", style: GoogleFonts.roboto(
                                      fontSize: 16,
                                      color: textColor,
                                      fontWeight: FontWeight.w400
                                  ),),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 80),
                    child: Container(
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                          DaySummary(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          ClipPath(
              clipper: CurveClipper(),
              child: Container(
                height: 500,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("https://live.staticflickr.com/4642/25622879348_0605f3a5f2_b.jpg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(.6),
                          BlendMode.softLight
                      ),

                    )
                ),
              )
          )
        ],
      ),
    );
  }
}