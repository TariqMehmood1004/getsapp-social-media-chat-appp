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

class ContactsListScreen extends StatefulWidget {
  const ContactsListScreen({super.key});

  @override
  State<ContactsListScreen> createState() => _ContactsListScreenState();
}

class _ContactsListScreenState extends State<ContactsListScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          text: 'GetsApp',
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
          // Wifi Icon Button
          CustomIconButton(
            icon: TablerIcons.wifi,
            color: colorBlueLight,
            size: 20,
            onPressed: () => {},
          ),

          // Data Icon Button
          CustomIconButton(
            icon: TablerIcons.device_mobile,
            color: colorBlueLight,
            size: 20,
            onPressed: () => {},
          ),

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
              // Show Chats Text
              Row(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, left: 20, bottom: 5),
                    child: CustomTextWidget(
                      text: 'Chats',
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
          value: 'notifications',
          height: 40,
          enabled: true,
          key: Key('notifications'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.bell, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Notifications',
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
            log('Notifications');
          },
        ),
        PopupMenuItem(
          value: 'help',
          height: 40,
          enabled: true,
          key: Key('help'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.help, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Help',
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
            log('Help');
          },
        ),
        PopupMenuItem(
          value: 'feedback',
          height: 40,
          enabled: true,
          key: Key('feedback'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.message, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Feedback',
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
            log('Feedback');
          },
        ),
        PopupMenuItem(
          value: 'about',
          height: 40,
          enabled: true,
          key: Key('about'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.info_circle, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'About',
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
            log('About');
          },
        ),
        PopupMenuItem(
          value: 'terms',
          height: 40,
          enabled: true,
          key: Key('terms'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.file_text, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Terms',
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
            log('Terms');
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
        PopupMenuItem(
          value: 'contact',
          height: 40,
          enabled: true,
          key: Key('contact'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.phone, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Contact',
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
            log('Contact');
          },
        ),
        PopupMenuItem(
          value: 'language',
          height: 40,
          enabled: true,
          key: Key('language'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.language, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Language',
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
            log('Language');
          },
        ),
        PopupMenuItem(
          value: 'dark_mode',
          height: 40,
          enabled: true,
          key: Key('dark_mode'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.moon, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Dark Mode',
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
            log('Dark Mode');
          },
        ),
        PopupMenuItem(
          value: 'light_mode',
          height: 40,
          enabled: true,
          key: Key('light_mode'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.sun, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Light Mode',
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
            log('Light Mode');
          },
        ),
        PopupMenuItem(
          value: 'refresh',
          height: 40,
          enabled: true,
          key: Key('refresh'),
          mouseCursor: SystemMouseCursors.click,
          textStyle: GoogleFonts.aBeeZee(
            textStyle: Theme.of(context).textTheme.bodyMedium,
          ),
          child: Row(
            children: [
              Icon(TablerIcons.refresh, color: colorDark, size: 17),
              SizedBox(width: 10),
              CustomTextWidget(
                text: 'Refresh',
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
            log('Refresh');
          },
        ),
      ],
    );
  }
}
