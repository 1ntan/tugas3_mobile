import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TheaterPage extends StatefulWidget {
  @override
  _TheaterPageState createState() => _TheaterPageState();
}

class _TheaterPageState extends State<TheaterPage> {
  String currentCity = "MEDAN";
  Position? position;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) return;

    position = await Geolocator.getCurrentPosition();
    setState(() {
      currentCity = "Lokasi Anda (${position!.latitude.toStringAsFixed(2)}, ${position!.longitude.toStringAsFixed(2)})";
    });
  }

  final theaters = [
    "XI CINEMA",
    "PONDOK KELAPA 21",
    "CGV",
    "CINEPOLIS",
    "CP MALL",
    "HERMES"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('THEATER', style: TextStyle(color: Colors.yellow.shade700, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.yellow.shade700),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.black54),
                  SizedBox(width: 8),
                  Text(currentCity, style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 16),
            ...theaters.map((t) => Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(t, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(Icons.expand_more),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
