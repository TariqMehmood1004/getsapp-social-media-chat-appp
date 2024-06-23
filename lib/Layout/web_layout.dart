import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../screens/contacts_list.dart';
import '../utils/colors.dart';
import '../widgets/custom_bottom_send_message_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_widget.dart';

class WebLayoutScreen extends StatefulWidget {
  const WebLayoutScreen({super.key});

  @override
  State<WebLayoutScreen> createState() => _WebLayoutScreenState();
}

class _WebLayoutScreenState extends State<WebLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(
                width: width * 0.4,
                height: height,
                decoration: const BoxDecoration(
                  color: colorWhite,
                  border: Border(
                    right: BorderSide(
                      color: colorOffWhite,
                      width: 1,
                    ),
                  ),
                ),
                child: ContactsListScreen(),
              ),
            ),
            Container(
              width: width * 0.6,
              height: height,
              decoration: const BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: CustomTextWidget(
                        text: 'GetsApp',
                        color: colorDark,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        textStyle: GoogleFonts.aBeeZee(
                          textStyle: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ),
                  ),
                  CustomSendMessageButtonContainer(
                    width: width,
                    height: height * 0.13,
                    radius: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
