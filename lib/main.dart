import 'package:myfirstflutter/events_app.dart';
import 'package:myfirstflutter/screen/welcome_screen.dart';
import 'package:flutter/material.dart';

// Text : widget
var afficheText = const Text(
  "Hello",
  //TextStyle : widget
  style: TextStyle(
    fontSize: 20.0,
    color: Colors.grey,
  ),
);

var afficheIcon = const Icon(
  Icons.email,
  color: Colors.amber,
  size: 25,
);

void main() {
  runApp(EventsApp());
}