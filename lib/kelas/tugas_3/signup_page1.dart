import 'package:flutter/material.dart';
import 'custom_page.dart';

class SignUpPage extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmController = TextEditingController();

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
              Text('Sign-up', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              Text("Let's get started", style: TextStyle(color: Colors.white70)),
              SizedBox(height: 30),
              CustomInput(icon: Icons.person, hint: 'Your Full Name', controller: nameController),
              SizedBox(height: 15),
              CustomInput(icon: Icons.email, hint: 'Email', controller: emailController),
              SizedBox(height: 15),
              CustomInput(icon: Icons.lock, hint: 'Password', controller: passController, obscureText: true),
              SizedBox(height: 15),
              CustomInput(icon: Icons.lock_outline, hint: 'Confirm Password', controller: confirmController, obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade900,
                  minimumSize: Size(double.infinity, 48),
                ),
                child: Text('Register'),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: Text("Don't have an account? Register here", style: TextStyle(color: Colors.lightBlueAccent)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
