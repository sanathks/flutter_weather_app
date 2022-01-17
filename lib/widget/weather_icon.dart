import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String icon;
  final double size;
  const WeatherIcon({Key? key, required this.icon, this.size = 35}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      child: Image.network('https://openweathermap.org/img/wn/$icon@2x.png'),
    );
  }
}
