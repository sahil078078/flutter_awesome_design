import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_awesome_design/commonWidget/custom_button.dart';
import 'package:flutter_awesome_design/commonWidget/custom_textform_field.dart';
import 'package:flutter_awesome_design/constants/color_constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

class WhataAppLauncherBody extends StatefulWidget {
  const WhataAppLauncherBody({Key? key}) : super(key: key);

  @override
  State<WhataAppLauncherBody> createState() => _WhataAppLauncherBodyState();
}

class _WhataAppLauncherBodyState extends State<WhataAppLauncherBody> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _smsController = TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _smsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 10,
      ),
      child: Form(
        key: _fromKey,
        child: Column(
          children: [
            CustomTextField(
              controller: _phoneController,
              lableText: 'Mobile',
              hindText: 'Enter mobile number',
              maxLength: 10,
              prefixIcon: const Icon(
                Icons.phone_android,
                color: GlobalVariable.orangeColor,
              ),
              inputFormatters: [
                FilteringTextInputFormatter.allow(
                  RegExp(r'[0-9]'),
                ),
              ],
              keyboardType: TextInputType.number,
              validator: (mobileNumber) {
                Pattern pattern = r'(^(?:[+0]9)?[0-9]{10,}$)';
                RegExp regExp = RegExp(pattern.toString());
                if (mobileNumber == null || mobileNumber.isEmpty) {
                  return 'Please enter mobile number';
                } else if (mobileNumber.length != 10) {
                  return 'Please enter 10 digit ';
                } else if (!regExp.hasMatch(mobileNumber)) {
                  return 'Please enter valid number';
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              controller: _smsController,
              lableText: 'Message',
              hindText: 'Enter your message',
              prefixIcon: const Icon(
                Icons.message,
                color: GlobalVariable.orangeColor,
              ),
              keyboardType: TextInputType.text,
            ),
            CustomButtom(
              width: MediaQuery.of(context).size.width * 0.4,
              buttonText: 'Send',
              onPressed: () {
                if (_fromKey.currentState!.validate()) {
                  whatsAppLauncher(
                      mobileNumber: _phoneController.text,
                      text: _smsController.text.isEmpty
                          ? "Hello"
                          : _smsController.text);
                }
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  whatsAppLauncher({required String mobileNumber, required String text}) async {
    /*
    var whatsappURlAndroid =
        "whatsapp://send?phone=" "+91$mobileNumber" "&text=$text";

    var whatappURLIos =
        "https://wa.me/+91$mobileNumber?text=${Uri.parse(text)}";
    // for ios only

    if (Platform.isIOS) {
      if (await canLaunchUrl(Uri.parse(whatappURLIos))) {
        await launchUrl(
          Uri.parse(whatappURLIos),
        );
      } else {
        Fluttertoast.showToast(msg: '"whatsapp no installed"');
      }
    }
    // for android and web
    else {
      if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
        launchUrl(
          Uri.parse(whatsappURlAndroid),
          mode: LaunchMode.platformDefault,
          webViewConfiguration: WebViewConfiguration(),
        );
      } else {
        Fluttertoast.showToast(msg: '"whatsapp no installed"');
        log("whatsapp no installed");
      }
    }
*/
    final link = WhatsAppUnilink(
      text: text,
      phoneNumber: "+91" + mobileNumber,
    );
    await launchUrl(Uri.parse(link.toString()));
  }
}
