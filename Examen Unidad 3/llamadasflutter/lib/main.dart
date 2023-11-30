// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:llamadasflutter/screens/call.dart';
import 'package:llamadasflutter/screens/home.dart';
import 'package:llamadasflutter/screens/message.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Llamadas y Mensajes',
        initialRoute: 'home',
        routes: {
          'home': ( _ ) => Home(),
          'message': ( _ ) => Message(),
          'call': ( _ ) => Call()
        },);
  }
}