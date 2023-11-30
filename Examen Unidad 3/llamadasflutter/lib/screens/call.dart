// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Call extends StatefulWidget {
  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  TextEditingController phoneNumberController = TextEditingController();

  _makePhoneCall() async {
    String phoneNumber = phoneNumberController.text.trim();
    if (await canLaunchUrl(Uri.parse('tel:+51$phoneNumber'))) {
      await launchUrl(Uri.parse('tel:+51$phoneNumber'));
    } else {
      throw 'No se pudo realizar la llamada';
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(right: 0.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'home');
                },
                child: const Icon(Icons.arrow_back_ios, size: 20.0),
              ),
            ),
            titleSpacing: 0.0,
            title: const Text(
              'Realizar una llamada',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Número de celular',
                    ),
                  ),
                ),
                ElevatedButton(onPressed: _makePhoneCall, child: Text('Llamar'))
              ],
            ),
          ),
        ));
  }
}
