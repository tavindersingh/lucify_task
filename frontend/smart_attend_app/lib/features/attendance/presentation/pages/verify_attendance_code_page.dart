import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/helpers/open_dialog.dart';
import 'package:smart_attend_app/common/widgets/dialog_widget.dart';
import 'package:smart_attend_app/common/widgets/footer.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';

class VerifyAttendanceCodePage extends StatefulWidget {
  const VerifyAttendanceCodePage({super.key});

  @override
  State<VerifyAttendanceCodePage> createState() =>
      _VerifyAttendanceCodePageState();
}

class _VerifyAttendanceCodePageState extends State<VerifyAttendanceCodePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _slideAnimation = Tween(
      begin: 600.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _heightAnimation = Tween(
      begin: 50.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    Future.delayed(const Duration(milliseconds: 300), () {
      _controller.forward();
    });
  }

  @override
  void dispose() {
    super.dispose();

    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 56,
            ),
            const MyAppBar(),
            const SizedBox(
              height: 174,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, _slideAnimation.value),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Please enter code given by Professor',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B1B1B),
                        ),
                      ),
                      SizedBox(
                        height: 22 + _heightAnimation.value,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 36,
                            vertical: 24,
                          ),
                          hintText: 'Enter Code',
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
                      SizedBox(
                        height: 30 + 1.5 * _heightAnimation.value,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          openSuccessDialog(context);
                        },
                        child: const Text('Submit'),
                      ),
                    ],
                  ),
                );
              },
            ),
            const Spacer(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  void openSuccessDialog(BuildContext context) {
    openDialog(
      context: context,
      content: DialogWidget(
        title: 'Your attendance\nwas successfully marked',
        onDoneClick: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
