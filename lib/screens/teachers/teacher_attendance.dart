import 'package:al_mehdi_online_school/screens/students/student_notifications.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_chat.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_classes.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_profile.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_settings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../constants/colors.dart';

class TeacherAttendanceScreen extends StatefulWidget {
  const TeacherAttendanceScreen({super.key});

  @override
  State<TeacherAttendanceScreen> createState() => _TeacherAttendanceScreenState();
}

class _TeacherAttendanceScreenState extends State<TeacherAttendanceScreen> {

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
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
                      _SidebarItem(icon: Icons.home, label: 'Home', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherHomeScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Iconsax.teacher, label: 'Classes', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherClassesScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Icons.bar_chart, label: 'Attendance', selected: true, onTap: () {}),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Icons.chat, label: 'Chat', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherChatScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Icons.settings, label: 'Settings', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherSettingsScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Iconsax.user, label: 'Profile', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const TeacherProfileScreen()));
                      }),
                    ],
                  ),
                ),

                // Main Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top bar
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 18),
                        child: Row(
                          children: [
                            const Text('Attendance Report',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Color(0xFF2B3A4A)),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.notifications, color: Colors.black),
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
                      const Divider(height: 1, thickness: 1, color: Color(0xFFE5EAF1)),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Color(0xFFe5faf3),
                                    focusColor: Colors.white,
                                    isExpanded: true,
                                    hint: Text("Student"),
                                    value: selectedValue,
                                    items: [
                                      DropdownMenuItem(value: 'Option 1', child: Text('Student 1')),
                                      DropdownMenuItem(value: 'Option 2', child: Text('Student 2')),
                                      DropdownMenuItem(value: 'Option 3', child: Text('Student 3')),
                                    ],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade400),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    dropdownColor: Color(0xFFe5faf3),
                                    focusColor: Colors.white,
                                    isExpanded: true,
                                    hint: Text("Class"),
                                    value: selectedValue,
                                    items: [
                                      DropdownMenuItem(value: 'Option 1', child: Text('1')),
                                      DropdownMenuItem(value: 'Option 2', child: Text('2')),
                                      DropdownMenuItem(value: 'Option 3', child: Text('3')),
                                    ],
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedValue = newValue;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search...',
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 0,
                                    horizontal: 16,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Student", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                            Text("May 6, 2025 · 9:00 AM", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
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
                                      'Subject: Maths',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Teacher: Laiba',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Date/Time: 01-05-2025',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                AttendanceToggle()
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Card(
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
                                      'Subject: Maths',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Teacher: Laiba',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      'Date/Time: 01-05-2025',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                                AttendanceToggle()
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        } else {
          // return Scaffold(backgroundColor: Colors.pink);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              title: const Text(
                'Attendance',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Color(0xFFe5faf3),
                              focusColor: Colors.white,
                              isExpanded: true,
                              hint: Text("Student"),
                              value: selectedValue,
                              items: [
                                DropdownMenuItem(value: 'Option 1', child: Text('Student 1')),
                                DropdownMenuItem(value: 'Option 2', child: Text('Student 2')),
                                DropdownMenuItem(value: 'Option 3', child: Text('Student 3')),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade400),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Color(0xFFe5faf3),
                              focusColor: Colors.white,
                              isExpanded: true,
                              hint: Text("Class"),
                              value: selectedValue,
                              items: [
                                DropdownMenuItem(value: 'Option 1', child: Text('1')),
                                DropdownMenuItem(value: 'Option 2', child: Text('2')),
                                DropdownMenuItem(value: 'Option 3', child: Text('3')),
                              ],
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedValue = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Student", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text("May 6, 2025 · 9:00 AM", style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Subject: Maths',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Teacher: Laiba',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Date/Time: 01-05-2025',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          AttendanceToggle()
                        ],
                      ),
                    ),
                  )
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
        style: TextStyle(fontWeight: FontWeight.bold, color: selected ? appGreen : Colors.black),
      ),
      onTap: onTap,
    );
  }
}


class FilterChipWidget extends StatelessWidget {
  final String label;
  const FilterChipWidget({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontSize: 14)),
          Icon(Icons.keyboard_arrow_down, size: 18),
        ],
      ),
    );
  }
}

class AttendanceToggle extends StatefulWidget {
  @override
  _AttendanceToggleState createState() => _AttendanceToggleState();
}

class _AttendanceToggleState extends State<AttendanceToggle> {
  bool isPresent = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isPresent = !isPresent;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
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
            SizedBox(width: 8),
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
    );
  }
}