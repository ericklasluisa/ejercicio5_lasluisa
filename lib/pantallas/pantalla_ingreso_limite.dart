import '../logica/logica_pesca.dart';
import 'package:flutter/material.dart';
import 'pantalla_pesca.dart';

class PantallaIngresoLimite extends StatelessWidget {
  final TextEditingController _controladorLimite = TextEditingController();
  final LogicaPesca logicaPesca = LogicaPesca();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Límite de KG. de pesca permitidos:")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.anchor, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            TextField(
              controller: _controladorLimite,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Ingrese el límite de kilos",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                int limite = int.tryParse(_controladorLimite.text) ?? 0;
                if (limite > 0) {
                  logicaPesca.establecerLimite(limite);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PantallaPesca(
                        logicaPesca: logicaPesca,
                      ),
                    ),
                  );
                  _controladorLimite.clear();
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Por favor, ingrese un valor válido."),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text("Continuar"),
            ),
          ],
        ),
      ),
    );
  }
}
