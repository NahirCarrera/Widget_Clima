import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/clima_modelo.dart';

class ClimaControlador {
  final String apiKey = "c20dacfb74e624a1d742f7b08a724ec3";

  Future<Clima?> obtenerClima(String ciudad) async {
    final url = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?q=$ciudad&units=metric&appid=$apiKey&lang=es");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Clima.fromJson(data);
    } else {
      print("Error al obtener el clima: ${response.statusCode}");
      return null;
    }
  }
}
