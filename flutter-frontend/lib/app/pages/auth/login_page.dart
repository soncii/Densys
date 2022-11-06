import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller1,
          ),
          TextField(
            controller: controller2,
          ),
          ElevatedButton(
              onPressed: () {
                if (controller1.text.trim() == 'admin' && controller2.text.trim() == 'admin') {
                  context.go('/');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('invalid login or password'),
                  ));
                }
              },
              child: Text('login'))
        ],
      ),
    );
  }
}
