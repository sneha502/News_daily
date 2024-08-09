import 'package:flutter/material.dart';
import 'package:new_j/utils/colors.dart';
import 'package:new_j/utils/text.dart';

class appbar extends StatelessWidget implements PreferredSizeWidget {
   appbar({Key? key}) :
         preferredSize = Size.fromHeight(50),
         super(key: key);

   @override
   final Size preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
      ],
      backgroundColor: AppColors.black,
      elevation: 0,
      title: Container(
        height: 40,
        child: Row(
          children: [
            boldText(text: 'Tech', color: AppColors.primary, size: 20),
            modifiedText(text: 'Newz', color: AppColors.lightwhite, size: 20),
          ],
        ),
      ),
      centerTitle: true,
    );
  }
}
