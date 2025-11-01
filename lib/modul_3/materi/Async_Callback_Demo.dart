import 'package:flutter/material.dart';
import 'dart:async';

class AsyncCallbackPage extends StatefulWidget {
  const AsyncCallbackPage({super.key});

  @override
  State<AsyncCallbackPage> createState() => _AsyncCallbackPageState();
}

class _AsyncCallbackPageState extends State<AsyncCallbackPage> {
  String hasilAsync = '';
  String hasilCallback = '';

  // Pendekatan async–await
  Future<String> prosesAsync() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data berhasil diambil (async–await)';
  }

  // Pendekatan callback chaining
  Future<String> prosesCallback() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data berhasil diambil (callback chaining)';
  }

  // Jalankan versi async–await
  void jalankanAsync() async {
    setState(() => hasilAsync = 'Memproses...');
    try {
      String data = await prosesAsync();
      setState(() => hasilAsync = data);
    } catch (e) {
      setState(() => hasilAsync = 'Error: $e');
    }
  }

  // Jalankan versi callback chaining
  void jalankanCallback() {
    setState(() => hasilCallback = 'Memproses...');
    prosesCallback()
        .then((data) {
          setState(() => hasilCallback = data);
        })
        .catchError((e) {
          setState(() => hasilCallback = 'Error: $e');
        })
        .whenComplete(() {
          print('Selesai proses callback');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Perbandingan Async dan Callback')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('a. Pendekatan async–await', style: TextStyle(fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: jalankanAsync,
              child: const Text('Jalankan Async-Await'),
            ),
            Text(hasilAsync),
            const SizedBox(height: 24),
            const Text('b. Pendekatan callback chaining', style: TextStyle(fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: jalankanCallback,
              child: const Text('Jalankan Callback'),
            ),
            Text(hasilCallback),
          ],
        ),
      ),
    );
  }
}
