import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/widget/weather_summary_card_widget.dart';

class WeatherHourlyPage extends StatefulWidget {
  const WeatherHourlyPage({Key? key}) : super(key: key);

  @override
  _WeatherHourlyPageState createState() => _WeatherHourlyPageState();
}

class _WeatherHourlyPageState extends State<WeatherHourlyPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      height: MediaQuery.of(context).size.height,
      child: ListView(
        children:  const [
              WeatherSummaryCard(
                  dt: "08:00",
                  icon: "03d",
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
          WeatherSummaryCard(
              dt: "08:00",
              icon: "03n",
              temp: "20",
              main: "Sunny",
              dtLabel: "PM"
          ),

        ],
      ),
    );
  }
}