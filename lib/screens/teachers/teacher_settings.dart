import 'package:al_mehdi_online_school/screens/students/student_notifications.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_attendance.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_chat.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_classes.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_profile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../constants/colors.dart';

class TeacherSettingsScreen extends StatefulWidget {
  const TeacherSettingsScreen({super.key});

  @override
  State<TeacherSettingsScreen> createState() => _TeacherSettingsScreenState();
}

class _TeacherSettingsScreenState extends State<TeacherSettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;
  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          // Desktop Layout
          return Scaffold(
            backgroundColor: Colors.white,
            body: Row(
              children: [
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
                        selected: false,
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
                        selected: true,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TeacherSettingsScreen(),
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
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 18,
                        ),
                        child: Row(
                          children: [
                            const Text(
                              'Settings',
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
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildPreferenceCard(),
                                ],
                              ),
                            ),
                            const SizedBox(width: 24),
                            // Account Settings
                            Expanded(
                              flex: 1,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildAccountCard(),
                                ],
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
          // Mobile Layout
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text(
                'Settings',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              elevation: 0,
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Customize your experience',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Preferences',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              const Icon(Icons.notifications, color: appGreen),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Notifications',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Checkbox(
                                value: notificationsEnabled,
                                onChanged: (val) {
                                  setState(() {
                                    notificationsEnabled = val!;
                                  });
                                },
                                activeColor: appGreen,
                                side: BorderSide(
                                  color: appGreen,
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Icon(Icons.nightlight_round, color: appGreen),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Dark Mode',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              Checkbox(
                                value: darkModeEnabled,
                                onChanged: (val) {
                                  setState(() {
                                    darkModeEnabled = val!;
                                  });
                                },
                                side: BorderSide(
                                  color: appGreen,
                                ),
                                activeColor: appGreen,
                              ),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Icon(Icons.language, color: appGreen),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Language',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              DropdownButton<String>(
                                dropdownColor: Color(0xFFe5faf3),
                                icon: const Icon(Icons.arrow_drop_down, color: appGreen),
                                underline: SizedBox.shrink(),
                                value: selectedLanguage,
                                items: const [
                                  DropdownMenuItem(
                                    value: 'English',
                                    child: Text('English', style: TextStyle(fontWeight: FontWeight.w400),),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Arabic',
                                    child: Text('Arabic', style: TextStyle(fontWeight: FontWeight.w400)),
                                  ),
                                ],
                                onChanged: (val) {
                                  setState(() {
                                    selectedLanguage = val!;
                                  });
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Account Settings',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {},
                            child: Row(
                              children: const [
                                Icon(Icons.edit, color: appGreen),
                                SizedBox(width: 10),
                                Text(
                                  'Change Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: appRed,
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onPressed: () {},
                              child: const Text(
                                'Logout',
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: RichText(
                        text: const TextSpan(
                          text: 'Need help? ',
                          style: TextStyle(color: Colors.grey, fontSize: 13),
                          children: [
                            TextSpan(
                              text: 'Tap here for support ',
                              style: TextStyle(
                                color: appGreen,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.support_agent,
                                size: 16,
                                color: appGrey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
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
              currentIndex: 3,
              onTap: (index) {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherHomeScreen()),
                  );
                }
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherClassesScreen()),
                  );
                }
                if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherChatScreen()),
                  );
                }
                if (index == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeacherProfileScreen()),
                  );
                }
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.teacher),
                  label: 'Classes',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Setting'),
                BottomNavigationBarItem(icon: Icon(Iconsax.user), label: 'Profile'),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildPreferenceCard() {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Preferences', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 20,),
            _buildCheckboxRow(Icons.notifications, "Notifications",notificationsEnabled, (val) {
              setState(() => notificationsEnabled = val!);
            }),
            const Divider(),
            _buildCheckboxRow(Icons.nightlight_round, "Dark Mode", darkModeEnabled, (val) {
              setState(() => darkModeEnabled = val!);
            }),
            const Divider(),
            Row(
              children: [
                const Icon(Icons.language, color: appGreen),
                const SizedBox(width: 10),
                const Expanded(child: Text("Language", style: TextStyle(fontSize: 16))),
                DropdownButton<String>(
                  focusColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down, color: appGreen),
                  underline: SizedBox.shrink(),
                  dropdownColor: Color(0xFFe5faf3),
                  value: selectedLanguage,
                  items: const [
                    DropdownMenuItem(value: 'English', child: Text('English', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)),
                    DropdownMenuItem(value: 'Arabic', child: Text('Arabic', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400))),
                  ],
                  onChanged: (val) {
                    setState(() => selectedLanguage = val!);
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountCard() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Account Settings', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appGreen,
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Change Password", style: TextStyle(fontSize: 14),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: appRed,
                        foregroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Logout", style: TextStyle(fontSize: 14,),textAlign: TextAlign.center,),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  TextButton(onPressed: (){}, child: Text("Delete Account", style: TextStyle(color: appRed, fontSize: 14)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckboxRow(IconData icon, String title, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Icon(icon, color: appGreen),
        const SizedBox(width: 10),
        Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: appGreen,
          side: BorderSide(
            color: appGreen,
          ),
        ),
      ],
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
