import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HoverEffectWidget extends StatelessWidget {
  final bool subscribed;
  final bool done;
  final String svg;
  final EdgeInsetsGeometry marginBefore;
  final EdgeInsetsGeometry marginAfter;
  final double size;

  const HoverEffectWidget({
    super.key,
    required this.subscribed,
    required this.svg,
    required this.marginBefore,
    required this.marginAfter,
    required this.size,
    this.done = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: !done
          ? AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              curve: Curves.easeInOut,
              alignment: Alignment.center,
              margin: !subscribed ? marginBefore : marginAfter,
              child: SvgPicture.asset(
                'assets/$svg.svg',
                width: subscribed ? size : 0,
                height: subscribed ? size : 0,
              ),
            )
          : Container(),
    );
  }
}
