import 'package:flutter/material.dart';
import 'package:po/Ejercicios/03-bool-condicion.dart';
import 'package:po/Operaciones/clase_abstracta.dart';
import 'package:po/Operaciones/clase_operacion.dart';

void main() {
  print("Hola Flutter");
  definirVariables();
  main2();
  operacion1();
  operacion2();
  runApp(const MyApp());
}

void definirVariables() {
// Strings
  final String nombre = 'Tony';
  final apellido = 'Stark';
// nombre = 'Peter';
  print('$nombre $apellido');
// Números
  int empleados = 10;
  double salario = 1856.25;
  print(empleados);
  print(salario);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Text('Flutter Demo Home Page'),
    );
  }
}
