import "package:flutter/material.dart";
import "package:hubtel_test/home.dart";

void main() {

  /// Application entry point.
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    /// Base App.
    return MaterialApp(
      title: "Hubtel Test",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF01c7b1)),
        useMaterial3: true,
      ),
      home: const HomeActivity(),
    );
  }
}
