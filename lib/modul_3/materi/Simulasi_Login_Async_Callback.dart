import 'package:flutter/material.dart';
import 'dart:async';

class SimulasiLoginPage extends StatefulWidget {
  const SimulasiLoginPage({super.key});

  @override
  State<SimulasiLoginPage> createState() => _SimulasiLoginPageState();
}

class _SimulasiLoginPageState extends State<SimulasiLoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String hasilAsync = '';
  String hasilCallback = '';

  // Fungsi Future untuk meniru login delay 2 detik
  Future<bool> login(String username, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (username == 'admin' && password == '1234') {
      return true;
    } else {
      throw Exception('Username atau password salah');
    }
  }

  // Versi async–await
  void loginAsync() async {
    setState(() => hasilAsync = 'Memproses login...');
    try {
      bool status = await login(_usernameController.text, _passwordController.text);
      if (status) {
        setState(() => hasilAsync = 'Login berhasil (async–await)');
      }
    } catch (e) {
      setState(() => hasilAsync = e.toString());
    }
  }

  // Versi callback chaining
  void loginCallback() {
    setState(() => hasilCallback = 'Memproses login...');
    login(_usernameController.text, _passwordController.text)
        .then((status) {
          if (status) {
            setState(() => hasilCallback = 'Login berhasil (callback chaining)');
          }
        })
        .catchError((e) {
          setState(() => hasilCallback = e.toString());
        })
        .whenComplete(() {
          print('Selesai proses login callback');
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Simulasi Login (Async)')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginAsync,
              child: const Text('Login dengan Async–Await'),
            ),
            Text(hasilAsync),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loginCallback,
              child: const Text('Login dengan Callback'),
            ),
            Text(hasilCallback),
          ],
        ),
      ),
    );
  }
}
