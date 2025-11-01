import 'package:flutter/material.dart';

class MyAppStateless extends StatelessWidget {
  const MyAppStateless({super.key});

  @override
  Widget build(BuildContext context) {
    const int jumlahKarakter = 0; // selalu statis

    return MaterialApp(
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
            ],
          ),
        ),
      ),
    );
  }
}
