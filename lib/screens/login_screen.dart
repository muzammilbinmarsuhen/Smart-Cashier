import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;
  bool showPassword = false;

  void login() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    // TODO: Hubungkan ke API Laravel
    await Future.delayed(const Duration(seconds: 2));

    setState(() => isLoading = false);

    if (mounted) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  void loginWithGoogle() async {
    // TODO: Integrasi dengan Firebase atau Google Sign In
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Login dengan Google belum diaktifkan.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// LOGO
                const Icon(Icons.storefront, size: 80, color: Colors.blue),

                const SizedBox(height: 20),

                const Text(
                  "Smart Cashier",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),

                const SizedBox(height: 40),

                /// EMAIL FIELD
                TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Email tidak boleh kosong" : null,
                ),

                const SizedBox(height: 20),

                /// PASSWORD FIELD
                TextFormField(
                  controller: password,
                  obscureText: !showPassword,
                  decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                          showPassword ? Icons.visibility : Icons.visibility_off),
                      onPressed: () =>
                          setState(() => showPassword = !showPassword),
                    ),
                    border: const OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value!.isEmpty ? "Password tidak boleh kosong" : null,
                ),

                const SizedBox(height: 10),

                /// FORGOT PASSWORD BUTTON
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/forgot-password');
                    },
                    child: const Text(
                      "Lupa Password?",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                /// LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                    child: isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            "Login",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text("atau", style: TextStyle(fontSize: 14)),

                const SizedBox(height: 20),

                /// GOOGLE LOGIN BUTTON
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton.icon(
                    onPressed: loginWithGoogle,
                    icon: Image.asset(
                      'assets/google_logo.png',
                      width: 24,
                      height: 24,
                    ),
                    label: const Text(
                      "Login dengan Google",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
