import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// Fungsi untuk mengambil data API
Future<List<dynamic>> fetchCountries() async {
  final response = await http.get(
    Uri.parse('https://restcountries.com/v3.1/all?fields=name'),
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    throw Exception('Gagal memuat data');
  }
}

// Widget untuk menampilkan daftar negara
class CountryListPage extends StatelessWidget {
  const CountryListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Negara')),
      body: FutureBuilder(
        future: fetchCountries(),
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
