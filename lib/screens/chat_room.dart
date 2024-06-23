import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabler_icons/tabler_icons.dart';
import '../utils/colors.dart';
import '../widgets/custom_bottom_send_message_button.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_widget.dart';
import '../widgets/custom_popup_menu_item.dart';

class ChatRoomScreen extends StatefulWidget {
  const ChatRoomScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: ListTile(
            leading: InkWell(
              onTap: () => Get.back(),
              borderRadius: BorderRadius.circular(100),
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              child: CircleAvatar(
                radius: 17,
                backgroundImage: NetworkImage(
                  widget.data['profilePic'].toString(),
                  scale: 0.5,
                ),
              ),
            ),
            title: CustomTextWidget(
              text: widget.data['name'].toString(),
              color: colorWhite,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textStyle: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            subtitle: CustomTextWidget(
              text: 'Online',
              color: colorWhite,
              fontSize: 10,
              fontWeight: FontWeight.w500,
              textStyle: GoogleFonts.aBeeZee(
                textStyle: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ),
          centerTitle: false,
          backgroundColor: colorDark,
          elevation: 0.0,
          actionsIconTheme: const IconThemeData(color: colorWhite),
          iconTheme: const IconThemeData(color: colorWhite),
          leading: const SizedBox(),
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          actions: [
            // Wifi Icon Button
            CustomIconButton(
              icon: TablerIcons.video_plus,
              size: 20,
              onPressed: () => {},
            ),

            // Data Icon Button
            CustomIconButton(
              icon: TablerIcons.phone,
              size: 20,
              onPressed: () => {},
            ),

            // menu Icon Button
            CustomIconButton(
              icon: TablerIcons.dots_vertical,
              size: 20,
              onPressed: () {
                CustomShowMenu(context);
              },
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Expanded(
                child: Text('Chat Room'),
              ),

              // Send Message Button
              CustomSendMessageButtonContainer(
                  width: width, height: height * 0.08),
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<String?> CustomShowMenu(BuildContext context) {
    return showMenu(
      context: context,
      color: colorOffWhite,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      clipBehavior: Clip.antiAlias,
      constraints: const BoxConstraints(maxWidth: 150),
      surfaceTintColor: colorGreen,
      useRootNavigator: true,
      position: RelativeRect.fromLTRB(100, 80, 0, 0),
      items: [
        PopupMenuItem(
          value: 'settings',
          height: 40,
          enabled: true,
          key: Key('settings'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.settings, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Settings',
                color: colorDark,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textStyle: GoogleFonts.aBeeZee(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          onTap: () {
            log('Settings');
          },
        ),
        PopupMenuItem(
          value: 'profile',
          height: 40,
          enabled: true,
          key: Key('profile'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.user, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Profile',
                color: colorDark,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                textStyle: GoogleFonts.aBeeZee(
                  textStyle: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
          onTap: () {
            log('Profile');
          },
        ),
      ],
    );
  }
}
