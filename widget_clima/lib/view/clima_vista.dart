import 'package:flutter/material.dart';
import '../controller/clima_controlador.dart';
import 'clima_widget.dart';
import '../model/clima_modelo.dart';

class ClimaVista extends StatefulWidget {
  @override
  _ClimaVistaState createState() => _ClimaVistaState();
}

class _ClimaVistaState extends State<ClimaVista> {
  final TextEditingController _ciudadController = TextEditingController();
  final ClimaControlador _controlador = ClimaControlador();
  Clima? _clima;

  void _buscarClima() async {
    final ciudad = _ciudadController.text;
    if (ciudad.isNotEmpty) {
      final clima = await _controlador.obtenerClima(ciudad);
      setState(() {
        _clima = clima;
      });
    }
  }

  // Método para devolver el ícono dependiendo del clima
  IconData _getWeatherIcon(String description) {
    switch (description.toLowerCase()) {
      case 'cielo claro':
        return Icons.wb_sunny; // Cielo despejado (Sol)
      case 'pocas nubes':
        return Icons.cloud_queue; // Pocas nubes
      case 'nubes':
        return Icons.cloud; // Nubes dispersas
      case 'nubes rotas':
        return Icons.cloud_outlined; // Nubes rotas
      case 'lluvia ligera':
        return Icons.umbrella; // Lluvia ligera
      case 'tormenta':
        return Icons.bolt; // Tormenta
      case 'nieve':
        return Icons.ac_unit; // Nieve
      case 'niebla':
        return Icons.waves; // Niebla
      default:
        return Icons.help; // Desconocido
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50], // Fondo en tonos pastel
      appBar: AppBar(
        backgroundColor: Colors.blue[300], // Barra superior azul pastel
        title: Text("Clima", style: TextStyle(color: Colors.white)),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              _clima != null ? _getWeatherIcon(_clima!.description) : Icons.cloud,
              size: 50,
              color: Colors.blue[300], // Color pastel
            ),
            SizedBox(height: 20),
            TextField(
              controller: _ciudadController,
              decoration: InputDecoration(
                labelText: "Ingresa el nombre de la ciudad",
                labelStyle: TextStyle(color: Colors.blue[500]),
                hintText: "Ej. Quito, Guayaquil",
                hintStyle: TextStyle(color: Colors.blue[200]),
                prefixIcon: Icon(Icons.search, color: Colors.blue[500]), // Icono de búsqueda
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue[200]!),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              style: TextStyle(color: Colors.blue[800]),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _buscarClima,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[300], // Botón en azul pastel
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
                child: Text(
                  "Buscar",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 30),
            if (_clima != null)
              ClimaWidgetVista(clima: _clima!)
            else
              Text(
                "Ingresa una ciudad para ver su clima",
                style: TextStyle(color: Colors.blue[500]),
              ),
          ],
        ),
      ),
    );
  }
}
