// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:telephony/telephony.dart';

class Message extends StatefulWidget {
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  final telephony = Telephony.instance;
  TextEditingController mobilenum = TextEditingController();
  TextEditingController message = TextEditingController();
  TextEditingController nummessage = TextEditingController();
  var i = 0;

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
              'Enviar mensajes a tu amigo',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: TextField(
                    controller: mobilenum,
                    decoration: const InputDecoration(
                      hintText: 'Número de teléfono móvil',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 10,
                  ),
                  child: TextField(
                    controller: nummessage,
                    decoration: const InputDecoration(
                      hintText: 'Numero de veces',
                    ),
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 10,
                    ),
                    child: TextField(
                      controller: message,
                      expands: true,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Contenido',
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        i = int.parse(nummessage.text);
                      });

                      for (int k = 1; k <= i; k++) {
                        telephony.sendSms(
                          to: mobilenum.text,
                          message: message.text,
                        );
                      }
                    },
                    child: const Text(
                      'Enviar',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
