import 'package:flutter/material.dart';

Color getColor(BuildContext context, double precent) {
  if (precent >= .5) {
    return Theme.of(context).primaryColor;
  } else if (precent >= .25) {
    return Colors.orange;
  }
  return Colors.red;
}
