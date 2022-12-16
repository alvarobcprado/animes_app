import 'package:core/dependencies/dependency_injection.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
    required this.boundary,
  }) : super(key: key);
  final AuthBoundary boundary;

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Widget create() => Consumer<AuthBoundary>(
        builder: (_, boundary, __) => LoginPage(boundary: boundary),
      );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              widget.boundary.goToFeatureHome(context);
            },
            child: const Text('Entrar')),
      ),
    );
  }
}
