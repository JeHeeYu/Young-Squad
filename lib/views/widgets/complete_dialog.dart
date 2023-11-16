import 'package:flutter/material.dart';
import 'package:young_squad/statics/colors.dart';

import '../../statics/strings.dart';

class completeDialog extends StatelessWidget {
  final String mainText;
  final String okButtonText;
  final String cancelButtonText;
  final void Function(int)? onPressed;

  const completeDialog({
    Key? key,
    required this.mainText,
    required this.okButtonText,
    required this.cancelButtonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SizedBox(
        height: 150,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 32.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Text(
                mainText,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Pretendard",
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(UserColors.enableColor),
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: () {
                          if (onPressed != null) {
                            onPressed!(0);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(okButtonText),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          minimumSize: const Size(100, 40),
                        ),
                        onPressed: () {
                          if (onPressed != null) {
                            onPressed!(1);
                            Navigator.pop(context);
                          }
                        },
                        child: Text(cancelButtonText),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showCompleteDialog(
    BuildContext context, void Function(int)? callback, String text) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return completeDialog(
        mainText: text,
        okButtonText: Strings.yes,
        cancelButtonText: Strings.no,
        onPressed: callback,
      );
    },
  );
}
