import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  final Color color;
  const Footer({
    super.key,
    this.color = const Color(0xFF1B1B1B),
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Powered by Lucify',
        style: TextStyle(
          fontSize: 14,
          color: color,
        ),
      ),
    );
  }
}
