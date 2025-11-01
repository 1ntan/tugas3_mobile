import 'package:flutter/material.dart';
import 'custom_page.dart';

class LoginPage extends StatelessWidget {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/cinema.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.8), Colors.black.withOpacity(0.8)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              Text("Let's get started", style: TextStyle(color: Colors.white70)),
              SizedBox(height: 30),
              CustomInput(icon: Icons.email, hint: 'Email', controller: emailController),
              SizedBox(height: 15),
              CustomInput(icon: Icons.lock, hint: 'Password', controller: passController, obscureText: true),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: Text('Forgot Password?', style: TextStyle(color: Colors.lightBlueAccent)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/theater'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade900,
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text('Login'),
              ),
              SizedBox(height: 15),
              Text('Or', style: TextStyle(color: Colors.white70)),
              SizedBox(height: 15),
              OutlinedButton.icon(
                icon: Icon(Icons.g_mobiledata, color: Colors.white),
                label: Text('Login With Google', style: TextStyle(color: Colors.white)),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton.icon(
                icon: Icon(Icons.facebook, color: Colors.white),
                label: Text('Login With Facebook', style: TextStyle(color: Colors.white)),
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/signup'),
                child: Text("Don't have an account? Register here", style: TextStyle(color: Colors.lightBlueAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
