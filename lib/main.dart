import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'modul_3/materi/Implementasi_API_http.dart';
// import 'modul_3/materi/Implementasi_API_DIO.dart';
// import 'modul_3/materi/Future_Concept_Page.dart';
// import 'modul_3/materi/Async_Callback_Demo.dart';
// import 'modul_3/materi/Simulasi_Login_Async_Callback.dart';
import 'kelas/tugas_3/home_page.dart';
import 'kelas/tugas_3/login_page.dart';
import 'kelas/tugas_3/signup_page.dart';
// import 'kelas/tugas_3/custom_page.dart';
// import 'kelas/tugas_3/login_page1.dart';
// import 'kelas/tugas_3/signup_page1.dart';
// import 'kelas/tugas_3/theater_page.dart';


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         textTheme: GoogleFonts.poppinsTextTheme(),
//       ),
//       initialRoute: '/login',
//       routes: {
//         '/login': (_) => LoginPage(),
//         '/signup': (_) => SignUpPage(),
//         '/theater': (_) => TheaterPage(),
//       },
//     );
//   }
// }

















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






// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'modul_3/codelab/app/routes/app_pages.dart';


// void main() {
//   runApp(
//     GetMaterialApp(
//       title: "Modul 3 - HTTP & Async",
//       debugShowCheckedModeBanner: false,
//       initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//       theme: _buildLightTheme(),
//       darkTheme: _buildDarkTheme(),
//       themeMode: ThemeMode.system,
//     ),
//   );
// }

// /// Light Theme - Minimalist & Clean
// ThemeData _buildLightTheme() {
//   return ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.light,
//     colorScheme: ColorScheme.light(
//       primary: const Color(0xFF2C3E50),
//       secondary: const Color(0xFF34495E),
//       surface: Colors.white,
//       background: const Color(0xFFF8F9FA),
//       error: const Color(0xFFE74C3C),
//       onPrimary: Colors.white,
//       onSecondary: Colors.white,
//       onSurface: const Color(0xFF2C3E50),
//       onBackground: const Color(0xFF2C3E50),
//     ),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Color(0xFF2C3E50),
//       foregroundColor: Colors.white,
//       elevation: 0,
//       centerTitle: true,
//       titleTextStyle: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: Colors.white,
//         letterSpacing: 0.5,
//       ),
//     ),
//     cardTheme: const CardThemeData(
//   color: Colors.white,
//   elevation: 2,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(12)),
//   ),
// ),

//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFF2C3E50),
//         foregroundColor: Colors.white,
//         elevation: 0,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     ),
//     scaffoldBackgroundColor: const Color(0xFFF8F9FA),
//   );
// }

// /// Dark Theme - Minimalist & Clean
// ThemeData _buildDarkTheme() {
//   return ThemeData(
//     useMaterial3: true,
//     brightness: Brightness.dark,
//     colorScheme: ColorScheme.dark(
//       primary: const Color(0xFFECF0F1),
//       secondary: const Color(0xFFBDC3C7),
//       surface: const Color(0xFF1E1E1E),
//       background: const Color(0xFF121212),
//       error: const Color(0xFFE74C3C),
//       onPrimary: const Color(0xFF1E1E1E),
//       onSecondary: const Color(0xFF1E1E1E),
//       onSurface: const Color(0xFFECF0F1),
//       onBackground: const Color(0xFFECF0F1),
//     ),
//     appBarTheme: const AppBarTheme(
//       backgroundColor: Color(0xFF1E1E1E),
//       foregroundColor: Color(0xFFECF0F1),
//       elevation: 0,
//       centerTitle: true,
//       titleTextStyle: TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w600,
//         color: Color(0xFFECF0F1),
//         letterSpacing: 0.5,
//       ),
//     ),
//     cardTheme: const CardThemeData(
//   color: Color(0xFF1E1E1E),
//   elevation: 2,
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(Radius.circular(12)),
//   ),
// ),

//     elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: const Color(0xFFECF0F1),
//         foregroundColor: const Color(0xFF1E1E1E),
//         elevation: 0,
//         padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//       ),
//     ),
//     scaffoldBackgroundColor: const Color(0xFF121212),
//   );
// }




// simulasi login //
// void main() {
//   runApp(const MaterialApp(
//     home: SimulasiLoginPage(),
//   ));
// }



// async callbak //
// void main() {
//   runApp(const MaterialApp(
//     home: AsyncCallbackPage(),
//   ));
// }



// future concept //
// void main() {
//   runApp(const MaterialApp(home: FutureConceptPage()));
// }



// api dio //
// void main() {
//   runApp(const MaterialApp(
//     home: CountryListDioPage(),
//   ));
// }







// api http //
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: CountryListPage(), // tampilkan halaman dari file lain
//     );
//   }
// }











































// import 'modul_2/materi/mediaQuery.dart';
// import 'modul_2/materi/layoutBuilder.dart';
// import 'modul_2/materi/button_slider.dart';
// import 'modul_2/materi/svg.dart';
// import 'modul_2/codelab/mediaQuery_animation.dart';
// import 'modul_2/kegiatan/implisit.dart';
// import 'modul_2/kegiatan/controller.dart';
// import 'modul_2/kegiatan/media_layout.dart';
// import 'modul_2/kegiatan/animasi.dart';
// import 'modul_2/kegiatan/animasi2.dart';
// import 'modul_2/kegiatan/animasi3.dart';
// import 'modul_2/kegiatan/animasi4.dart';
// import 'modul_2/kegiatan/final.dart';



// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MainMenu(),
//   ));
// }


// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MenuUtama4(),
//   ));
// }



// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MenuUtama3(),
//   ));
// }


// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MenuUtama2(),
//   ));
// }


// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MenuUtama1(),
//   ));
// }

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MenuUtama(),
//   ));
// }


// 









// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ProductCatalogPage2(),
//   ));
// }

// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ImplicitAnimationDemo(),
//   ));
// }



// void main() => runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductCatalogPage1(),
//     ));























//          svg.dart          //
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: AssetDemoPage(),
//   ));
// }


//          button_slider         //    
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: ResponsiveCatalogInteractive(),
//   ));
// }


//          layoutBuilder          //
// void main() {
//   runApp(const MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: LayoutBuilderDemoPage(),
//   ));
// }


//          mediaQuery          //
// void main() => runApp(const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ProductCatalogPage(),
//     ));






































// Modul 1
// import 'kelas/tugas_1/manual.dart';
// import 'kelas/tugas_1/ai.dart';
// import 'modul_1/codelab/codelab_1.dart';
// import 'modul_1/codelab/codelab_2.dart';
// import 'modul_1/kegiatan/stateless.dart';
// import 'modul_1/kegiatan/statefull.dart';
// import 'modul_1/kegiatan/stateless_lanjutan.dart';
// import 'modul_1/kegiatan/statefull_lanjutan.dart';
// import 'modul_1/kegiatan/global.dart';
// import 'kelas/tugas_2/sql.dart';

// void main() {
//   runApp(const MyAppStatelessLanjutan());
// }



// void main() {
//   runApp(
//     ChangeNotifierProvider(
//       create: (_) => LoginState(),
//       child: const providerGlobal(), // ⬅️ gunakan nama class yang baru
//     ),
//   );
// }