import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/model/weather_provider.dart';
import 'package:weapp/page/details_page.dart';
import 'package:weapp/service/weather_data_service.dart';
import 'package:weapp/widget/dashboard_clipper.dart';
import 'package:weapp/widget/day_summary.dart';
import 'package:weapp/widget/scroll_to_show_widget.dart';
import 'package:weapp/widget/weather_summary_card_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<WeatherProvider>(
        builder: (context, weather, child) {
          return CustomScrollView(
            controller: scrollController,
            physics: const ClampingScrollPhysics(),
            slivers: <Widget>[
              SliverPersistentHeader(
                delegate: LocationHeader(expandedHeight: 500),
                pinned: true,
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor,
                        blurRadius: 0.0,
                        spreadRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Container(
                      height: 16,
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor,
                        blurRadius: 0.0,
                        spreadRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 35),
                    child: Row(
                      children: [
                        Text("${weather.data.current.temp.toString()} \u00B0", style: GoogleFonts.roboto(
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
                                  SizedBox(
                                    height: 35,
                                    child: Image.network('https://openweathermap.org/img/wn/10d@2x.png'),
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
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 530,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor,
                        blurRadius: 0.0,
                        spreadRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child:  Padding(
                    padding: const EdgeInsets.only(left: 20, top: 40),
                    child: Container(
                      height: 200,
                      child: ListView(
                        children: const [
                          WeatherSummaryCard(
                              dt: "08:00",
                              icon: "03n",
                              temp: "20",
                              main: "Sunny",
                              dtLabel: "PM"
                          ),
                          WeatherSummaryCard(
                              dt: "08:00",
                              icon: "03n",
                              temp: "20",
                              main: "Sunny",
                              dtLabel: "PM"
                          ),
                          WeatherSummaryCard(
                              dt: "08:00",
                              icon: "03n",
                              temp: "20",
                              main: "Sunny",
                              dtLabel: "PM"
                          ),
                          WeatherSummaryCard(
                              dt: "08:00",
                              icon: "03n",
                              temp: "20",
                              main: "Sunny",
                              dtLabel: "PM"
                          ),
                          WeatherSummaryCard(
                              dt: "08:00",
                              icon: "03n",
                              temp: "20",
                              main: "Sunny",
                              dtLabel: "PM"
                          ),
                          WeatherSummaryCard(
                              dt: "08:00",
                              icon: "03n",
                              temp: "20",
                              main: "Sunny",
                              dtLabel: "PM"
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
      floatingActionButton:  ScrollToShowWidget(
        scrollController: scrollController,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DetailsPage()),
            );
          },
          backgroundColor: Colors.white,
          child: const Icon(Icons.more_vert, color: primaryColor,),
        ),
      ),
    );
  }
}

class LocationHeader extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  LocationHeader({required this.expandedHeight});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double shrinkPercentage = min(1, shrinkOffset / (maxExtent - minExtent)) * 100;

    return Stack(
      fit: StackFit.expand,
      children: [

        Container(
          color: primaryColor,
        ),
        ClipPath(
            clipper: CurveClipper(shrink: shrinkPercentage),
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://live.staticflickr.com/4642/25622879348_0605f3a5f2_b.jpg"),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(.6),
                      BlendMode.softLight
                  ),
                ),
                boxShadow: const [
                  BoxShadow(
                    //color: primaryColor,
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            )
        ),
        Positioned(
          top: expandedHeight / 1.3 - shrinkOffset,
          left: 40,
          child: Container(
            color: primaryColor,
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
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}