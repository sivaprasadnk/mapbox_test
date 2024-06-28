import 'package:flutter/material.dart';
import 'package:machine_test/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // MapboxOptions.setAccessToken(const String.fromEnvironment("ACCESS_TOKEN"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Machine Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
