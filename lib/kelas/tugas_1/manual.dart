import 'package:flutter/material.dart';

class AplikasiSaya extends StatelessWidget {
  const AplikasiSaya({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page Manual',
      debugShowCheckedModeBanner: false,
      home: const HalamanLogin(),
    );
  }
}

class HalamanLogin extends StatefulWidget {
  const HalamanLogin({super.key});

  @override
  State<HalamanLogin> createState() => _HalamanLoginState();
}

class _HalamanLoginState extends State<HalamanLogin>
    with SingleTickerProviderStateMixin {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  late AnimationController _animController;
  late Animation<double> _animasi;

  @override
  void initState() {
    super.initState();
    _animController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animasi = Tween<double>(begin: 1, end: 1.1).animate(
      CurvedAnimation(parent: _animController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _userController.dispose();
    _passController.dispose();
    _animController.dispose();
    super.dispose();
  }

  void _login() {
    if (_userController.text == "admin" && _passController.text == "1234") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HalamanDashboard()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login gagal")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;

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
                controller: _userController,
                decoration: const InputDecoration(labelText: "Username"),
              ),
              TextField(
                controller: _passController,
                decoration: const InputDecoration(labelText: "Password"),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ScaleTransition(
                scale: _animasi,
                child: ElevatedButton(
                  onPressed: () {
                    _animController.forward().then((_) {
                      _animController.reverse();
                      _login();
                    });
                  },
                  child: const Text("Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class HalamanDashboard extends StatelessWidget {
  const HalamanDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: const Center(child: Text("Selamat datang di Dashboard")),
    );
  }
}