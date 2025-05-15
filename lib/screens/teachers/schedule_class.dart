import 'package:al_mehdi_online_school/screens/teachers/teacher_attendance.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_chat.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_classes.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_profile.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_settings.dart';
import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../students/student_notifications.dart';
import 'package:intl/intl.dart';

class ScheduleClassesScreen extends StatelessWidget {
  const ScheduleClassesScreen({super.key});

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
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Schedule a Class', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              const Text('Let students know when you\'ll be teaching next.'),
                              const SizedBox(height: 24),

                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: Color(0xFFe5faf3),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text("Subject", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                ),
                                                SizedBox(height: 10,),
                                                _DropdownField(label: 'Subject'),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Expanded(
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                                    child: Text("Student", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  _DropdownField(label: 'Student', options: ['Student 1', 'Student 2']),
                                                ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text("Select Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                ),
                                                SizedBox(height: 10,),
                                                _TextField(label: 'Select Date', icon: Icons.calendar_today, isDatePicker: true),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(width: 25),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text("Select Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                ),
                                                SizedBox(height: 10,),
                                                _TextField(label: 'Select Time', icon: Icons.access_time, isTimePicker: true),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.symmetric(horizontal: 10),
                                                  child: Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                                ),
                                                SizedBox(height: 10,),
                                                _TextField(label: 'Description', maxLines: 2,),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 40),
                                      SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: appGreen,
                                            foregroundColor: Colors.white,
                                            padding: const EdgeInsets.symmetric(vertical: 16),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => const TeacherClassesScreen(),
                                              ),
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                                            child: const Text('Schedule Class', style: TextStyle(fontSize: 16)),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
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
          // Mobile layout
          return Scaffold(
              backgroundColor: Color(0xFFe5faf3),
              appBar: AppBar(
                surfaceTintColor: Color(0xFFe5faf3),
                backgroundColor: Color(0xFFe5faf3),
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.pop(context),
                ),
                title: const Text(
                  'Schedule Class',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Let students know when you’ll be teaching next.", style: TextStyle(fontSize: 16, color: Colors.grey),),
                      SizedBox(height: 20,),
                      Card(
                        color: Colors.white,
                        elevation: 2,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("Subject", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              _DropdownField(label: 'Subject'),
                              SizedBox(height: 20),
                              Text("Student", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              _DropdownField(label: 'Student', options: ['Student 1', 'Student 2'],),
                              SizedBox(height: 20),
                              Text("Date", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              _TextField(label: 'Select Date', icon: Icons.calendar_today, isDatePicker: true),
                              SizedBox(height: 20),
                              Text("Select Time", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              _TextField(label: 'Select Time', icon: Icons.access_time, isTimePicker: true),
                              SizedBox(height: 20),
                              Text("Description", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                              SizedBox(height: 10),
                              _TextField(label: 'Description', maxLines: 2,),
                              SizedBox(height: 40),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: appGreen,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const TeacherClassesScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: const Text('Schedule Class', style: TextStyle(fontSize: 16)),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        ),
                      )
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

class _TextField extends StatelessWidget {
  final String label;
  final int maxLines;
  final IconData? icon;
  final bool isDatePicker;
  final bool isTimePicker;
  final TextEditingController? controller;

  const _TextField({
    required this.label,
    this.maxLines = 1,
    this.icon,
    this.isDatePicker = false,
    this.isTimePicker = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _internalController = controller ?? TextEditingController();

    return GestureDetector(
      onTap: (isDatePicker || isTimePicker)
          ? () async {
        FocusScope.of(context).unfocus(); // Hide keyboard

        if (isDatePicker) {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(2100),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: appGreen, // Header and buttons
                    onPrimary: Color(0xFFe5faf3),
                    onSurface: Colors.black,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.green, // Button text color
                    ),
                  ), dialogTheme: DialogThemeData(backgroundColor: Color(0xFFe5faf3)),
                ),
                child: child!,
              );
            },
          );
          if (pickedDate != null) {
            _internalController.text = DateFormat('MM/dd/yyyy').format(pickedDate);
          }
        }

        if (isTimePicker) {
          TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
            builder: (BuildContext context, Widget? child) {
              return Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: const ColorScheme.light(
                    primary: appGreen, // Header and buttons
                    onPrimary: Color(0xFFe5faf3),
                    onSurface: Colors.black,
                  ),
                  textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.green,
                    ),
                  ),
                ),
                child: child!,
              );
            },
          );
          if (pickedTime != null) {
            final now = DateTime.now();
            final time = DateTime(
              now.year,
              now.month,
              now.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            _internalController.text = DateFormat('hh:mm a').format(time);
          }
        }
      }
          : null,
      child: AbsorbPointer(
        absorbing: isDatePicker || isTimePicker,
        child: TextField(
          cursorColor: appGreen,
          controller: _internalController,
          maxLines: maxLines,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            label: Text(label, style: TextStyle(fontSize: 15),),
            floatingLabelStyle: TextStyle(color: appGreen),
            prefixIcon: icon != null ? Icon(icon, color: Colors.grey) : null,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: appGreen),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class _DropdownField extends StatelessWidget {
  final String label;
  final List<String> options;

  const _DropdownField({required this.label, this.options = const ['Math', 'Science', 'English']});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: Color(0xFFe5faf3),
      value: null,
      hint: Text(label, style:  TextStyle(fontSize: 15),),
      items: options.map((e) => DropdownMenuItem(value: e, child: Text(e, style: TextStyle(fontSize: 15),))).toList(),
      onChanged: (val) {},
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: appGreen),
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}