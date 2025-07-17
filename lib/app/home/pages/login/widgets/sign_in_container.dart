import 'package:flutter/material.dart';

class SignInContainer extends StatelessWidget {
  const SignInContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 26),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Zaloguj się',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Hasło',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              backgroundColor: Colors.black,
            ),
            child: const Text(
              'Zaloguj się',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text('Nie pamiętasz hasła?'),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: const Text('Nie masz konta? Zarejestruj się'),
          ),
        ],
      ),
    );
  }
}
