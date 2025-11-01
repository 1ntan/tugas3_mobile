import 'package:flutter/material.dart';

class MyAppStatefulLanjutan extends StatelessWidget {
  const MyAppStatefulLanjutan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hitung Karakter (Stateful)',
      home: const HitungKarakterPage(),
    );
  }
}

class HitungKarakterPage extends StatefulWidget {
  const HitungKarakterPage({super.key});

  @override
  State<HitungKarakterPage> createState() => _HitungKarakterPageState();
}

class _HitungKarakterPageState extends State<HitungKarakterPage> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    debugPrint("Build Stateful dipanggil");

    return Scaffold(
      appBar: AppBar(title: const Text("Hitung Karakter - Stateful")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  input = value;
                });
              },
              decoration: const InputDecoration(
                labelText: "Ketik sesuatu...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Text("Teks: $input"),
            Text("Jumlah karakter: ${input.length}"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(teks: input),
                  ),
                );
              },
              child: const Text("Lihat Detail"),
            ),
          ],
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
          "Isi teks: $teks\nJumlah karakter: ${teks.length}",
          style: const TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
