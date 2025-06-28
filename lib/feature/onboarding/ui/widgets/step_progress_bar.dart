import 'package:flutter/material.dart';

class CustomProgressBar extends StatefulWidget {
  final double progress;
  const CustomProgressBar({super.key, required this.progress});

  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 22,
        inactiveTrackColor: Color(0xFF5F6CAF),
        activeTrackColor: Color(0xFF5F6CAF),
        thumbColor: Color(0xFF5F6CAF),
        overlayColor: Color(0xFF5F6CAF),
        thumbShape: _CustomThumbShape(),
        trackShape: const RoundedRectSliderTrackShape(),
      ),
      child: Slider(
        value: widget.progress.clamp(0.0,1.0),
        onChanged: null,
        min: 0.0,
        max: 1.0,
      ),
    );
  }
}

class _CustomThumbShape extends SliderComponentShape {
  static const double _thumbSize = 28.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) => const Size(_thumbSize, _thumbSize);

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final canvas = context.canvas;

    // Draw circle
    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, _thumbSize / 2, paint);

    // Draw star icon
    const iconSize = 16.0;
    final builder = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(Icons.ac_unit.codePoint),
        style: TextStyle(
          fontSize: iconSize,
          fontFamily: Icons.star.fontFamily,
          package: Icons.star.fontPackage,
          color: Colors.white,
        ),
      ),
      textDirection: textDirection,
    )..layout();
    builder.paint(canvas, center - const Offset(iconSize / 2, iconSize / 2));
  }
}

