import 'package:flutter/material.dart';

navigator(BuildContext context, {bool? replacement, required Widget builder}) {
  return replacement!
      ? Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => builder))
      : Navigator.push(context, MaterialPageRoute(builder: (_) => builder));
}
