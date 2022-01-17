import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weapp/const/colors.dart';

import 'dashboard_clipper.dart';

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