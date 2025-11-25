import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/forgot_password_screen.dart';
// import 'screens/home_screen.dart';

void main() {
  runApp(const SmartCashierApp());
}

class SmartCashierApp extends StatelessWidget {
  const SmartCashierApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Cashier',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),

      // Routing aplikasi
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        // '/home': (context) => const HomeScreen(),
      },
    );
  }
}
