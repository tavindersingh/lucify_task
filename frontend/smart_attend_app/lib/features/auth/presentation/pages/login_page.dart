import 'package:flutter/material.dart';
import 'package:smart_attend_app/features/courses/presentation/pages/courses_list_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 106,
                  height: 106,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFC02A2A).withOpacity(0.15),
                        offset: const Offset(-7.24, 6.71),
                        blurRadius: 9.89,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  child: Image.asset('assets/images/logo.png'),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'SmartAttend',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFE43E3A),
                  ),
                ),
                const SizedBox(height: 86),
                SizedBox(
                  child: Column(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 24,
                          ),
                          hintText: 'Your ID',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4D4D4D),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFDADADA),
                        ),
                      ),
                      const SizedBox(height: 26),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 24,
                          ),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4D4D4D),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          filled: true,
                          fillColor: const Color(0xFFDADADA),
                        ),
                      ),
                      const SizedBox(height: 26),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (_) => const CoursesListPage()));
                        },
                        child: const Text('Log in'),
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        'Forgot Password',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Color(0xFF272A2E),
                        ),
                      ),
                      const SizedBox(height: 30),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Create new account'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                const Text(
                  'Powered by Lucify',
                  style: TextStyle(color: Colors.black38),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
