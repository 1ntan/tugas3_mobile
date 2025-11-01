import 'package:flutter/material.dart';

class MyAppStatelessLanjutan extends StatelessWidget {
  const MyAppStatelessLanjutan({super.key});

  @override
  Widget build(BuildContext context) {
    const int jumlahKarakter = 0; // selalu statis

    debugPrint("Build Stateless dipanggil");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hitung Karakter (Stateless)',
      home: Scaffold(
        appBar: AppBar(title: const Text("Hitung Karakter - Stateless")),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: "Ketik sesuatu...",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              Text("Jumlah karakter: $jumlahKarakter"),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DetailPage(teks: "Belum bisa update di Stateless"),
                    ),
                  );
                },
                child: const Text("Lihat Detail"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String teks;
  const DetailPage({super.key, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail")),
      body: Center(
        child: Text(
          teks,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
