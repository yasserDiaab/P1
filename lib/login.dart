import 'package:flutter/material.dart';
import 'package:practical/authpref.dart';
import 'package:practical/homePage.dart';
import 'package:practical/signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool check = false;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 78, 1, 92),
              Color.fromARGB(255, 167, 123, 175),
            ],
            begin: Alignment.center,
            end: Alignment.bottomRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Text(
                'Hello, Welcome Back ',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: email,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          label: const Text('Username'),
                          hintText: 'Enter Your User Name',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 16,
                          ),
                          label: const Text('Password'),
                          hintText: 'Enter Your Password',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w300,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.purple),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          maximumSize: MaterialStateProperty.all(
                            const Size(double.infinity, 50),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                            const Color(0xff50BF9E),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                        onPressed: () {
                          onLoginSuccess(email.text);
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomePage();
                          }));
                        },
                        child: const Center(
                          child: Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Transform.scale(
                    scale: 1,
                    child: Checkbox(
                      side: const BorderSide(color: Colors.white),
                      value: check,
                      onChanged: (val) {
                        setState(() {
                          check = val!;
                        });
                      },
                      visualDensity: VisualDensity.comfortable,
                    ),
                  ),
                  const Text(
                    'Remember Me?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member yet?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  TextButton(
                    style:
                        TextButton.styleFrom(padding: const EdgeInsets.all(1)),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const SignUpPage();
                      }));
                    },
                    child: const Text(
                      '  Join Now',
                      style: TextStyle(
                          color: Colors.yellow,
                          fontSize: 15,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLoginSuccess(String token) async {
    await AuthPreferences.saveToken(token);
    // Navigate to home screen
  }
}
