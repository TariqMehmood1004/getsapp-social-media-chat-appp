import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../utils/colors.dart';
import 'custom_icon_button.dart';

class CustomSendMessageButtonContainer extends StatelessWidget {
  const CustomSendMessageButtonContainer({
    super.key,
    required this.width,
    required this.height,
    this.radius = 10,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: width >= 600 ? height + 25 : height,
      padding: const EdgeInsets.only(left: 20, right: 8, top: 5, bottom: 5),
      decoration: BoxDecoration(
        color: colorOffWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(radius),
          topRight: Radius.circular(radius),
        ),
      ),
      child: Row(
        children: [
          // Attachment Icon Button
          CustomIconButton(
            icon: TablerIcons.paperclip,
            color: colorBlack,
            size: 20,
            backgrounColor: Colors.red,
            onPressed: () => {},
          ),
          // Send Message Text Field
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              expands: true,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: 'Type a message',
                hintStyle: GoogleFonts.poppins(
                  textStyle: Theme.of(context).textTheme.bodySmall,
                  color: colorBlack.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          CustomIconButton(
            icon: TablerIcons.send,
            color: colorBlack,
            size: 20,
            onPressed: () => {},
          ),
        ],
      ),
    );
  }
}
