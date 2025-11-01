import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentCity = "MEDAN";
  Position? position;

  final List<String> cities = ["MEDAN", "JAKARTA", "BANDUNG", "SURABAYA"];
  final theaters = [
    "XI CINEMA",
    "PONDOK KELAPA 21",
    "CGV",
    "CINEPOLIS",
    "CP MALL",
    "HERMES"
  ];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) return;

    position = await Geolocator.getCurrentPosition();
    setState(() {
      currentCity = "MEDAN";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 234, 236, 68)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
            );
          },
        ),
        title: const Text('THEATER',
            style: TextStyle(
                color: Color.fromARGB(255, 234, 236, 68), fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 54, 70, 134),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, color: Colors.black54),
                const SizedBox(width: 6),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: currentCity,
                    items: cities
                        .map((city) => DropdownMenuItem<String>(
                              value: city,
                              child: Text(
                                city,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        currentCity = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...theaters.map(
              (t) => Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      t,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(Icons.expand_more),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
