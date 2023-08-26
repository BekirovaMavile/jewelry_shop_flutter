import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewellry_shop/ui/extensions/app_extension.dart';
import 'package:jewellry_shop/ui/screens/home_screen.dart';
import 'package:jewellry_shop/ui/screens/login_screen.dart';
import 'package:jewellry_shop/ui/screens/signup_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  late BuildContext _context;

  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _context = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGN UP').fadeAnimation(0.8),
        centerTitle: true,
        backgroundColor: const Color(0xFFdad8ee),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ).fadeAnimation(0.8),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/back5.jpeg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'assets/images/signUp.png',
                width: 400,
                height: 400,
              ),
              _buildLoginForm(),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
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
                      TextSpan(text: "Already have an account? "),
                      TextSpan(
                        text: "Sign In",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/vk_icon.png',
                      width: 70,
                      height: 70,
                    ),
                  ).fadeAnimation(0.8),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/twitter_icon.png',
                      width: 70,
                      height: 70,
                    ),
                  ).fadeAnimation(0.8),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google_icon.png',
                      width: 70,
                      height: 70,
                    ),
                  ).fadeAnimation(0.8),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) => _email = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Email is required";
                }
                return null;
              },
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                fillColor: const Color(0xFFd1ceef),
                labelText: 'Email',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.email, color: Colors.black),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ).fadeAnimation(0.8),
            const SizedBox(height: 10),
            TextFormField(
              onSaved: (value) => _password = value!,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Password is required";
                }
                return null;
              },
              obscureText: true,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                fillColor: const Color(0xFFd1ceef),
                labelText: 'Your password',
                labelStyle: const TextStyle(color: Colors.black),
                prefixIcon: const Icon(Icons.lock, color: Colors.black),
                focusedBorder: const OutlineInputBorder(
                  borderSide:
                  BorderSide(color: Colors.black),
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
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    performRegistration();
                  }
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ).fadeAnimation(0.8),
            ),
          ],
        ),
      ),
    );
  }
  void performRegistration() {
    // Perform your registration logic here
    // Once registration is successful, navigate to the home screen
    Navigator.pushReplacement(
      _context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }
}
