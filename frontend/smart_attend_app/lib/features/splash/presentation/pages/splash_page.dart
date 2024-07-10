import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:smart_attend_app/common/widgets/footer.dart';
import 'package:smart_attend_app/common/widgets/title.dart';
import 'package:smart_attend_app/features/auth/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _springAnimationController;
  late AnimationController _footerAnimationController;

  late Animation<Color?> _logoContainerBackgroundAnimation;
  late Animation<double> _logoContainerTopPositionAnimation;
  late Animation<double> _logoContainerRadiusAnimation;
  late Animation<double> _logoContainerSizeAnimation;
  late Animation<double> _logoSizeAnimation;
  late Animation<double> _titleOpacityAnimation;
  late Animation<double> _titleSlideAnimation;

  late SpringSimulation _springSimulation;
  late SpringSimulation _footerSimulation;

  final double footerInitialPosition = -100;

  @override
  void initState() {
    super.initState();

    const double animationDuration = 1000.0;

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: animationDuration.toInt(),
      ),
    );

    _springAnimationController = AnimationController.unbounded(
      vsync: this,
    );

    _footerAnimationController = AnimationController.unbounded(
      vsync: this,
    );

    _logoContainerBackgroundAnimation = ColorTween(
      begin: Colors.transparent,
      end: Colors.white,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0,
          100 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    _logoContainerTopPositionAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: -88.0,
            end: 193.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 193.0,
            end: 272.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 272.0,
            end: 300.0,
          ),
          weight: 1,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          100 / animationDuration,
          400 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    _logoContainerSizeAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: 954.0,
            end: 318.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 318.0,
            end: 159.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 159.0,
            end: 106.0,
          ),
          weight: 1,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          100 / animationDuration,
          400 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    _logoContainerRadiusAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: 180.0,
            end: 60.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 60.0,
            end: 30.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 30.0,
            end: 20.0,
          ),
          weight: 1,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          100 / animationDuration,
          400 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    // _logoContainerHeightAnimation = Tween(
    //   begin: 1000.0,
    //   end: 106.0,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _animationController,
    //     curve: const Interval(
    //       100 / animationDuration,
    //       400 / animationDuration,
    //       curve: Curves.easeOut,
    //     ),
    //   ),
    // );

    _logoSizeAnimation = TweenSequence<double>(
      [
        TweenSequenceItem(
          tween: Tween(
            begin: 20.0,
            end: 10.0,
          ),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: Tween(
            begin: 10.0,
            end: 80.0,
          ),
          weight: 3,
        ),
      ],
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          300 / animationDuration,
          700 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    _titleOpacityAnimation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          700 / animationDuration,
          1000 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    _titleSlideAnimation = Tween(
      begin: 100.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          700 / animationDuration,
          1000 / animationDuration,
          curve: Curves.easeOut,
        ),
      ),
    );

    _springSimulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 177.8,
        damping: 20,
      ),
      300,
      230,
      0,
    );

    _footerSimulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 6400,
        damping: 120,
      ),
      footerInitialPosition,
      40,
      0,
    );

    Future.delayed(
      const Duration(milliseconds: 1),
      () async {
        _animationController.forward();
        await Future.delayed(
          Duration(
            milliseconds: animationDuration.toInt() + 100,
          ),
        );

        _footerAnimationController.animateWith(_footerSimulation);

        await Future.delayed(
          const Duration(
            milliseconds: 300,
          ),
        );

        _springAnimationController.animateWith(_springSimulation);

        await Future.delayed(
          const Duration(
            milliseconds: 300,
          ),
        );

        moveToNextScreen();
      },
    );
  }

  void moveToNextScreen() {
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
  void dispose() {
    _animationController.dispose();
    _springAnimationController.dispose();
    _footerAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE43E3A),
      body: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _springAnimationController,
            builder: (context, child) {
              return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Positioned(
                    top: _springAnimationController.value == 0
                        ? _logoContainerTopPositionAnimation.value
                        : _springAnimationController.value,
                    child: Hero(
                      tag: 'appLogo',
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            width: _logoContainerSizeAnimation.value,
                            height: _logoContainerSizeAnimation.value,
                            decoration: BoxDecoration(
                              color: _logoContainerBackgroundAnimation.value,
                              borderRadius: BorderRadius.circular(
                                _logoContainerRadiusAnimation.value,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(-1.77, 1.77),
                                  blurRadius: 5.48,
                                  color:
                                      const Color(0xFFC02A2A).withOpacity(0.15),
                                ),
                                BoxShadow(
                                  offset: const Offset(-7.24, 6.71),
                                  blurRadius: 9.89,
                                  color:
                                      const Color(0xFFC02A2A).withOpacity(0.13),
                                ),
                              ],
                            ),
                            child: Center(
                              child: SizedBox(
                                width: _logoSizeAnimation.value,
                                height: _logoSizeAnimation.value,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Transform.translate(
                            offset: Offset(_titleSlideAnimation.value, 0),
                            child: Opacity(
                              opacity: _titleOpacityAnimation.value,
                              child: const AppTitle(
                                text: 'SmartAttend',
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
          AnimatedBuilder(
            animation: _footerAnimationController,
            builder: (context, child) {
              return Positioned(
                bottom: _footerAnimationController.value == 0
                    ? footerInitialPosition
                    : _footerAnimationController.value,
                child: const Footer(
                  color: Colors.white,
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
