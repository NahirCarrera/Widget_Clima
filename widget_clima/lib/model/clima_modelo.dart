class Clima {
  final String cityName;
  final double temperature;
  final String description;

  Clima({required this.cityName, required this.temperature, required this.description});

  factory Clima.fromJson(Map<String, dynamic> json) {
    return Clima(
      cityName: json['name'],
      temperature: json['main']['temp'],
      description: json['weather'][0]['description'],
    );
  }
}
