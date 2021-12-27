import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';

class DaySummary extends StatelessWidget {
  const DaySummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Now", style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.white
            ),),
          ),
          const Icon(
            Icons.light_mode,
            color: textColor,
            size: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("20\u00B0", style: GoogleFonts.roboto(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w400
            )),
          )
        ],
      ),
    );
  }

}