import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  bool _isValidEmail = false;
  bool _isValidPassword = false;

  void _validateEmail(String value) {
    RegExp emailRegEx = RegExp(
        r'([a-zA-Z0-9._-]+@[a-zA-Z0-9._-]+\.[a-zA-Z0-9_-]+)');
    setState(() {
      _isValidEmail = emailRegEx.hasMatch(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _isValidPassword = value.length >= 8;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Вход'),
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 32, top: 64, left: 16, right: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _validateEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    if (!_isValidEmail) {
                      return 'Некорректный email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: _validatePassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return null;
                    }
                    if (!_isValidPassword) {
                      return 'Пароль должен содержать минимум 8 символов';
                    }
                    return null;
                  },
                ),
                const Spacer(),
                FilledButton(
                  onPressed:
                    _isValidEmail && _isValidPassword
                        ? () {
                      print('Email: ${_emailController.text}');
                      print('Password: ${_passwordController.text}');
                      _emailController.clear();
                      _passwordController.clear();
                    } : null,
                  style: ButtonStyle(
                    fixedSize: WidgetStateProperty.all(
                        const Size(double.maxFinite, 40)),
                  ),
                  child: const Text('Войти'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
