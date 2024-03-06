import 'package:flutter/material.dart';

class WsButton extends StatelessWidget {
  const WsButton({
    super.key,
    required this.onPressed,
    required this.title,
    this.color,
    this.width,
    this.height,
    this.fontSize = 18,
    this.isLoading = false,
    this.opacity = 1,
    this.icon,
    this.padding = EdgeInsets.zero,
    this.loadingColor,
    this.loadingBackgroundColor,
    this.loadingStrokeWidth,
  });

  final void Function()? onPressed;
  final String title;
  final Color? color;
  final double? width;
  final double? height;
  final double fontSize;
  final bool isLoading;
  final double opacity;
  final Widget? icon;
  final EdgeInsetsGeometry padding;
  final Color? loadingColor;
  final Color? loadingBackgroundColor;
  final double? loadingStrokeWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Opacity(
        opacity: opacity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            backgroundColor: Colors.blue.shade800,
            disabledBackgroundColor: const Color(0XFFE0E0E0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Visibility(
                visible: icon != null,
                child: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: icon,
                ),
              ),
              Flexible(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
