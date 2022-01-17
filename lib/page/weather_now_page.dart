import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/model/weather_collection.dart';
import 'package:weapp/widget/weather_icon.dart';

class WeatherNowPage extends StatefulWidget {
  final WeatherCollection? collection;
  const WeatherNowPage({Key? key, required this.collection}) : super(key: key);

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
             WeatherIcon(icon: widget.collection!.current.icon, size: 80,),
              Column(
                children: [
                  Text("Today", style: GoogleFonts.roboto(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.w400
                  )),
                  Text(DateFormat("EEE, d MMM").format(DateTime.now()), style: GoogleFonts.roboto(
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
              Text("${widget.collection!.current.temp.toString()}\u00B0", style: GoogleFonts.roboto(
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
              Text(widget.collection!.current.description, style: GoogleFonts.roboto(
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
                    Text("Feel Like: ${widget.collection!.current.feelLike}", style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                    )),
                    Text("     ", style: GoogleFonts.roboto(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w200
                    )),
                    Text("Sunset: ${DateFormat("H:m").format(widget.collection!.current.sunset)}", style: GoogleFonts.roboto(
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
                                            child: Text(DateFormat("H:m").format(widget.collection!.current.sunrise), style: GoogleFonts.roboto(
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
                                            child: Text(DateFormat("H:m").format(widget.collection!.current.sunset), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.pressure.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.humidity.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.dewPoint.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.uvi.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.clouds.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.visibility.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.windSpeed.toString(), style: GoogleFonts.roboto(
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
                                            child: Text(widget.collection!.current.windDeg.toString(), style: GoogleFonts.roboto(
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

