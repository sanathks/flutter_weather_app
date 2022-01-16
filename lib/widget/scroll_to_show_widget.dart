import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:developer';

class ScrollToShowWidget extends StatefulWidget {
  final Widget child;
  final ScrollController scrollController;
  final Duration duration;

  const ScrollToShowWidget({
    Key? key,
    required this.child,
    required this.scrollController,
    this.duration = const Duration(milliseconds: 200)
  }) : super(key: key);

  @override
  _ScrollToShowWidgetState createState() => _ScrollToShowWidgetState();
}

class _ScrollToShowWidgetState extends State<ScrollToShowWidget> {
  bool _isVisible = false;

  @override
  void initState() {
    _isVisible = false;
    super.initState();
    widget.scrollController.addListener(listen);
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(listen);
    super.dispose();
  }

  void show() {
    if(!_isVisible)  {
      setState(() {
        _isVisible = true;
      });
    }
  }
  void hide() {
    if(_isVisible)  {
      setState(() {
        _isVisible = false;
      });
    }
  }

  void listen () {
     final direction = widget.scrollController.position.pixels;
      log("$direction");
     if (direction > 150) {
       show();
     } else {
       hide();
     }

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: widget.duration,
      height: _isVisible ? kBottomNavigationBarHeight : 0,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1 : 0,
        duration: widget.duration,
        child: widget.child,
      ),
    );
  }
}
