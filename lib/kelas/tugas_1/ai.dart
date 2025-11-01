import 'package:flutter/material.dart';

class AplikasiAI extends StatelessWidget {
  const AplikasiAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page AI',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;
    final TextEditingController user = TextEditingController();
    final TextEditingController pass = TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ukuran.width * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FlutterLogo(size: 100),
              const SizedBox(height: 20),
              TextField(
                controller: user,
                decoration: const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: pass,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 1, end: 1),
                duration: const Duration(milliseconds: 300),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: ElevatedButton(
                      onPressed: () {
                        if (user.text == "admin" && pass.text == "1234") {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardScreen()),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Login gagal")),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard AI")),
      body: const Center(child: Text("Halo, ini Dashboard versi AI")),
    );
  }
}
