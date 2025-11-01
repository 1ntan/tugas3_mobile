import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kelas/tugas_3/home_page.dart';
import 'kelas/tugas_3/login_page.dart';
import 'kelas/tugas_3/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
//     ChangeNotifierProvider(
//       create: (_) => LoginState(),
//       child: const providerGlobal(), // ⬅️ gunakan nama class yang baru
//     ),
//   );
// }
