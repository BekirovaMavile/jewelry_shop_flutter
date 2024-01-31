import 'package:flutter/material.dart';
import 'package:jewellry_shop/SQLite/sqlite.dart';
import 'package:jewellry_shop/authtentication/login_screen.dart';
import 'package:jewellry_shop/jsonModels/users.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final name = TextEditingController();
  final surname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.diamond_rounded, color: Color(0xFF7f83d2), size: 110),
                  _nameField(),
                  _surnameField(),
                  _emailField(),
                  _passwordField(),
                  _confirmPasswordField(),
                  const SizedBox(height: 10),
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFF7f83d2)),
                    child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            final db = DatabaseHelper();
                            db.signup(Users(
                                usrSurname: surname.text,
                                usrEmail: email.text,
                                usrName: name.text,
                                usrPassword: password.text))
                                .whenComplete(() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const LoginScreen()));
                            });
                          }
                        },
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                            //Navigate to sign up
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
                          },
                          child: const Text("Login", style: TextStyle(color: Color(0xFF7f83d2)),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _nameField(){
    return Container(
      margin: const EdgeInsets.all(4),
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: name,
        validator: (value) {
          if (value!.isEmpty) {
            return "name is required";
          }
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.person, color: Color(0xFF7f83d2),),
          border: InputBorder.none,
          hintText: "Your name",
        ),
      ),
    );
  }

  Widget _surnameField(){
    return Container(
      margin: const EdgeInsets.all(4),
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: surname,
        validator: (value) {
          if (value!.isEmpty) {
            return "surname is required";
          }
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.person, color: Color(0xFF7f83d2),),
          border: InputBorder.none,
          hintText: "Your surname",
        ),
      ),
    );
  }

  Widget _emailField() {
    return Container(
      margin: const EdgeInsets.all(4),
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: email,
        validator: (value) {
          if (value!.isEmpty) {
            return "email is required";
          }
          return null;
        },
        decoration: const InputDecoration(
          icon: Icon(Icons.email, color: Color(0xFF7f83d2),),
          border: InputBorder.none,
          hintText: "Email",
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      margin: const EdgeInsets.all(4),
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: password,
        validator: (value) {
          if (value!.isEmpty) {
            return "password is required";
          }
          return null;
        },
        obscureText: !isVisible,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: Color(0xFF7f83d2)),
          border: InputBorder.none,
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(isVisible
                ? Icons.visibility
                : Icons.visibility_off), color: const Color(0xFF7f83d2),
          ),
        ),
      ),
    );
  }

  Widget _confirmPasswordField() {
    return Container(
      margin: const EdgeInsets.all(4),
      padding:
      const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        controller: confirmPassword,
        validator: (value) {
          if (value!.isEmpty) {
            return "password is required";
          } else if (password.text != confirmPassword.text) {
            return "Passwords don't match";
          }
          return null;
        },
        obscureText: !isVisible,
        decoration: InputDecoration(
          icon: const Icon(Icons.lock, color: Color(0xFF7f83d2),),
          border: InputBorder.none,
          hintText: "Password",
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: Icon(isVisible
                ? Icons.visibility
                : Icons.visibility_off), color: const Color(0xFF7f83d2),
          ),
        ),
      ),
    );
  }
}