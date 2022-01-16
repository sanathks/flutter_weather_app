import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';

class WeatherNowPage extends StatefulWidget {
  const WeatherNowPage({Key? key}) : super(key: key);

  @override
  _WeatherNowPageState createState() => _WeatherNowPageState();
}

class _WeatherNowPageState extends State<WeatherNowPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 80,
                child: Image.network('https://openweathermap.org/img/wn/10d@2x.png'),
              ),
              Column(
                children: [
                  Text("Today", style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.w400
                  )),
                  Text("Set, 3 Aug", style: GoogleFonts.roboto(
                      fontSize: 12,
                      color: textColor,
                      fontWeight: FontWeight.w400
                  ))
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("28\u00B0", style: GoogleFonts.roboto(
                  fontSize: 100,
                  color: textColor,
                  fontWeight: FontWeight.w200
              ))
              ,
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Weather Description", style: GoogleFonts.roboto(
                  fontSize: 18,
                  color: Colors.white70,
                  fontWeight: FontWeight.w200
              ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text("Feel Like: 32", style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                    )),
                    Text("     ", style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w200
                    )),
                    Text("Sunset: 20:15", style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                    )),
                  ],
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: InkWell(
                    highlightColor: lightPrimaryColor,
                    onTap: () {

                    },
                    child: SizedBox(
                      width: 300,
                      height: 300,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: lightPrimaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(3))
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Center(
                            child: Table(
                              border: const TableBorder(horizontalInside: BorderSide(width: 1, color: primaryColor, style: BorderStyle.solid)),
                              children: [
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Sunrise", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("20:15", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Sunset", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("20:15", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                    ]
                                ), //Sunrise and set
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Pressure", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("1013", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Humidity", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("64", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Dew Point", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("293.85", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("UVI", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("8.75", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Clouds", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("90", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Visibility", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("10000", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                    ]
                                ),
                                TableRow(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Wind Speed", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("2.41", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(children:  [
                                          Text("Wind Degree", style: GoogleFonts.roboto(
                                              fontSize: 14,
                                              color: textColor,
                                              fontWeight: FontWeight.w300
                                          )),
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: Text("26", style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: textColor,
                                                fontWeight: FontWeight.w300
                                            )),
                                          ),
                                        ]),
                                      ),
                                    ]
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

