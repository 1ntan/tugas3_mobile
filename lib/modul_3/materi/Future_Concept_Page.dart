import 'package:flutter/material.dart';
import 'dart:async';

class FutureConceptPage extends StatelessWidget {
  const FutureConceptPage({super.key});

  Future<String> prosesData() async {
    await Future.delayed(const Duration(seconds: 2));
    return 'Data berhasil diambil';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konsep Dasar Future')),
      body: Center(
        child: FutureBuilder<String>(
          future: prosesData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Text(snapshot.data!);
            }
          },
        ),
      ),
    );
  }
}
