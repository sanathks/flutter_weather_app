import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/model/weather_collection.dart';
import 'package:weapp/model/weather_provider.dart';
import 'package:weapp/model/weather_summary_model.dart';
import 'package:weapp/page/details_page.dart';
import 'package:weapp/widget/location_header.dart';
import 'package:weapp/widget/scroll_to_show_widget.dart';
import 'package:weapp/widget/weather_icon.dart';
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
          return FutureBuilder<WeatherCollection>(
            future: weather.fetch(),
            builder: (BuildContext context, AsyncSnapshot<WeatherCollection> snapshot) {
              if (!snapshot.hasData) {
                return Text("Loading");
              }

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
                            Text("${snapshot.data!.current.temp.toString()} \u00B0", style: GoogleFonts.roboto(
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
                                      WeatherIcon(icon: snapshot.data!.current.icon),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(snapshot.data!.current.main, style: GoogleFonts.roboto(
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
                                        child: Text("H:${snapshot.data!.current.temp.toString()}\u00B0 L:${snapshot.data!.current.feelLike.toString()}\u00B0", style: GoogleFonts.roboto(
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
                          child: ListView.builder(
                            itemCount: snapshot.data!.hourly.length,
                            itemBuilder: (context, index) {
                              WeatherSummaryModel summary =  snapshot.data!.hourly[index];
                             return WeatherSummaryCard(
                                  dt: DateFormat("h:m").format(summary.dt),
                                  icon: summary.icon,
                                  temp: summary.temp.toString(),
                                  main: summary.main,
                                  dtLabel: DateFormat("a").format(summary.dt)
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
            );
            }
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

