class LogicaPesca {
  int limite = 0;
  int total = 0;

  void establecerLimite(int limiteIngresado) {
    limite = limiteIngresado;
  }

  bool agregarPesca(int kilos) {
    total += kilos;
    return total > limite;
  }

  int obtenerTotal() {
    return total;
  }

  int limiteRestante() {
    return limite - total;
  }

  void reiniciar() {
    total = 0;
    limite = 0;
  }
}
