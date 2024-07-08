import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:smart_attend_app/common/widgets/title.dart';
import 'package:smart_attend_app/features/auth/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    moveToNextScreen();
  }

  moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 3));

    // Navigator.of(context)
    //     .pushReplacement(MaterialPageRoute(builder: (_) => const LoginPage()));

    if (mounted) {
      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const LoginPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SharedAxisTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              transitionType: SharedAxisTransitionType.vertical,
              child: child,
            );
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    final logoContainerTween = MovieTween()
      ..scene(
        begin: const Duration(seconds: 0),
        end: const Duration(milliseconds: 100),
      ).tween(
        'color',
        ColorTween(
          begin: Colors.transparent,
          end: Colors.white,
        ),
      )
      ..scene(
        begin: const Duration(milliseconds: 100),
        end: const Duration(milliseconds: 400),
      )
          .tween(
            'topPosition',
            Tween(begin: 0.0, end: 300.0),
          )
          .tween(
            'width',
            Tween(begin: screenSize.width, end: 106.0),
          )
          .tween(
            'height',
            Tween(begin: screenSize.height, end: 106.0),
          )
      ..scene(
        begin: const Duration(milliseconds: 1700),
        end: const Duration(milliseconds: 2000),
      ).tween(
        'topPosition',
        Tween(begin: 300.0, end: 230.0),
      );

    final logoTween = MovieTween()
      ..scene(
        begin: const Duration(milliseconds: 400),
        end: const Duration(milliseconds: 700),
      )
          .tween(
            'width',
            Tween(begin: 20.0, end: 80.0),
          )
          .tween(
            'height',
            Tween(begin: 20.0, end: 80.0),
          );

    final titleTween = MovieTween();

    final titleScene1 = titleTween
        .scene(
          begin: const Duration(milliseconds: 700),
          end: const Duration(milliseconds: 1000),
        )
        .tween(
          'opacity',
          Tween(begin: 0.0, end: 1.0),
        )
        .tween(
          'offsetX',
          Tween(begin: 100.0, end: 0.0),
        )
        .thenTween(
          duration: const Duration(milliseconds: 300),
          'topPosition',
          Tween(begin: 422.0, end: 352.0),
        );

    return Scaffold(
      backgroundColor: const Color(0xFFE43E3A),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PlayAnimationBuilder(
            tween: logoContainerTween,
            duration: const Duration(milliseconds: 2000),
            builder: (context, value, child) {
              return Positioned(
                top: value.get('topPosition'),
                child: Hero(
                  tag: 'appLogo',
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    width: value.get('width'),
                    height: value.get('height'),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(-1.77, 1.77),
                          blurRadius: 5.48,
                          color: const Color(0xFFC02A2A).withOpacity(0.15),
                        ),
                        BoxShadow(
                          offset: const Offset(-7.24, 6.71),
                          blurRadius: 9.89,
                          color: const Color(0xFFC02A2A).withOpacity(0.13),
                        ),
                      ],
                    ),
                    child: Center(
                      child: PlayAnimationBuilder(
                        tween: logoTween,
                        delay: const Duration(milliseconds: 410),
                        duration: const Duration(milliseconds: 700),
                        builder: (context, value, child) {
                          return SizedBox(
                            width: value.get('width'),
                            height: value.get('height'),
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          PlayAnimationBuilder(
            tween: titleTween,
            delay: const Duration(milliseconds: 700),
            duration: const Duration(milliseconds: 1000),
            builder: (context, value, child) {
              return Positioned(
                top: value.get('topPosition'),
                child: Transform.translate(
                  offset: Offset(value.get('offsetX'), 0),
                  child: Opacity(
                    opacity: value.get('opacity'),
                    child: const AppTitle(
                      text: 'SmartAttend',
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
