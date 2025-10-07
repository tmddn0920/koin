import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class GradientScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final EdgeInsetsGeometry? padding;
  final List<Color> colors;
  final List<double>? stops;
  final AlignmentGeometry begin;
  final AlignmentGeometry end;
  final Widget child;
  final bool extendBodyBehindAppBar;

  const GradientScaffold({
    super.key,
    this.appBar,
    required this.child,
    this.padding,
    this.colors = const [GRADIENT_COLOR, WHITE_COLOR],
    this.stops = const [0.0, 0.4],
    this.begin = Alignment.topCenter,
    this.end = Alignment.bottomCenter,
    this.extendBodyBehindAppBar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      appBar: appBar,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colors,
            begin: begin,
            end: end,
            stops: stops,
          ),
        ),
        child: Padding(
          padding: padding ?? EdgeInsets.zero,
          child: child,
        ),
      ),
    );
  }
}


