import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutteronimo/feature/login/widgets/auth_button.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const Spacer(flex: 2),
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(
                  Icons.sports_esports,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Game Buddy',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Discover the best game deals and never\nmiss a price drop',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 36),
              AuthButton(
                label: 'Continue with Google',
                icon: const Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 22,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 16),
              AuthButton(
                label: 'Continue with Apple',
                icon: const Icon(
                  Icons.apple,
                  color: Colors.black,
                  size: 22,
                ),
                onTap: () {},
              ),
              const SizedBox(height: 24),
              const Text(
                'By continuing, you agree to our Terms of Service and\nPrivacy Policy',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                  height: 1.4,
                ),
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
