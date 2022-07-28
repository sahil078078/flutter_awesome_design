import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_sharedpref.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorButtonDesign extends StatefulWidget {
  final String? buttonName;
  final double? width, height;
  final TextStyle? textStyle;
  final Widget? child;
  const CalculatorButtonDesign({
    Key? key,
    this.buttonName,
    this.height,
    this.width,
    this.textStyle,
    this.child,
  })  : assert(child == null || buttonName == null,
            'child == null || buttonName == null is not true ,\nPlease use only one ether child or buttonName'),
        super(key: key);

  @override
  State<CalculatorButtonDesign> createState() => _CalculatorButtonDesignState();
}

class _CalculatorButtonDesignState extends State<CalculatorButtonDesign>
    with WidgetsBindingObserver {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  bool isPresse = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer.open(
      Audio('assets/audio/click2.mp3'),
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (valUp) {
        if (sharedPref.isSound) {
          assetsAudioPlayer.play();
        }
        setState(() {
          isPresse = true;
        });
      },
      onPointerDown: (valDown) {
        assetsAudioPlayer.stop();
        setState(() {
          isPresse = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width ?? MediaQuery.of(context).size.width * 0.19,
        height: widget.height ?? MediaQuery.of(context).size.height * 0.095,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffecf0f3),
          border: Border.all(
            color: !isPresse
                ? Colors.black.withOpacity(0.1)
                : Colors.black.withOpacity(0.065),
          ),
          gradient: LinearGradient(
            end: Alignment.topLeft,
            begin: Alignment.bottomRight,
            colors: isPresse
                ? [
                    //  this color is for convax effect in button
                    const Color(0xfffdffff),
                    const Color(0xffdbdfe3),
                  ]
                : [
                    //  this is for when button is down i don't wanna any effect
                    const Color(0xffecf0f3),
                    const Color(0xffecf0f3),
                  ],
          ),
          boxShadow: isPresse
              ? [
                  BoxShadow(
                    offset: const Offset(8, 8),
                    color: Colors.grey[300]!,
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                  BoxShadow(
                    offset: const Offset(-8, -8),
                    color: Colors.white.withOpacity(0.85),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: widget.child ??
              Text(
                widget.buttonName!,
                style: widget.textStyle ??
                    GoogleFonts.montserrat(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff00c3f5),
                    ),
                textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}
