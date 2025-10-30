// 🔸 Widget Menu (Settings, Logout, dll)
import 'package:flutter/material.dart';

Widget menuItem(IconData icon, String title, {bool isLogout = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
    child: Row(
      children: [
        Icon(icon, color: isLogout ? Colors.red : Colors.black87),
        const SizedBox(width: 12),
        Text(
          title,
          style: TextStyle(
            color: isLogout ? Colors.red : Colors.black87,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}
