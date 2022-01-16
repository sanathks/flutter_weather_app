import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';

class WeatherSummaryCard extends StatelessWidget {
  final String dt;
  final String dtLabel;
  final String icon;
  final String temp;
  final String main;

  const WeatherSummaryCard({Key? key, required this.dt, required this.icon, required this.temp, required this.main, required this.dtLabel, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
      child: Card(
        child: SizedBox(
          height: 80,
          child: ListTile(
            shape: RoundedRectangleBorder(
                side: const BorderSide(width: 0.5, color: Colors.white),
                borderRadius: BorderRadius.circular(5)
            ),
            tileColor: lightPrimaryColor,
            leading: Column(
              children: [
                Text(dt, style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w300
                )),
                Text(dtLabel, style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w300
                )),
              ],
            ),
            title: SizedBox(
              width: 50,
              child: Image.network('https://openweathermap.org/img/wn/$icon@2x.png'),
            ),
            trailing: Column(
              children: [
                Text("$temp\u00B0", style: GoogleFonts.roboto(
                    fontSize: 28,
                    color: textColor,
                    fontWeight: FontWeight.w300
                )),
                Text(main, style: GoogleFonts.roboto(
                    fontSize: 18,
                    color: textColor,
                    fontWeight: FontWeight.w300
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
