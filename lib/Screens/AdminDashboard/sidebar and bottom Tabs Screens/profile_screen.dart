import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/chat_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/attendance_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/schedule_class.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Color sidebarBgColor = const Color(0xffe6f6f1);
  final Color sidebarIconColor = Colors.black87;
  final Color sidebarActiveColor = appGreen;

  final List<Map<String, dynamic>> _sidebarItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.schedule, 'label': 'Schedule Class'}, // still in sidebar
    {'icon': Icons.chat_bubble, 'label': 'Chat'},
    {'icon': Icons.article, 'label': 'Attendance'},
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  int _selectedSidebarIndex = 4; // Profile index

  void _navigateTo(int index) {
    setState(() => _selectedSidebarIndex = index);
    switch (index) {
      case 0:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ScheduleClass()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ChatScreen()));
        break;
      case 3:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const AttendanceScreen()));
        break;
      case 4:
        // Already here
        break;
      case 5:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width >= 900;

    Widget leftProfileCard = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                const CircleAvatar(
                  radius: 54,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(blurRadius: 3, color: Colors.black26)],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 22,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Admin User',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 4),
            const Text(
              'Administrator',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.verified, size: 16, color: Colors.green),
                  SizedBox(width: 6),
                  Text(
                    'Verified',
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );

    Widget rightEditProfileCard = Card(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Edit Profile',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Full Name',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: 'Admin User',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Email Address',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: 'admin@example.com',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Phone Number',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            const TextField(
              decoration: InputDecoration(
                hintText: '+1234567890',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
            const SizedBox(height: 14),
            const Text(
              'Role',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 6),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text('Administrator'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Change Password',
                style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: appGreen,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                child: const Text(
                  'Save Changes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );

    Widget profileContent = isWeb
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 3, child: leftProfileCard),
              Flexible(flex: 5, child: rightEditProfileCard),
            ],
          )
        : SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                leftProfileCard,
                rightEditProfileCard,
              ],
            ),
          );

    return Scaffold(
      backgroundColor: Colors.white,
      body: isWeb
          ? Row(
              children: [
                // Sidebar
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: sidebarBgColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.black12, blurRadius: 8, offset: Offset(2, 0)),
                    ],
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _sidebarItems.asMap().entries.map((entry) {
                      int idx = entry.key;
                      Map<String, dynamic> item = entry.value;
                      bool isActive = idx == _selectedSidebarIndex;

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: InkWell(
                          onTap: () => _navigateTo(idx),
                          child: Row(
                            children: [
                              Icon(item['icon'],
                                  color:
                                      isActive ? sidebarActiveColor : sidebarIconColor),
                              const SizedBox(width: 12),
                              Text(
                                item['label'],
                                style: TextStyle(
                                  fontWeight:
                                      isActive ? FontWeight.bold : FontWeight.normal,
                                  color:
                                      isActive ? sidebarActiveColor : sidebarIconColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Main content
                Expanded(child: profileContent),
              ],
            )
          : Scaffold(
              backgroundColor: Colors.white,
              body: profileContent,
              bottomNavigationBar: BottomNavigationBar(
                // Removed Schedule Class tab here:
                currentIndex: 3, // Profile is now index 3 (0-based for this bottom nav)
                selectedItemColor: appGreen,
                unselectedItemColor: Colors.black,
                backgroundColor: Colors.white,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AdminHomeScreen()),
                      );
                      break;
                    case 1:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatScreen()),
                      );
                      break;
                    case 2:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AttendanceScreen()),
                      );
                      break;
                    case 3:
                      // Already here
                      break;
                    case 4:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingsScreen()),
                      );
                      break;
                  }
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
                  BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Attendance'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            ),
    );
  }
}
