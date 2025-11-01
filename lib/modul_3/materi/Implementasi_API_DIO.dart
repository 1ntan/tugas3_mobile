import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// Langkah 2: Buat fungsi pengambil data menggunakan Dio
Future<List<dynamic>> fetchCountriesDio() async {
  try {
    var response = await Dio().get(
      'https://restcountries.com/v3.1/all?fields=name',
    );
    return response.data;
  } catch (e) {
    throw Exception('Gagal memuat data: $e');
  }
}

// Langkah 3: Tampilkan hasil pada UI
class CountryListDioPage extends StatelessWidget {
  const CountryListDioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Negara (Dio)')),
      body: FutureBuilder(
        future: fetchCountriesDio(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data as List<dynamic>;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final name = data[index]['name'];
                return ListTile(
                  leading: const Icon(Icons.public),
                  title: Text(name['common']),
                  subtitle: Text(name['official']),
                );
              },
            );
          }
        },
      ),
    );
  }
}
