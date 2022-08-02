import 'package:auth_example/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _EmailInput(),
            SizedBox(height: 16),
            _Password(),
            SizedBox(height: 16),
            _LogInButton(),
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  const _EmailInput();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return TextFormField(
      initialValue: bloc.state.email.value,
      onChanged: (value) => bloc.add(LoginEmailChanged(value)),
      decoration: const InputDecoration(labelText: 'Email'),
    );
  }
}

class _Password extends StatelessWidget {
  const _Password();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<LoginBloc>();
    return TextFormField(
      initialValue: bloc.state.password.value,
      onChanged: (value) => bloc.add(LoginPasswordChanged(value)),
      decoration: const InputDecoration(labelText: 'Password'),
    );
  }
}

class _LogInButton extends StatelessWidget {
  const _LogInButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => context.read<LoginBloc>().add(LoginRequested()),
      child: const Text('Log in'),
    );
  }
}
