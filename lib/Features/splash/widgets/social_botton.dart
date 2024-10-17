import 'package:flutter/material.dart';
import 'package:template/core/presentation/managers/color_manager.dart';

class SocalButton extends StatelessWidget {
  final Color color;
  final Color textcolor;
  final String text;
  final Widget? icon;
  final GestureTapCallback press;
  final isBusy;

  const SocalButton({
    super.key,
    required this.color,
    required this.icon,
    required this.press,
    required this.text,
    required this.textcolor,
    this.isBusy,
  });

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 16, vertical: 10);
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: padding,
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
        ),
        onPressed: isBusy ? () {} : press,
        child: Row(
          children: [
            isBusy
                ? SizedBox(
                    height: 20,
                    width: 20,
                    child: const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(4),
                    height: 28,
                    width: 28,
                    decoration: BoxDecoration(
                      // color: icon != null ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    child: icon,
                  ),
            const Spacer(flex: 2),
            Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: textcolor, fontWeight: FontWeight.w600),
              ),
            ),
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}
