import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// State Global
class LoginState with ChangeNotifier {
  String _username = "";
  String get username => _username;

  void login(String name) {
    _username = name;
    notifyListeners();
  }
}

/// Root App
class providerGlobal extends StatelessWidget {
  const providerGlobal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Masukkan username",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  Provider.of<LoginState>(context, listen: false)
                      .login(_controller.text);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final username = Provider.of<LoginState>(context).username;

    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: Center(
        child: Text(
          "Selamat datang, $username",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
