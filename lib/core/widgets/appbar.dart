import 'package:flutter/material.dart';
import 'package:healthsync/core/constants/constants.dart';
import 'package:healthsync/core/theme/app_text_styles.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool showBack;
  final VoidCallback? onBack;

  const CommonAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
    this.showBack = true,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue.shade700, 
      title: Text(
        title ?? "",
        style: AppTextStyles.appbarHeading.copyWith(
          color: Colors.white,
        ),
      ),
      centerTitle: centerTitle,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: onBack ?? () => Navigator.pop(context),
            )
          : null,
      actions: actions,
      elevation: 0, 
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
