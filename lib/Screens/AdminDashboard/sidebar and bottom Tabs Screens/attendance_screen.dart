import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/chat_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/profile_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/schedule_class.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  String? selectedStudent;
  String? selectedClass;

  final Color sidebarBgColor = const Color(0xffe5faf3);
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

  int _selectedSidebarIndex = 3; // Attendance tab index

  void _navigateTo(int index) {
    setState(() => _selectedSidebarIndex = index);

    switch (index) {
      case 0:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
        break;
      case 1:
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => const ScheduleClass()));
        break;
      case 2:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ChatScreen()));
        break;
      case 3:
        // Current screen: Attendance
        break;
      case 4:
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
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

    Widget attendanceUI = SingleChildScrollView(
      padding: isWeb ? const EdgeInsets.all(20) : const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isWeb) const SizedBox(height: 12),
          if (!isWeb)
            const Text(
              'Attendance Report',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          if (!isWeb) const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: sidebarBgColor,
                      isExpanded: true,
                      hint: const Text("Student"),
                      value: selectedStudent,
                      items: const [
                        DropdownMenuItem(value: 'Student 1', child: Text('Student 1')),
                        DropdownMenuItem(value: 'Student 2', child: Text('Student 2')),
                        DropdownMenuItem(value: 'Student 3', child: Text('Student 3')),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedStudent = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: sidebarBgColor,
                      isExpanded: true,
                      hint: const Text("Class"),
                      value: selectedClass,
                      items: const [
                        DropdownMenuItem(value: '1', child: Text('1')),
                        DropdownMenuItem(value: '2', child: Text('2')),
                        DropdownMenuItem(value: '3', child: Text('3')),
                      ],
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedClass = newValue;
                        });
                      },
                    ),
                  ),
                ),
              ),
              if (!isWeb) const SizedBox(width: 20),
              if (!isWeb)
                Expanded(
                  flex: 2,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (isWeb) const SizedBox(height: 24),
          if (isWeb)
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Student",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                Text("May 6, 2025 · 9:00 AM", style: TextStyle(fontSize: 14, color: Colors.grey)),
              ],
            ),
          ),
          const SizedBox(height: 12),

          _AttendanceCard(
            subject: "Maths",
            teacher: "Laiba",
            dateTime: "01-05-2025",
          ),
          const SizedBox(height: 10),
          _AttendanceCard(
            subject: "Maths",
            teacher: "Laiba",
            dateTime: "01-05-2025",
          ),
          const SizedBox(height: 30),
        ],
      ),
    );

    if (isWeb) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
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
                      onTap: () => _navigateTo(idx),
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
            ),

            // Main Content with header
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Added Attendance title here
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                    child: const Text(
                      'Attendance',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                  ),

                  Expanded(child: attendanceUI),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text(
            'Attendance',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: attendanceUI,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2, // Attendance tab index in bottom navigation
          backgroundColor: Colors.white,
          selectedItemColor: appGreen, // Green color for active tab
          unselectedItemColor: Colors.black,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
                break;
              case 1:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ChatScreen()));
                break;
              case 2:
                // Already on Attendance
                break;
              case 3:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()));
                break;
              case 4:
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => const SettingsScreen()));
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
      );
    }
  }
}

class _AttendanceCard extends StatefulWidget {
  final String subject;
  final String teacher;
  final String dateTime;

  const _AttendanceCard({
    required this.subject,
    required this.teacher,
    required this.dateTime,
  });

  @override
  State<_AttendanceCard> createState() => _AttendanceCardState();
}

class _AttendanceCardState extends State<_AttendanceCard> {
  bool isPresent = true;

  void togglePresence() {
    setState(() {
      isPresent = !isPresent;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Subject: ${widget.subject}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Teacher: ${widget.teacher}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Date/Time: ${widget.dateTime}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: togglePresence,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isPresent ? Colors.green : Colors.red,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 8,
                      backgroundColor: isPresent ? Colors.green : Colors.red,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      isPresent ? 'Present' : 'Absent',
                      style: TextStyle(
                        color: isPresent ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
