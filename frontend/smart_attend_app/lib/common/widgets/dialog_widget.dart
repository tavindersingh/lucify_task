import 'package:flutter/material.dart';

class DialogWidget extends StatelessWidget {
  final bool isSuccess;
  final String title;
  final String? description;
  final VoidCallback onDoneClick;

  const DialogWidget({
    super.key,
    this.isSuccess = true,
    required this.title,
    this.description,
    required this.onDoneClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 32,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/x.png',
                width: 14,
                height: 14,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Image.asset(
            getIconPath(isSuccess),
            width: 54,
            height: 54,
          ),
          const SizedBox(
            height: 14,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1B1B1B),
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          SizedBox(
            width: 170,
            child: ElevatedButton(
              onPressed: onDoneClick,
              child: const Text('Done'),
            ),
          ),
        ],
      ),
    );
  }

  String getIconPath(bool status) {
    if (status) {
      return 'assets/images/alert_check.png';
    }

    return 'assets/images/alert_warn.png';
  }
}
