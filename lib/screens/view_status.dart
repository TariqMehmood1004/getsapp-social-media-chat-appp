import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';
import '../widgets/custom_text_widget.dart';

class ViewStatusScreen extends StatefulWidget {
  const ViewStatusScreen({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  State<ViewStatusScreen> createState() => _ViewStatusScreenState();
}

class _ViewStatusScreenState extends State<ViewStatusScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: colorBlack,
            child: InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              panEnabled: true,
              scaleEnabled: true,
              onInteractionEnd: (_) {
                // Return the image to its original position
                // You can use a controller to reset the position
              },
              child: Image(
                width: width,
                height: height,
                image: NetworkImage(
                  widget.data['profilePic'].toString(),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              width: width,
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              decoration: BoxDecoration(
                color: colorBlack.withOpacity(0.4),
                borderRadius: BorderRadius.circular(0),
              ),
              child: ListTile(
                leading: InkWell(
                  onTap: () => Get.back(),
                  borderRadius: BorderRadius.circular(100),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  child: CircleAvatar(
                    radius: 22,
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
                  text: widget.data['status'].toString(),
                  color: colorWhite,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  textStyle: GoogleFonts.aBeeZee(
                    textStyle: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
