import 'package:flutter/material.dart';
import 'package:warsha_app/core/theme/app_colors.dart';

class EditProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EditProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Edit Profile',
        style: TextStyle(
          color: AppColors.textDark,
          fontWeight: FontWeight.bold,
          fontFamily: 'Roboto',
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(width: 8),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            behavior: HitTestBehavior.opaque,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new,
                    size: 14,
                    color: Colors.grey,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      leadingWidth: 90,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
