import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Powered by Lucify',
        style: TextStyle(
          fontSize: 14,
          color: Color(0xFF1B1B1B),
        ),
      ),
    );
  }
}
