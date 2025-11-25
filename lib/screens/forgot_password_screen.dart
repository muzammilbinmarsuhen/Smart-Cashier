import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isSending = false;

  void sendResetLink() async {
    if (!formKey.currentState!.validate()) return;

    setState(() => isSending = true);

    // TODO: Hubungkan API Laravel untuk reset password.
    await Future.delayed(const Duration(seconds: 2));

    setState(() => isSending = false);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Link reset password telah dikirim.")),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lupa Password")),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Masukkan email akun Anda untuk menerima link reset password.",
                style: TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),

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

              const SizedBox(height: 30),

              /// SEND LINK BUTTON
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isSending ? null : sendResetLink,
                  child: isSending
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          "Kirim Link Reset",
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
