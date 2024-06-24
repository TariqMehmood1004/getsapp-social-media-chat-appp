import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tabler_icons/tabler_icons.dart';

import '../services/contacts_list_info.dart';
import '../utils/colors.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/custom_text_widget.dart';
import 'chat_room.dart';
import 'view_status.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'Updates',
          color: colorWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        centerTitle: false,
        backgroundColor: colorDark,
        elevation: 0.0,
        actions: [
          // menu Icon Button
          CustomIconButton(
            icon: TablerIcons.dots_vertical,
            color: colorBlueLight,
            size: 20,
            onPressed: () {
              CustomShowMenu(context);
            },
          ),
        ],
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, bottom: 5),
                    child: CustomTextWidget(
                      text: 'Update Status',
                      color: colorDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textStyle: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                // padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                margin: const EdgeInsets.only(left: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      info.length,
                      (index) {
                        final data = info[index];
                        return GestureDetector(
                          onTap: () {
                            Get.to(
                              () => ViewStatusScreen(data: data),
                              transition: Transition.circularReveal,
                              duration: const Duration(milliseconds: 500),
                              popGesture: true,
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.only(right: 2),
                            decoration: BoxDecoration(
                              // color: colorBlue,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 26,
                                  backgroundImage: NetworkImage(
                                    data['profilePic'].toString(),
                                    scale: 0.5,
                                  ),
                                ),
                                SizedBox(height: 10),
                                CustomTextWidget(
                                  text: data['name'].toString(),
                                  color: colorDark,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  textStyle: GoogleFonts.aBeeZee(
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 20, bottom: 5),
                    child: CustomTextWidget(
                      text: 'Recents',
                      color: colorDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      textStyle: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                itemCount: info.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  final data = info[index];
                  return ListTile(
                    onTap: () {
                      Get.to(
                        () => ChatRoomScreen(data: data),
                        transition: Transition.circularReveal,
                        duration: const Duration(milliseconds: 500),
                        popGesture: true,
                      );
                    },
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 2,
                    ),
                    leading: CircleAvatar(
                      radius: 24,
                      backgroundImage: NetworkImage(
                        info[index]['profilePic'].toString(),
                        scale: 0.5,
                      ),
                    ),
                    trailing: CustomTextWidget(
                      text: info[index]['time'].toString(),
                      color: colorPrimary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      textStyle: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    title: CustomTextWidget(
                      text: info[index]['name'].toString(),
                      color: colorDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      textStyle: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    subtitle: CustomTextWidget(
                      text: info[index]['message'].toString(),
                      color: colorGray,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textStyle: GoogleFonts.aBeeZee(
                        textStyle: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  );
                },
              ),
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
        PopupMenuItem(
          value: 'privacy',
          height: 40,
          enabled: true,
          key: Key('privacy'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.lock, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Privacy',
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
            log('Privacy');
          },
        ),
      ],
    );
  }
}
