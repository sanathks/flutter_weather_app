import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';
import 'package:weapp/page/weather_hourly_page.dart';
import 'package:weapp/page/weather_next_days_page.dart';
import 'package:weapp/page/weather_now_page.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onTab(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Colombo"),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit_location_alt),
              tooltip: 'Increase volume by 10',
              onPressed: () {

              },
            )
          ],

        ),
        body: renderContent(),
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: onTab,
        backgroundColor: primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.event, ),
            label: 'Now',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, ),
            label: 'Next Hours',
            backgroundColor: primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today,  ),
            label: 'Next 7 Days',
            backgroundColor: primaryColor,
          ),
        ],
      ),
    );
  }

  Widget renderContent() {
    if (_selectedIndex == 1 ) {
      return WeatherHourlyPage();
    }

    if (_selectedIndex == 2 ) {
      return WeatherNextDaysPage();
    }

    return const WeatherNowPage();
  }
}
