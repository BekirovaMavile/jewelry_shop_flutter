import 'package:flutter/material.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LOGIN').fadeAnimation(0.8),
        centerTitle: true,
        backgroundColor: const Color(0xFFdad8ee),
        elevation: 0,
        // Убирает тень AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Возврат на предыдущий экран
          },
        ).fadeAnimation(0.8),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back5.jpeg'),
            // Путь к фоновому изображению
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/login1.png', // Путь к маленькому изображению
                width: 450,
                height: 450,
              ),
              // SizedBox(height: 20),
              _buildLoginForm(),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      },
                    ),
                  );
                },
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "Don't have an account? "),
                      TextSpan(
                        text: "Sign Up",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(color: Colors.black), // Цвет текста
            decoration: InputDecoration(
              fillColor: const Color(0xFFd1ceef),
              labelText: 'Email',
              labelStyle: const TextStyle(color: Colors.black),
              // Цвет подписи
              prefixIcon: const Icon(Icons.email, color: Colors.black),
              // Цвет иконки
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black), // Цвет рамки при фокусе
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ).fadeAnimation(0.8),
          const SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            style: const TextStyle(color: Colors.black), // Цвет текста
            decoration: InputDecoration(
              fillColor: const Color(0xFFd1ceef),
              labelText: 'Your password',
              labelStyle: const TextStyle(color: Colors.black),
              // Цвет подписи
              prefixIcon: const Icon(Icons.lock, color: Colors.black),
              // Цвет иконки
              focusedBorder: const OutlineInputBorder(
                borderSide:
                    BorderSide(color: Colors.black), // Цвет рамки при фокусе
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ).fadeAnimation(0.8),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 45,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15.0),
              ),
              onPressed: () {},
              child: const Text(
                "Login",
                style: TextStyle(
                  color: Colors.black,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ).fadeAnimation(0.8),
          ),
        ],
      ),
    );
  }
}
