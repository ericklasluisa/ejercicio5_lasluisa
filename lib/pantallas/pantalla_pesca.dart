import 'package:flutter/material.dart';
import '../logica/logica_pesca.dart';

class PantallaPesca extends StatefulWidget {
  final LogicaPesca logicaPesca;

  PantallaPesca({required this.logicaPesca});

  @override
  _PantallaPescaState createState() => _PantallaPescaState();
}

class _PantallaPescaState extends State<PantallaPesca> {
  final TextEditingController _logicaPesca = TextEditingController();

  void _registrarPesca() {
    int kilos = int.tryParse(_logicaPesca.text) ?? 0;
    if (kilos > 0) {
      bool limiteSuperado = widget.logicaPesca.agregarPesca(kilos);

      setState(() {}); // Actualizamos la interfaz

      if (limiteSuperado) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: Text("¡Límite Superado!"),
            content: Text(
              "Has pescado ${widget.logicaPesca.obtenerTotal()} kg, excediendo el límite de ${widget.logicaPesca.limite} kg.",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  widget.logicaPesca.reiniciar();
                },
                child: Text("Finalizar"),
              ),
            ],
          ),
        );
      }

      _logicaPesca.clear();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Ingrese un valor válido.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar Pesca")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.anchor_rounded, size: 100, color: Colors.green),
            Text(
              "Límite: ${widget.logicaPesca.limite} kg",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Total pescado: ${widget.logicaPesca.obtenerTotal()} kg",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _logicaPesca,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese los kilos pescados",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _registrarPesca,
              child: Text("Registrar Peso"),
            ),
          ],
        ),
      ),
    );
  }
}
