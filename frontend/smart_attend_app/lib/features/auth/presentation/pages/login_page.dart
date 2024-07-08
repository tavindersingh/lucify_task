import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/router/route_transition.dart';
import 'package:smart_attend_app/features/courses/presentation/pages/courses_list_page.dart';
import 'package:sprung/sprung.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<double>(begin: 800.0, end: 310.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Sprung.custom(
          mass: 1,
          stiffness: 177.8,
          damping: 20,
        ),
      ),
    );

    // Delay the start of the animation by 1 millisecond
    Future.delayed(const Duration(milliseconds: 1), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Stack(
          fit: StackFit.expand,
          alignment: Alignment.topCenter,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Positioned(
              top: 60,
              child: Column(
                children: [
                  Hero(
                    tag: 'appLogo',
                    child: Container(
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
                ],
              ),
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  top: _animation.value,
                  left: 0,
                  right: 0,
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
                              createFadeRoute(const CoursesListPage()));
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
                );
              },
            ),
            const Positioned(
              bottom: 0,
              child: Text(
                'Powered by Lucify',
                style: TextStyle(color: Colors.black38),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
