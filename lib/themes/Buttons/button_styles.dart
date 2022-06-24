import 'package:flutter/material.dart';

import '../color.dart';

ButtonStyle defaultButton() {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Purple),
    padding: MaterialStateProperty.all<EdgeInsets>(
        EdgeInsets.only(left: 40, right: 40, top: 20, bottom: 20)),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
        side: BorderSide(
          color: Purple,
          width: 3.0,
        ),
      ),
    ),
  );
}
