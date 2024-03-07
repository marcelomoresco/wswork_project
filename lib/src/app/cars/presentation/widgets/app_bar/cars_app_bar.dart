import 'package:flutter/material.dart';

class CarsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CarsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        "Carros",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      centerTitle: true,
      backgroundColor: Colors.blue.shade800,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
