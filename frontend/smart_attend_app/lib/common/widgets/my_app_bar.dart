import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/widgets/title.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final bool canGoBack = Navigator.of(context).canPop();
    return SizedBox(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          canGoBack
              ? GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDADADA),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      'assets/images/arrow_back.png',
                    ),
                  ),
                )
              : const AppTitle(
                  text: 'SmartAttend',
                  color: Color(0xFFE43E3A),
                  fontWeight: FontWeight.w600,
                ),
          Container(
            width: 40,
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.grey,
            ),
            child: Image.asset('assets/images/profile.png'),
          ),
        ],
      ),
    );
  }
}
