import 'package:auth_example/app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Onboarding page'),
            ElevatedButton(
              onPressed: () {
                context.read<OnboardingCubit>().showedOnboarding();
                context.go('/login');
              },
              child: const Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
