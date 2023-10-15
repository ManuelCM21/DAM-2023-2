class Operacion {
  int suma(int a, int b) {
    return a + b;
  }

  int resta(int a, int b) {
    return a - b;
  }

  int multiplicacion(int a, int b) {
    return a * b;
  }
}

class OperacionDerivada extends Operacion {
  int division(int a, int b) {
    if (b != 0) {
      return a ~/ b; // División entera
    } else {
      throw Exception('No se puede dividir por cero.');
    }
  }
}

void operacion2() {
  OperacionDerivada operacion = OperacionDerivada();

  print('Suma: ${operacion.suma(10, 5)}'); // Imprime: Suma: 15
  print('Resta: ${operacion.resta(10, 5)}'); // Imprime: Resta: 5
  print('Multiplicación: ${operacion.multiplicacion(10, 5)}'); // Imprime: Multiplicación: 50

  try {
    print('División: ${operacion.division(10, 0)}');
  } catch (e) {
    print('Error: ${e.toString()}'); // Imprime: Error: No se puede dividir por cero.
  }
}