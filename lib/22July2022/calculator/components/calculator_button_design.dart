import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_provider.dart';
import 'package:flutter_awesome_design/22July2022/calculator/components/calculator_sharedpref.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CalculatorButtonDesign extends StatefulWidget {
  final String? buttonName;
  final double? width, height;
  final TextStyle? textStyle;
  final Widget? child;
  final double? textSize;
  final VoidCallback onPressed;
  const CalculatorButtonDesign({
    required this.onPressed,
    Key? key,
    this.buttonName,
    this.height,
    this.width,
    this.textStyle,
    this.child,
    this.textSize,
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
      autoStart: false,
      playInBackground: PlayInBackground.disabledRestoreOnForeground,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
    assetsAudioPlayer.dispose();
  }

  // static Future<void> play(SystemSoundType type) async {
  //   await SystemChannels.platform.invokeMethod<void>(
  //     'SystemSound.play',
  //     type.toString(),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    bool isDark =
        Provider.of<CalculatorProvider>(context, listen: true).isDarkMode;

    return Listener(
      onPointerUp: (valUp) {
        // play(SystemSoundType.alert);
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
        widget.onPressed();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        width: widget.width ?? MediaQuery.of(context).size.width * 0.19,
        height: widget.height ?? MediaQuery.of(context).size.height * 0.095,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xffecf0f3),
          border: Border.all(
            color: isDark
                ? !isPresse
                    ? Colors.white.withOpacity(0.2)
                    : Colors.white.withOpacity(0.075)
                : !isPresse
                    ? Colors.black.withOpacity(0.1)
                    : Colors.black.withOpacity(0.065),
          ),
          gradient: isDark
              ? LinearGradient(
                  end: Alignment.topLeft,
                  begin: Alignment.bottomRight,
                  colors: isPresse
                      ? [
                          const Color(0xff151515),
                          const Color(0xff515151),
                        ]
                      : [
                          const Color(0xff333333),
                          const Color(0xff333333),
                        ],
                )
              : LinearGradient(
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
          boxShadow: isDark
              ? isPresse
                  ? [
                      const BoxShadow(
                        offset: Offset(8, 8),
                        color: Color(0xff151515),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                      const BoxShadow(
                        offset: Offset(-8, -8),
                        color: Color(0xff515151),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                    ]
                  : []
              : isPresse
                  ? [
                      const BoxShadow(
                        offset: Offset(8, 8),
                        // color: Colors.grey[300]!,
                        color: Color(0xffffffff),
                        blurRadius: 8,
                        spreadRadius: 2,
                      ),
                      const BoxShadow(
                        offset: Offset(-5.5, -5.5),
                        // color: Colors.white.withOpacity(0.85),
                        color: Color(0xffced2d5),
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
                      fontSize: widget.textSize ?? 23,
                      fontWeight: FontWeight.w600,
                      color: isDark
                          ? const Color(0xffff9b42)
                          : const Color(0xff00c3f5),
                    ),
                textAlign: TextAlign.center,
              ),
        ),
      ),
    );
  }
}
