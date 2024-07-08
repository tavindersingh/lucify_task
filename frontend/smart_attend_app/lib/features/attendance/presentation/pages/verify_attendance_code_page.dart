import 'package:flutter/material.dart';
import 'package:smart_attend_app/common/helpers/open_dialog.dart';
import 'package:smart_attend_app/common/widgets/dialog_widget.dart';
import 'package:smart_attend_app/common/widgets/footer.dart';
import 'package:smart_attend_app/common/widgets/my_app_bar.dart';

class VerifyAttendanceCodePage extends StatelessWidget {
  const VerifyAttendanceCodePage({super.key});

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
            Column(
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
                const SizedBox(
                  height: 22,
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
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    openSuccessDialog(context);
                  },
                  child: const Text('Submit'),
                ),
              ],
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
        onDoneClick: () {},
      ),
    );
  }
}
