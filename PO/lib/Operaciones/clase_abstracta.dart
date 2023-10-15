// Clase abstracta Operacion
abstract class Operacion {
  int suma(int a, int b);

  int resta(int a, int b);

  int multiplicacion(int a, int b);
}

// Clase derivada que implementa Operacion
class OperacionImplementada extends Operacion {
  @override
  int suma(int a, int b) {
    return a + b;
  }

  @override
  int resta(int a, int b) {
    return a - b;
  }

  @override
  int multiplicacion(int a, int b) {
    return a * b;
  }
}

void operacion1() {
  // Crear una instancia de la clase derivada
  OperacionImplementada operacion = OperacionImplementada();

  // Ejemplo de uso de los métodos
  print('Suma: ${operacion.suma(10, 5)}'); // Imprime: Suma: 15
  print('Resta: ${operacion.resta(10, 5)}'); // Imprime: Resta: 5
  print('Multiplicación: ${operacion.multiplicacion(10, 5)}'); // Imprime: Multiplicación: 50
}