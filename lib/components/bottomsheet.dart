import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_j/utils/text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'components.dart';

void showMyBottomsheet(
BuildContext context , String title , description , imageurl , url ){
  showBottomSheet(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20), topRight: Radius.circular(20),
      ),
    ),
    elevation: 20,
    context: context,
    builder: (context) {
      return MyBottomSheetLayout(
          description: description,
          title: title,
          imageurl: imageurl,
          url: url);
    });
    }

    _launchURL(String url) async{
  if(await canLaunch(url)) {
    await launch(url);
  } else{
    throw 'Could not launch $url';
  }
    }

    class MyBottomSheetLayout extends StatelessWidget {
  final String description , title, imageurl , url;
      const MyBottomSheetLayout({Key? key,
        required this.description,
        required this.title,
        required this.imageurl,
        required this.url}) : super(key: key);
    
      @override
      Widget build(BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              BottomSheetImage(imageurl: imageurl, title: title),
              Container(
                padding: EdgeInsets.all(10),
                child: modifiedText(text: description, color: Colors.white, size: 16),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Read full Article',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          _launchURL(url);
                          },
                        style: GoogleFonts.lato(
                          color: Colors.blue.shade400,
                        )
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }
    }
    