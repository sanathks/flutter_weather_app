import 'package:flutter/material.dart';
import 'package:weapp/const/colors.dart';

import 'dashboard_clipper.dart';

class LocationCover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: CurveClipper(shrink: 0),
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
    );
  }

}