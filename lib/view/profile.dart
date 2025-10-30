import 'package:edusmart/widget/WidgetStatistic.dart';
import 'package:edusmart/widget/infotile.dart';
import 'package:edusmart/widget/judulW.dart';
import 'package:edusmart/widget/menu.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f9fc),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 40),
              decoration: const BoxDecoration(
                color: Color(0xFF2567E8),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundImage: AssetImage(
                      'assets/images/abe2.png',
                    ), // ganti path asset kamu
                    backgroundColor: Colors.white,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ahmad Syahputra",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Class 10 • IPA 2",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF2567E8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text("Edit Profile"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // 🔹 3 Statistik (Attendance, Grade, Courses)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statCard(
                    "92%",
                    "Attendance",
                    Icons.calendar_today,
                    Colors.blue,
                  ),
                  statCard(
                    "89.5",
                    "Average Grade",
                    Icons.bar_chart,
                    Colors.green,
                  ),
                  statCard("8", "Courses", Icons.book, Colors.purple),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // 🔹 Personal Information
            sectionTitle("Personal Information"),
            infoTile(Icons.email, "ahmad.syahputra@school.edu", "Email"),
            infoTile(Icons.phone, "+62 812-3456-7890", "Phone"),
            infoTile(
              Icons.location_on,
              "Jl. Pendidikan No. 123, Jakarta",
              "Address",
            ),
            infoTile(Icons.cake, "May 15, 2008", "Birth Date"),

            const SizedBox(height: 24),

            // 🔹 Parent/Guardian
            sectionTitle("Parent/Guardian"),
            infoTile(Icons.person, "Mr. Budi Syahputra", "Name"),
            infoTile(Icons.phone_android, "+62 813-2345-6789", "Contact"),

            const SizedBox(height: 24),

            // 🔹 Settings / Logout
            menuItem(Icons.edit, "Edit Profile"),
            menuItem(Icons.settings, "Settings"),
            menuItem(Icons.help_outline, "Help & Support"),
            menuItem(Icons.logout, "Logout", isLogout: true),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
