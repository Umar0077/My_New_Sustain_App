import 'package:al_mehdi_online_school/screens/teachers/schedule_class.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_attendance.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_chat.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_profile.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_settings.dart';
import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../students/student_notifications.dart';

class TeacherClassesScreen extends StatefulWidget {
  const TeacherClassesScreen({super.key});

  @override
  State<TeacherClassesScreen> createState() => _StudentClassesScreenState();
}

class _StudentClassesScreenState extends State<TeacherClassesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          // Web/tablet layout
          return Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
                // Sidebar
                Container(
                  width: 240,
                  decoration: const BoxDecoration(
                    color: Color(0xFFe5faf3),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 32),
                      _SidebarItem(
                        icon: Icons.home,
                        label: 'Home',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherHomeScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 3),
                      _SidebarItem(
                        icon: Iconsax.teacher,
                        label: 'Classes',
                        selected: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherClassesScreen()
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 3),
                      _SidebarItem(
                        icon: Icons.bar_chart,
                        label: 'Attendance',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherAttendanceScreen()
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 3),
                      _SidebarItem(
                        icon: Icons.chat,
                        label: 'Chat',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeacherChatScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 3),
                      _SidebarItem(
                        icon: Icons.settings,
                        label: 'Settings',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherSettingsScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 3),
                      _SidebarItem(
                        icon: Iconsax.user,
                        label: 'Profile',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherProfileScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                // Main content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top bar
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 18,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Classes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Color(0xFF2B3A4A),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.notifications,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => StudentNotificationScreen()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFE5EAF1),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            // Tabs
                            Container(
                              width: 250,
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    color: Color(0xFFE5EAF1),
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 32),
                                  _WebTab(
                                    label: 'Upcoming',
                                    selected: _tabController.index == 0,
                                    onTap:
                                        () => setState(
                                          () => _tabController.index = 0,
                                        ),
                                  ),
                                  _WebTab(
                                    label: 'Completed',
                                    selected: _tabController.index == 1,
                                    onTap:
                                        () => setState(
                                          () => _tabController.index = 1,
                                        ),
                                  ),
                                  _WebTab(
                                    label: 'Missed',
                                    selected: _tabController.index == 2,
                                    onTap:
                                        () => setState(
                                          () => _tabController.index = 2,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            // Tab content
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32,
                                  vertical: 24,
                                ),
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: TabBarView(
                                        controller: _tabController,
                                        children: const [
                                          _ClassesList(type: 'upcoming'),
                                          _ClassesList(type: 'completed'),
                                          _ClassesList(type: 'missed'),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 20),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: appGreen,
                                          foregroundColor: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => const ScheduleClassesScreen(),
                                            ),
                                          );
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: const Text('Schedule a Class', style: TextStyle(fontSize: 18),),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // Mobile layout
          return DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text(
                  'Classes',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(48),
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black,
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 3, color: appGreen),
                        insets: EdgeInsets.symmetric(horizontal: 16),
                      ),
                      tabs: const [
                        Tab(text: 'Upcoming'),
                        Tab(text: 'Completed'),
                        Tab(text: 'Missed'),
                      ],
                    ),
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: TabBarView(
                        children: [
                          _ClassesList(type: 'upcoming'),
                          _ClassesList(type: 'completed'),
                          _ClassesList(type: 'missed'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: appGreen,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ScheduleClassesScreen(),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: const Text('Schedule a Class', style: TextStyle(fontSize: 18),),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              bottomNavigationBar: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: appGreen,
                unselectedItemColor: Colors.black,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                selectedLabelStyle: const TextStyle(fontSize: 12),
                unselectedLabelStyle: const TextStyle(fontSize: 12),
                selectedIconTheme: const IconThemeData(size: 24),
                unselectedIconTheme: const IconThemeData(size: 24),
                currentIndex: 1,
                onTap: (index) {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TeacherHomeScreen(),
                      ),
                    );
                  }
                  if (index == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TeacherChatScreen(),
                      ),
                    );
                  }
                  if (index == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherSettingsScreen(),
                      ),
                    );
                  }
                  if (index == 4) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TeacherProfileScreen(),
                      ),
                    );
                  }
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.teacher),
                    label: 'Classes',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'Chat',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Setting',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Iconsax.user),
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback? onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.selected,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: selected ? appGreen : Colors.black),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: selected ? appGreen : Colors.black,
        ),
      ),
      onTap: onTap,
    );
  }
}

class _WebTab extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _WebTab({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                fontSize: selected ? 18 : 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 3,
              width: selected ? 40 : 0,
              decoration: BoxDecoration(
                color: selected ? appGreen : Colors.transparent,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClassesList extends StatelessWidget {
  final String type;
  const _ClassesList({required this.type});

  @override
  Widget build(BuildContext context) {
    // Example data for demonstration
    final upcomingClasses = [
      {
        'subject': 'Maths',
        'teacher': 'Miss Mahreen',
        'datetime': '01-05-2025 / 10:00 AM',
      },
      {
        'subject': 'Maths',
        'teacher': 'Miss Mahreen',
        'datetime': '01-05-2025 / 10:00 AM',
      },
      {
        'subject': 'Maths',
        'teacher': 'Miss Mahreen',
        'datetime': '01-05-2025 / 10:00 AM',
      },
    ];
    final completedClasses = [
      {
        'subject': 'Maths',
        'teacher': 'Miss Mahreen',
        'datetime': '01-05-2025 / 10:00 AM',
      },
      {
        'subject': 'Maths',
        'teacher': 'Miss Mahreen',
        'datetime': '01-05-2025 / 10:00 AM',
      },
    ];
    // For demonstration, show empty for missed
    final isMissed = type == 'missed';
    final isCompleted = type == 'completed';
    final showList = !isMissed;
    final classes = isCompleted ? completedClasses : upcomingClasses;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      child:
          showList
              ? Column(
                children: List.generate(classes.length, (index) {
                  final c = classes[index];
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFe5faf3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Subject: ${c['subject']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Teacher: ${c['teacher']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Date/Time: ${c['datetime']}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              )
              : Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 48.0),
                  child: Text(
                    'No missed classes',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
    );
  }
}
