import 'package:edusmart/preferences/preferences_handler.dart';
import 'package:edusmart/view/loginedu.dart';
import 'package:edusmart/widget/announcementsW.dart';
import 'package:edusmart/widget/nilai.dart';
import 'package:edusmart/widget/schedule.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              // Schedule atas biru
              Container(
                height: 100,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Color(0XFF2567E8),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Text(
                      "Schedule",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Class Schedule", style: TextStyle(fontSize: 24)),
                        Text(
                          "Week of Oct 27-31, 2025",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xffeaf0ff),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.calendar_today,
                        color: Color(0xff3b82f6),
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              // Container Attendance
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Text("Monday", style: TextStyle(fontSize: 18)),
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xffeaf0ff),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text("4 classes"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Container Annoucements
              Container(
                padding: EdgeInsets.only(left: 20),
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 2),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0x10FF6900),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.notifications_none_outlined,
                              color: Color(0xffFF6900),
                              size: 20,
                            ),
                          ),
                          // Icon(
                          //   Icons.notifications_none_outlined,
                          //   color: Color(0xffFF6900),
                          //   size: 26,
                          // ),
                          SizedBox(width: 8),
                          Text(
                            'Announcements',
                            style: TextStyle(fontSize: 16.9),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 12.8,
                                color: Color(0xff2F80ED),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              PreferenceHandler.removeLogin();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginEdu(),
                                ),
                                (route) => false,
                              );
                            },
                            child: Text("Logout"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      height: 160,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: const [
                          AnnouncementItem(
                            label: "Important",
                            date: "Oct 25, 2025",
                            title: "Mid-Term Exam Schedule Released",
                            author: "Mrs. Sarah Johnson",
                          ),
                          AnnouncementItem(
                            label: "Notice",
                            date: "Oct 20, 2025",
                            title: "Library Will Be Closed on Friday",
                            author: "Admin Office",
                          ),
                          AnnouncementItem(
                            label: "Update",
                            date: "Oct 18, 2025",
                            title: "New Course Materials Available Online",
                            author: "Mr. David Lee",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Container Today Schedule
              Container(
                padding: EdgeInsets.only(left: 20, top: 16),
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 474,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0x103b82f6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.access_time,
                              color: Color(0xff3b82f6),
                              size: 20,
                            ),
                          ),
                          // Icon(
                          //   Icons.notifications_none_outlined,
                          //   color: Color(0xffFF6900),
                          //   size: 26,
                          // ),
                          SizedBox(width: 8),
                          Text(
                            "Today's Schadule",
                            style: TextStyle(fontSize: 16.9),
                          ),
                          Spacer(),
                          Text(
                            "Monday",
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.all(4),
                      child: Column(
                        children: [
                          ScheduleTile(
                            color: Colors.purple,
                            subject: "Mathematics",
                            teacher: "Mr. Robert Wilson",
                            room: "Room 201",
                            time: "08:00 - 09:30",
                          ),
                          ScheduleTile(
                            color: Colors.blue,
                            subject: "Physics",
                            teacher: "Mrs. Emily Davis",
                            room: "Lab 1",
                            time: "09:45 - 11:15",
                          ),
                          ScheduleTile(
                            color: Colors.green,
                            subject: "English Literature",
                            teacher: "Ms. Lisa Anderson",
                            room: "Room 105",
                            time: "12:00 - 13:30",
                          ),
                          ScheduleTile(
                            color: Colors.orange,
                            subject: "Chemistry",
                            teacher: "Dr. Michael Brown",
                            room: "Lab 2",
                            time: "13:45 - 15:15",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              // Container Recent Grades
              Container(
                padding: EdgeInsets.only(left: 20, top: 16),
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: 474,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 2, right: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0x1000C950),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.trending_up,
                              color: Color(0xff00C950),
                              size: 20,
                            ),
                          ),
                          // Icon(
                          //   Icons.notifications_none_outlined,
                          //   color: Color(0xffFF6900),
                          //   size: 26,
                          // ),
                          SizedBox(width: 8),
                          Text(
                            "Recent Grades",
                            style: TextStyle(fontSize: 16.9),
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(
                                "Avarage",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "90",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    GradeTile(
                      subject: "Mathematics",
                      score: 95,
                      color: Colors.purple,
                      change: 5,
                    ),
                    GradeTile(
                      subject: "Physics",
                      score: 88,
                      color: Colors.blue,
                      change: 3,
                    ),
                    GradeTile(
                      subject: "English",
                      score: 92,
                      color: Colors.green,
                      change: -2,
                    ),
                    GradeTile(
                      subject: "Chemistry",
                      score: 85,
                      color: Colors.orange,
                      change: 8,
                    ),
                    GradeTile(
                      subject: "Ngoding",
                      score: 20,
                      color: Colors.red,
                      change: -40,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
