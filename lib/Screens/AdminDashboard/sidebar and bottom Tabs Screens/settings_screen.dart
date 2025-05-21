import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/chat_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/attendance_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/profile_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/schedule_class.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final Color sidebarBgColor = const Color(0xffe6f6f1);
  final Color sidebarIconColor = Colors.black87;
  final Color sidebarActiveColor = const Color(0xff02d185);

  final List<Map<String, dynamic>> _sidebarItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.schedule, 'label': 'Schedule Class'},
    {'icon': Icons.chat_bubble, 'label': 'Chat'},
    {'icon': Icons.article, 'label': 'Attendance'},
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  int _selectedSidebarIndex = 5; // Settings index

  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  String selectedLanguage = 'English';

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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
      case 5:
        // Already here (Settings)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width >= 900;

    Widget settingsContent = SingleChildScrollView(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 12), // Reduced space from top
          // Removed extra large top spacing here
          const Text(
            'Preferences',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildCheckboxRow(Icons.notifications, "Notifications", notificationsEnabled,
              (val) {
            setState(() => notificationsEnabled = val!);
          }),
          const Divider(height: 32),
          _buildCheckboxRow(Icons.nightlight_round, "Dark Mode", darkModeEnabled,
              (val) {
            setState(() => darkModeEnabled = val!);
          }),
          const Divider(height: 32),
          Row(
            children: [
              const Icon(Icons.language, color: appGreen),
              const SizedBox(width: 12),
              const Text("Language", style: TextStyle(fontSize: 18)),
              const Spacer(),
              DropdownButton<String>(
                value: selectedLanguage,
                dropdownColor: sidebarBgColor,
                underline: const SizedBox.shrink(),
                items: const [
                  DropdownMenuItem(value: 'English', child: Text('English')),
                  DropdownMenuItem(value: 'Arabic', child: Text('Arabic')),
                ],
                onChanged: (val) {
                  setState(() => selectedLanguage = val!);
                },
              ),
            ],
          ),
          const SizedBox(height: 48),
          const Text(
            'Account Settings',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Change Password action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: appGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Change Password",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // Logout action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red.shade700,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: isWeb
          ? Row(
              children: [
                // Sidebar with rounded corners and shadow
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
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(2, 0),
                      ),
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
                          onTap: () => _navigateTo(idx),
                          child: Row(
                            children: [
                              Icon(item['icon'],
                                  color: isActive ? sidebarActiveColor : sidebarIconColor),
                              const SizedBox(width: 12),
                              Text(
                                item['label'],
                                style: TextStyle(
                                  fontWeight:
                                      isActive ? FontWeight.bold : FontWeight.normal,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Added Settings title here to reduce top space
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: const Text(
                          'Settings',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.black,
                          ),
                        ),
                      ),

                      Expanded(child: settingsContent),
                    ],
                  ),
                ),
              ],
            )
          : Scaffold(
              appBar: AppBar(
                title: const Text('Settings', style: TextStyle(fontWeight: FontWeight.bold)),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                elevation: 0,
              ),
              backgroundColor: Colors.white,
              body: settingsContent,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: 5,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.black,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                type: BottomNavigationBarType.fixed,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
                      break;
                    case 1:
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
                      break;
                    case 2:
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AttendanceScreen()));
                      break;
                    case 3:
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
                      break;
                    case 4:
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ScheduleClass()));
                      break;
                    case 5:
                      // Already on Settings
                      break;
                  }
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.chat_bubble), label: 'Chat'),
                  BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Attendance'),
                  BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
                  BottomNavigationBarItem(icon: Icon(Icons.schedule), label: 'Schedule Class'),
                  BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
                ],
              ),
            ),
    );
  }

  Widget _buildCheckboxRow(
      IconData icon, String label, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Icon(icon, color: appGreen),
        const SizedBox(width: 12),
        Expanded(child: Text(label, style: const TextStyle(fontSize: 18))),
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: appGreen,
          side: BorderSide(color: appGreen),
        ),
      ],
    );
  }
}
