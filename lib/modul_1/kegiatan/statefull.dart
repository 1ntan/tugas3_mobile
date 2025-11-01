import 'package:flutter/material.dart';

class MyAppStateful extends StatefulWidget {
  const MyAppStateful({super.key});

  @override
  State<MyAppStateful> createState() => _MyAppStatefulState();
}

class _MyAppStatefulState extends State<MyAppStateful> {
  String input = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
            ],
          ),
        ),
      ),
    );
  }
}
