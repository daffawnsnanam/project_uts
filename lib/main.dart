import 'package:flutter/material.dart';
import 'package:spotify/routes/route_generator.dart';
import 'package:spotify/theme/theme_data.dart';
import 'package:spotify/pages/get_started_page.dart';
import 'package:spotify/pages/login.dart';
import 'package:spotify/pages/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Memperbaiki penggunaan Key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: darkTheme,
      initialRoute: GetStartedPage.tag,  // Set the initial route to GetStartedPage
      onGenerateRoute: RouteGenerator.generatorRoute,
      routes: {
        GetStartedPage.tag: (context) => const GetStartedPage(),
        LoginPage.tag: (context) => const LoginPage(),
        HomePage.tag: (context) => const HomePage(),
      },
    );
  }
}