import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sub_button/hover_effect_widget.dart';

class AnimatedEffectButton extends StatefulWidget {
  const AnimatedEffectButton({super.key});

  @override
  State<AnimatedEffectButton> createState() => _AnimatedEffectButtonState();
}

class _AnimatedEffectButtonState extends State<AnimatedEffectButton>
    with SingleTickerProviderStateMixin {
  bool _subscribed = false;
  bool _animComplete = false;
  late AnimationController _controller;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.stop();
          _animComplete = true;
          // _controller.reset();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _colorAnimation = ColorTween(
      begin: Colors.white,
      end: Colors.pinkAccent,
    ).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
          animation: _colorAnimation,
          builder: (context, child) {
            return Stack(
              children: [
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _animComplete
                          ? Colors.white12
                          : (!_subscribed
                              ? Colors.white
                              : _colorAnimation.value),
                      foregroundColor:
                          !_subscribed ? Colors.black : Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _subscribed = !_subscribed;
                        if (_subscribed) {
                          _controller.forward();
                        } else {
                          _controller.reset();
                          _controller.stop();
                          _animComplete = false;
                        }
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_subscribed) ...[
                          Lottie.asset(
                            'assets/bell_white.json',
                            height: 20,
                            repeat: false,
                            animate: _subscribed,
                          ),
                          SizedBox(width: 5),
                        ],
                        Text(
                          _subscribed ? "Subscribed" : "Subscribe",
                        )
                      ],
                    ),
                  ),
                ),
                HoverEffectWidget(
                  subscribed: _subscribed,
                  done: _animComplete,
                  svg: "star",
                  size: 20,
                  marginBefore: EdgeInsets.only(
                    bottom: 10,
                    left: 45,
                  ),
                  marginAfter: EdgeInsets.only(
                    bottom: 70,
                    left: 50,
                  ),
                ),
                HoverEffectWidget(
                  subscribed: _subscribed,
                  done: _animComplete,
                  svg: "circle",
                  size: 20,
                  marginBefore: EdgeInsets.only(
                    top: 10,
                    right: 30,
                  ),
                  marginAfter: EdgeInsets.only(
                    top: 60,
                    right: 50,
                  ),
                ),
                HoverEffectWidget(
                  subscribed: _subscribed,
                  done: _animComplete,
                  svg: "star",
                  size: 10,
                  marginBefore: EdgeInsets.only(
                    bottom: 10,
                    left: 130,
                  ),
                  marginAfter: EdgeInsets.only(
                    bottom: 20,
                    left: 175,
                  ),
                ),
                HoverEffectWidget(
                  subscribed: _subscribed,
                  done: _animComplete,
                  svg: "star",
                  size: 15,
                  marginBefore: EdgeInsets.only(
                    bottom: 30,
                    right: 100,
                  ),
                  marginAfter: EdgeInsets.only(
                    bottom: 10,
                    right: 150,
                  ),
                ),
                HoverEffectWidget(
                  subscribed: _subscribed,
                  done: _animComplete,
                  svg: "circle",
                  size: 15,
                  marginBefore: EdgeInsets.only(
                    top: 10,
                    left: 100,
                  ),
                  marginAfter: EdgeInsets.only(
                    top: 60,
                    left: 150,
                  ),
                ),
                HoverEffectWidget(
                  subscribed: _subscribed,
                  done: _animComplete,
                  svg: "star",
                  size: 15,
                  marginBefore: EdgeInsets.only(
                    bottom: 30,
                    right: 100,
                  ),
                  marginAfter: EdgeInsets.only(
                    bottom: 10,
                    right: 150,
                  ),
                ),
              ],
            );
          }),
    );
  }
}
