import 'package:flutter/material.dart';
import 'package:onehabit/themes/color.dart';

BoxDecoration LinearBackground() {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [BackgroundPurple, BackgroundPurpleSecondary]),
  );
}
