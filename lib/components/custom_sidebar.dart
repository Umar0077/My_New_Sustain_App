import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/chat_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/attendance_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/profile_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/schedule_class.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/settings_screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class CustomSidebar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomSidebar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  static final List<Map<String, dynamic>> _items = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Iconsax.teacher, 'label': 'Classes'},
    {'icon': Icons.article, 'label': 'Attendance'},
    {'icon': Icons.chat_bubble, 'label': 'Chat'},
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  void _navigate(BuildContext context, int index) {
    switch (_items[index]['label']) {
      case 'Home':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
        break;
      case 'Classes':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ScheduleClass()));
        break;
      case 'Attendance':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const AttendanceScreen()));
        break;
      case 'Chat':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ChatScreen()));
        break;
      case 'Profile':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
      case 'Settings':
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    const sidebarBgColor = Color(0xffe5faf3);
    const sidebarIconColor = Colors.black87;
    const sidebarActiveColor = Color(0xff02d185);

    return Container(
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
        children: _items.asMap().entries.map((entry) {
          int idx = entry.key;
          var item = entry.value;
          bool isActive = idx == selectedIndex;

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: InkWell(
              onTap: () {
                onItemSelected(idx);
                _navigate(context, idx);
              },
              child: Row(
                children: [
                  Icon(item['icon'], color: isActive ? sidebarActiveColor : sidebarIconColor),
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
    );
  }
}
