import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AuthTypeScreen extends StatelessWidget {
  const AuthTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blueGrey,
              Colors.black
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Image.asset('assets/onboarding/images/selectauthtypescreen image.png'),
                  const SizedBox(height: 50),

                  // Google Button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    //icon: Image.asset('assets/google.png', height: 24),
                    label: const Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 16),

                  // Email Button
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.shade600,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: const Icon(Icons.email_outlined, color: Colors.white),
                    label: const Text(
                      "Continue with email",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(height: 30),

                  // Divider
                  Divider(color: Colors.grey[700]),

                  const SizedBox(height: 12),
                  Text(
                    "If you don’t have any account please",
                    style: TextStyle(color: Colors.grey[400], fontSize: 14),
                  ),
                  const SizedBox(height: 4),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
