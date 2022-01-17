import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/model/weather_collection.dart';
import 'package:weapp/model/weather_summary_model.dart';
import 'package:weapp/widget/weather_summary_card_widget.dart';

class WeatherHourlyPage extends StatefulWidget {
  final WeatherCollection? collection;
  const WeatherHourlyPage({Key? key, this.collection}) : super(key: key);

  @override
  _WeatherHourlyPageState createState() => _WeatherHourlyPageState();
}

class _WeatherHourlyPageState extends State<WeatherHourlyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: widget.collection!.hourly.length,
        itemBuilder: (context, index) {
          WeatherSummaryModel summary =  widget.collection!.hourly[index];
          return WeatherSummaryCard(
              dt: DateFormat("h:m").format(summary.dt),
              icon: summary.icon,
              temp: summary.temp.toString(),
              main: summary.main,
              dtLabel: DateFormat("a").format(summary.dt)
          );
        },
      ),
    );
  }
}