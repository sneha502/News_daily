import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_j/backend/functions.dart';
import 'package:new_j/utils/colors.dart';


class Searchbar extends StatefulWidget {
  static TextEditingController searchcontroller = TextEditingController(text: '');
  const Searchbar({Key? key}) : super(key: key);

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(width: 10,),
                  Expanded(
                      child: TextField(
                        controller: Searchbar.searchcontroller,
                        decoration: InputDecoration(
                          hintText: 'Search a keyword or a phrase',
                          hintStyle: GoogleFonts.lato(),
                          border: InputBorder.none,
                        ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: (){
            FocusScope.of(context).unfocus();
            fetchnews();
          },
          child: Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: AppColors.darkgrey,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.search,
              color: AppColors.white,
            ),
          ),
        ),
        SizedBox(width: 10,),
      ],
    );
  }
}
