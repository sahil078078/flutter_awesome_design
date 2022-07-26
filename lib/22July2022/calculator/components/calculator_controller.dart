import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'calculator_provider.dart';

class CalculatorController extends StatelessWidget {
  const CalculatorController({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              CupertinoIcons.speaker_3_fill,
              size: 27.5,
            ),
            const SizedBox(width: 7),
            CupertinoSwitch(
              dragStartBehavior: DragStartBehavior.start,
              value: context.watch<CalculatorProvider>().isButtonSound,
              onChanged: (isSound) {
                log('onChange : $isSound');
                context
                    .read<CalculatorProvider>()
                    .buttonSoundSetting(isSound: isSound);
              },
            ),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          padding: const EdgeInsets.all(2),
          width: 150,
          height: 32,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(5.5),
          ),
          child: Row(
            children: [
              InkWell(
                onTap: () => context
                    .read<CalculatorProvider>()
                    .darkModeSetting(isDark: false),
                child: Container(
                  width: 73,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: context.watch<CalculatorProvider>().isDarkMode
                        ? Colors.transparent
                        : Colors.black26,
                  ),
                  child: context.watch<CalculatorProvider>().isDarkMode
                      ? Center(
                          child: Text(
                            'Sun',
                            style: GoogleFonts.nunito(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : const Center(
                          child: Icon(
                            CupertinoIcons.sun_max,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
              InkWell(
                onTap: () => context
                    .read<CalculatorProvider>()
                    .darkModeSetting(isDark: true),
                child: Container(
                  width: 73,
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.5),
                    color: context.watch<CalculatorProvider>().isDarkMode
                        ? Colors.black
                        : Colors.transparent,
                  ),
                  child: context.watch<CalculatorProvider>().isDarkMode
                      ? const Center(
                          child: Icon(
                            CupertinoIcons.moon,
                            color: Colors.white,
                          ),
                        )
                      : Center(
                          child: Text(
                            'Moon',
                            style: GoogleFonts.nunito(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
