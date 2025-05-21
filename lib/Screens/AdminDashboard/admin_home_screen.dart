import 'package:al_mehdi_online_school/Screens/AdminDashboard/active_class_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/fees_status_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/notifications.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/attendance_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/chat_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/profile_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/schedule_class.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/settings_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/total_users_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/Unassigned%20Users%20Screens/unassigned_users_screen.dart';
import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  final Color sidebarBgColor = const Color(0xffe6f6f1);
  final Color sidebarIconColor = Colors.black87;
  final Color sidebarActiveColor = appGreen;

  final List<Map<String, dynamic>> _sidebarItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.schedule, 'label': 'Schedule Class'},
    {'icon': Icons.chat_bubble, 'label': 'Chat'},
    {'icon': Icons.article, 'label': 'Attendance'},
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  int _selectedSidebarIndex = 0;

  void _goToActiveClass() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ActiveClassScreen()),
    );
  }

  void _goToTotalUsers() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TotalUsersScreen()),
    );
  }

  void _goToUnassignedUsers() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const UnassignedUsersScreen()),
    );
  }

  void _goToFeesStatus() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const FeesStatusScreen()),
    );
  }

  void _goToScheduleClass() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ScheduleClass()),
    );
  }

  void _goToChat() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  void _goToAttendance() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const AttendanceScreen()),
    );
  }

  void _goToProfile() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  void _goToSettings() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const SettingsScreen()),
    );
  }

  Widget _infoCard({
    required String assetPath,
    required String number,
    required String label,
    String? extraLabel,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 3)),
        ],
      ),
      constraints: const BoxConstraints(minWidth: 120, minHeight: 140),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(assetPath, width: 50, height: 50, fit: BoxFit.contain),
          const SizedBox(height: 12),
          Text(
            number,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          if (extraLabel != null) ...[
            const SizedBox(height: 4),
            Text(
              extraLabel,
              textAlign: TextAlign.center,
            ),
          ],
        ],
      ),
    );
  }

  Widget _userList() {
    return Container(
      margin: const EdgeInsets.only(top: 32),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Manage Users',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search Users...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
          const SizedBox(height: 12),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=1')),
            title: const Text('Ali Khan'),
            subtitle: const Text('ali.khan@example.com'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.grey[200], borderRadius: BorderRadius.circular(12)),
                  child: const Text('Student'),
                ),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                      color: Colors.green[300], borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    children: const [
                      Icon(Icons.check, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text('Paid', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth >= 900;

    if (isWeb) {
      return Scaffold(
        backgroundColor: Colors.grey[50],
        body: Row(
          children: [
            Container(
              width: 220,
              decoration: BoxDecoration(
                color: sidebarBgColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 0)),
                ],
              ),
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _sidebarItems.asMap().entries.map((entry) {
                  int idx = entry.key;
                  Map<String, dynamic> item = entry.value;
                  bool isActive = idx == _selectedSidebarIndex;

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _selectedSidebarIndex = idx;
                        });

                        switch (item['label']) {
                          case 'Home':
                            break;
                          case 'Schedule Class':
                            _goToScheduleClass();
                            break;
                          case 'Chat':
                            _goToChat();
                            break;
                          case 'Attendance':
                            _goToAttendance();
                            break;
                          case 'Profile':
                            _goToProfile();
                            break;
                          case 'Settings':
                            _goToSettings();
                            break;
                        }
                      },
                      child: Row(
                        children: [
                          Icon(
                            item['icon'],
                            color: isActive ? sidebarActiveColor : sidebarIconColor,
                          ),
                          const SizedBox(width: 12),
                          Text(
                            item['label'],
                            style: TextStyle(
                              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                              color: isActive ? sidebarActiveColor : sidebarIconColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/logo/Frame.png', width: 36, height: 36),
                            const SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Admin Dashboard',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 24)),
                                Text('Control center for everything',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            )
                          ],
                        ),
                        IconButton(
                          icon: const Icon(Icons.notifications_none),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Notifications()),
                            );
                          },
                        )
                      ],
                    ),
                    const SizedBox(height: 24),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        final spacing = 16.0;
                        final totalSpacing = spacing * 3;
                        final cardWidth = (constraints.maxWidth - totalSpacing) / 4;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: cardWidth,
                                  child: InkWell(
                                    onTap: _goToActiveClass,
                                    child: _infoCard(
                                      assetPath: 'assets/logo/Activeclass.png',
                                      number: '38',
                                      label: 'Active Classes',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cardWidth,
                                  child: InkWell(
                                    onTap: _goToTotalUsers,
                                    child: _infoCard(
                                      assetPath: 'assets/logo/Totaluser.png',
                                      number: '120',
                                      label: 'Total Users',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cardWidth,
                                  child: InkWell(
                                    onTap: _goToUnassignedUsers,
                                    child: _infoCard(
                                      assetPath: 'assets/logo/Unassigneduser.png',
                                      number: '30',
                                      label: 'Unassigned users',
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: cardWidth,
                                  child: InkWell(
                                    onTap: _goToFeesStatus,
                                    child: _infoCard(
                                      assetPath: 'assets/logo/Fees.png',
                                      number: 'Paid/Unpaid',
                                      label: 'Fees Status',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Add user action here
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: sidebarActiveColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text(
                                  '+ Add User',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    _userList(),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0,
          title: Row(
            children: [
              Image.asset('assets/logo/Frame.png', width: 32, height: 32),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Admin Dashboard',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  Text('Control center for everything',
                      style: TextStyle(color: Colors.grey, fontSize: 14)),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Notifications()),
                );
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  InkWell(
                    onTap: _goToActiveClass,
                    child: SizedBox(
                      width: (screenWidth - 48) / 2,
                      child: _infoCard(
                        assetPath: 'assets/logo/Activeclass.png',
                        number: '38',
                        label: 'Active Classes',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _goToTotalUsers,
                    child: SizedBox(
                      width: (screenWidth - 48) / 2,
                      child: _infoCard(
                        assetPath: 'assets/logo/Totaluser.png',
                        number: '120',
                        label: 'Total Users',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _goToUnassignedUsers,
                    child: SizedBox(
                      width: (screenWidth - 48) / 2,
                      child: _infoCard(
                        assetPath: 'assets/logo/Unassigneduser.png',
                        number: '30',
                        label: 'Unassigned users',
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: _goToFeesStatus,
                    child: SizedBox(
                      width: (screenWidth - 48) / 2,
                      child: _infoCard(
                        assetPath: 'assets/logo/Fees.png',
                        number: 'Paid/Unpaid',
                        label: 'Fees Status',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Schedule Class Button (full width)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _goToScheduleClass,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sidebarActiveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    'Schedule Class',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Add User Button (full width)
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    // Add user action here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: sidebarActiveColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    '+ Add User',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
            BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Attendance'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                break;
              case 1:
                _goToChat();
                break;
              case 2:
                _goToAttendance();
                break;
              case 3:
                _goToProfile();
                break;
              case 4:
                _goToSettings();
                break;
            }
          },
          selectedItemColor: appGreen,
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
        ),
      );
    }
  }
}
