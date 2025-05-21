import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/attendance_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/chat_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/profile_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleClass extends StatefulWidget {
  const ScheduleClass({super.key});

  @override
  State<ScheduleClass> createState() => _ScheduleClassState();
}

class _ScheduleClassState extends State<ScheduleClass> {
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

  int _selectedSidebarIndex = 1; // Schedule Class is selected

  String? selectedSubject;
  String? selectedStudent;

  void _navigateTo(int index) {
    setState(() {
      _selectedSidebarIndex = index;
    });

    switch (_sidebarItems[index]['label']) {
      case 'Home':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const AdminHomeScreen()),
          (route) => false,
        );
        break;
      case 'Schedule Class':
        // Already here
        break;
      case 'Chat':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ChatScreen()),
          (route) => false,
        );
        break;
      case 'Attendance':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const AttendanceScreen()),
          (route) => false,
        );
        break;
      case 'Profile':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const ProfileScreen()),
          (route) => false,
        );
        break;
      case 'Settings':
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const SettingsScreen()),
          (route) => false,
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth >= 900;

    Widget content = LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 900) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Schedule a Class',
                      style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none),
                      onPressed: () {
                        // Notification action here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text("Let Teachers know when you’ll be arranging the class."),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: const Color(0xFFe5faf3),
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
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Subject",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _DropdownField(
                                    label: 'Subject',
                                    options: const ['Math', 'Science', 'English'],
                                    value: selectedSubject,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedSubject = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 25),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Student",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  _DropdownField(
                                    label: 'Student',
                                    options: const ['Student 1', 'Student 2'],
                                    value: selectedStudent,
                                    onChanged: (val) {
                                      setState(() {
                                        selectedStudent = val;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Expanded(
                              child: _DatePickerField(),
                            ),
                            SizedBox(width: 25),
                            Expanded(
                              child: _TimePickerField(),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const _DescriptionField(),
                        const SizedBox(height: 40),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF02D185),
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 16),
                            ),
                            onPressed: () {
                              // Add schedule class logic here
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.0),
                              child: Text('Schedule Class',
                                  style: TextStyle(fontSize: 16)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          // Mobile layout
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Let Teachers know when you’ll be arranging the class.",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 20),
                  Card(
                    color: Colors.white,
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const Text("Subject",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          _DropdownField(
                            label: 'Subject',
                            options: const ['Math', 'Science', 'English'],
                            value: selectedSubject,
                            onChanged: (val) {
                              setState(() {
                                selectedSubject = val;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text("Student",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          _DropdownField(
                            label: 'Student',
                            options: const ['Student 1', 'Student 2'],
                            value: selectedStudent,
                            onChanged: (val) {
                              setState(() {
                                selectedStudent = val;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          const Text("Date",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const _DatePickerField(),
                          const SizedBox(height: 20),
                          const Text("Select Time",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const _TimePickerField(),
                          const SizedBox(height: 20),
                          const Text("Description",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 10),
                          const _DescriptionField(),
                          const SizedBox(height: 40),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF02D185),
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(vertical: 16),
                              ),
                              onPressed: () {
                                // Add schedule class logic here
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.0),
                                child: Text('Schedule Class',
                                    style: TextStyle(fontSize: 16)),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );

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
            Expanded(child: content),
          ],
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const AdminHomeScreen()),
                (route) => false,
              );
            },
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
        body: content,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: sidebarActiveColor,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          selectedIconTheme: const IconThemeData(size: 24),
          unselectedIconTheme: const IconThemeData(size: 24),
          currentIndex: 0, // Schedule removed from bottom tabs
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const AdminHomeScreen()),
                  (route) => false,
                );
                break;
              case 1:
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const ChatScreen()),
                  (route) => false,
                );
                break;
              case 2:
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const AttendanceScreen()),
                  (route) => false,
                );
                break;
              case 3:
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  (route) => false,
                );
                break;
              case 4:
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                  (route) => false,
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
      );
    }
  }
}

// Dropdown Field Widget
class _DropdownField extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? value;
  final ValueChanged<String?>? onChanged;

  const _DropdownField({
    required this.label,
    this.options = const ['Math', 'Science', 'English'],
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: const Color(0xFFe5faf3),
      value: value,
      hint: Text(label, style: const TextStyle(fontSize: 15)),
      items: options
          .map((e) => DropdownMenuItem(value: e, child: Text(e, style: const TextStyle(fontSize: 15))))
          .toList(),
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF02D185)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

// Date Picker Field Widget
class _DatePickerField extends StatefulWidget {
  const _DatePickerField({super.key});

  @override
  State<_DatePickerField> createState() => _DatePickerFieldState();
}

class _DatePickerFieldState extends State<_DatePickerField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickDate() async {
    FocusScope.of(context).unfocus();

    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF02D185),
              onPrimary: Color(0xFFe5faf3),
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.green),
            ),
            dialogTheme: const DialogTheme(backgroundColor: Color(0xFFe5faf3)),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      _controller.text = DateFormat('MM/dd/yyyy').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickDate,
      child: AbsorbPointer(
        child: TextField(
          controller: _controller,
          cursorColor: const Color(0xFF02D185),
          decoration: InputDecoration(
            label: const Text('Select Date', style: TextStyle(fontSize: 15)),
            floatingLabelStyle: const TextStyle(color: Color(0xFF02D185)),
            prefixIcon: const Icon(Icons.calendar_today, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF02D185)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          maxLines: 1,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

// Time Picker Field Widget
class _TimePickerField extends StatefulWidget {
  const _TimePickerField({super.key});

  @override
  State<_TimePickerField> createState() => _TimePickerFieldState();
}

class _TimePickerFieldState extends State<_TimePickerField> {
  final TextEditingController _controller = TextEditingController();

  Future<void> _pickTime() async {
    FocusScope.of(context).unfocus();

    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF02D185),
              onPrimary: Color(0xFFe5faf3),
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(foregroundColor: Colors.green),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final time =
          DateTime(now.year, now.month, now.day, pickedTime.hour, pickedTime.minute);
      _controller.text = DateFormat('hh:mm a').format(time);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickTime,
      child: AbsorbPointer(
        child: TextField(
          controller: _controller,
          cursorColor: const Color(0xFF02D185),
          decoration: InputDecoration(
            label: const Text('Select Time', style: TextStyle(fontSize: 15)),
            floatingLabelStyle: const TextStyle(color: Color(0xFF02D185)),
            prefixIcon: const Icon(Icons.access_time, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFF02D185)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          maxLines: 1,
          style: const TextStyle(fontSize: 15),
        ),
      ),
    );
  }
}

// Description TextField Widget
class _DescriptionField extends StatelessWidget {
  const _DescriptionField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 4,
      decoration: InputDecoration(
        label: const Text('Description', style: TextStyle(fontSize: 15)),
        floatingLabelStyle: const TextStyle(color: Color(0xFF02D185)),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFF02D185)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      style: const TextStyle(fontSize: 15),
    );
  }
}
