import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 2,
      backgroundColor: Colors.white,
      title: Text(
        'Dashboard',
        style: GoogleFonts.roboto(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          height: 1.3,
          letterSpacing: -0.4,
          color: const Color(0xff303030),
        ),
      ),
      centerTitle: true,
    );
  }
}
