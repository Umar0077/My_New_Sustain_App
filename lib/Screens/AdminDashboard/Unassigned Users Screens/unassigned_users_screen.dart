import 'package:al_mehdi_online_school/Screens/AdminDashboard/Unassigned%20Users%20Screens/Teachers_details.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/Unassigned%20Users%20Screens/assign_students.dart';
import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';

class UnassignedUsersScreen extends StatefulWidget {
  const UnassignedUsersScreen({super.key});

  @override
  State<UnassignedUsersScreen> createState() => _UnassignedUsersScreenState();
}

class _UnassignedUsersScreenState extends State<UnassignedUsersScreen> {
  List<Map<String, dynamic>> unassignedUsers = [
    {
      'name': 'Mehreen',
      'role': 'Teacher',
      'avatar': 'https://i.pravatar.cc/100?img=25',
    },
    {
      'name': 'jennie',
      'role': 'Teacher',
      'avatar': 'https://i.pravatar.cc/100?img=26',
    },
    {
      'name': 'Kim',
      'role': 'Teacher',
      'avatar': 'https://i.pravatar.cc/100?img=27',
    },
    {
      'name': 'zubia',
      'role': 'Teacher',
      'avatar': 'https://i.pravatar.cc/100?img=28',
    },
  ];

  void _navigateAssignStudents() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AssignStudents()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 600;

    final double fontSize = isWeb ? 18 : 14;
    final double padding = isWeb ? 24 : 16;
    final double avatarSize = isWeb ? 48 : 40;
    final double cardMargin = isWeb ? 16 : 12;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
            );
          },
        ),
        title: const Text(
          'Unassigned',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 12),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: unassignedUsers.length,
                separatorBuilder: (_, __) => SizedBox(height: cardMargin),
                itemBuilder: (context, index) {
                  final user = unassignedUsers[index];
                  final isTeacher = user['role'] == 'Teacher';

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TeachersDetails(user: user),
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 2))
                        ],
                      ),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: avatarSize / 2,
                            backgroundImage: NetworkImage(user['avatar']),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(user['name'] ?? '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: fontSize)),
                                const SizedBox(height: 4),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: isTeacher ? Colors.blue[50] : Colors.amber[50],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    user['role'] ?? '',
                                    style: TextStyle(
                                      fontSize: fontSize - 2,
                                      color: isTeacher ? Colors.blue : Colors.orange[800],
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.black),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            // Bottom Button
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 12),
              child: ElevatedButton(
                onPressed: _navigateAssignStudents,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF02D185),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Assign To',
                  style: TextStyle(
                      fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
