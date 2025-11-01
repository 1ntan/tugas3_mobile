import 'package:flutter/material.dart';
import 'dart:math';

// fungsi generator
String generateRandomString() {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return List.generate(
    10,
    (index) => characters[random.nextInt(characters.length)],
  ).join();
}

int generateRandomNumber() {
  Random random = Random();
  return random.nextInt(100); // 0–99
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Codelab Modul 1',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  // data random dibuat sekali saat halaman dibuat
  final int randomNumber = generateRandomNumber();
  final String randomString = generateRandomString();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Utama (Stateless)")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Angka Random: $randomNumber", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            Text("String Random: $randomString", style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // navigasi + kirim data
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      number: randomNumber,
                      text: randomString,
                    ),
                  ),
                );
              },
              child: const Text("Buka Halaman Detail"),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final int number;
  final String text;

  const DetailPage({super.key, required this.number, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Halaman Detail")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("Angka yang dikirim: $number", style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text("String yang dikirim: $text", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Kembali"),
            ),
          ],
        ),
      ),
    );
  }
}