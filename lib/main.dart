import 'package:flutter/material.dart';

import 'base/pages/HomePage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => HomePage(),
    },
  ));
}
