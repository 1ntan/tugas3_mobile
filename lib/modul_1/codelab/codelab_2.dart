import 'package:flutter/material.dart';
import 'dart:math';

// fungsi generator random string
String generateRandomString() {
  const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
  Random random = Random();
  return List.generate(
    10,
    (index) => characters[random.nextInt(characters.length)],
  ).join();
}

// fungsi generator random number
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
      home: RandomPage(),
    );
  }
}

class RandomPage extends StatefulWidget {
  @override
  State<RandomPage> createState() => _RandomPageState();
}

class _RandomPageState extends State<RandomPage> {
  int? randomNumber;
  String? randomString;

  void _generate() {
    setState(() {
      randomNumber = generateRandomNumber();
      randomString = generateRandomString();
    });
  }

  void _goToDetail() {
    if (randomNumber != null && randomString != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            number: randomNumber!,
            text: randomString!,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Silakan generate data dulu")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("StatefulWidget + Random")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (randomNumber != null && randomString != null) ...[
              Text("Angka Random: $randomNumber", style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 8),
              Text("String Random: $randomString", style: const TextStyle(fontSize: 18)),
            ] else
              const Text("Tekan tombol Generate untuk mulai"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _generate,
              child: const Text("Generate"),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _goToDetail,
              child: const Text("Halaman Detail"),
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
            Text("Angka terakhir: $number", style: const TextStyle(fontSize: 22)),
            const SizedBox(height: 8),
            Text("String terakhir: $text", style: const TextStyle(fontSize: 20)),
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