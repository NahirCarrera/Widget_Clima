import 'package:flutter/material.dart';
import '../model/clima_modelo.dart';

class ClimaWidgetVista extends StatelessWidget {
  final Clima clima;

  const ClimaWidgetVista({Key? key, required this.clima}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.blue[50], // Fondo de la tarjeta en azul pastel
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Bordes redondeados
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              clima.cityName,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800], // Color del nombre de la ciudad
              ),
            ),
            SizedBox(height: 10),
            Text(
              "${clima.temperature.toStringAsFixed(1)}°C",
              style: TextStyle(
                fontSize: 48,
                color: Colors.blue[800], // Color de la temperatura
              ),
            ),
            SizedBox(height: 10),
            Text(
              clima.description,
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                color: Colors.blue[600], // Color de la descripción
              ),
            ),
          ],
        ),
      ),
    );
  }
}
