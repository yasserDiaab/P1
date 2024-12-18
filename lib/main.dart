import 'package:flutter/material.dart';
import 'package:practical/authpref.dart';
import 'package:practical/homePage.dart';
import 'package:practical/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isLoggedIn = await AuthPreferences.getToken() != null;

  runApp(PracticalProject(
    isLoggedIn: isLoggedIn,
  ));
}

class PracticalProject extends StatelessWidget {
  const PracticalProject({super.key, required this.isLoggedIn});
  final bool isLoggedIn;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isLoggedIn ? HomePage() : WelcomePage());
  }
}
