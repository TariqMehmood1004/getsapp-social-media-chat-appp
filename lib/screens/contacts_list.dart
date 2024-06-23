import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/contacts_list_info.dart';
import '../utils/colors.dart';
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
    return RefreshIndicator(
      onRefresh: () async {},
      child: SizedBox(
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
                        const EdgeInsets.only(top: 24, left: 20, bottom: 10),
                    child: CustomTextWidget(
                      text: 'Chats',
                      color: colorDark,
                      fontSize: 20,
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
                        transition: Transition.rightToLeftWithFade,
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
}
