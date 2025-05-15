import 'package:al_mehdi_online_school/screens/students/student_notifications.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../constants/colors.dart';
import 'student_chat.dart';
import 'student_classes.dart';
import 'student_home_screen.dart';
import 'student_profile.dart';
import 'student_settings.dart';

class StudentAttendanceScreen extends StatefulWidget {
  const StudentAttendanceScreen({super.key});

  @override
  State<StudentAttendanceScreen> createState() => _StudentAttendanceScreenState();
}

class _StudentAttendanceScreenState extends State<StudentAttendanceScreen> {
  int? selectedSubjectIndex;
  final List<String> subject = const ['English', 'Urdu', 'Maths'];

  // Dummy data for demo
  final List<Map<String, dynamic>> subjects = [
    {
      'name': 'English',
      'total': 10,
      'attended': 10,
    },
    {
      'name': 'Urdu',
      'total': 12,
      'attended': 9,
    },
    {
      'name': 'Maths',
      'total': 8,
      'attended': 6,
    },
  ];

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
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentHomeScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Iconsax.teacher, label: 'Classes', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentClassesScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Icons.bar_chart, label: 'Attendance', selected: true, onTap: () {}),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Icons.chat, label: 'Chat', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentChatScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Icons.settings, label: 'Settings', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentSettingsScreen()));
                      }),
                      SizedBox(height: 3),
                      _SidebarItem(icon: Iconsax.user, label: 'Profile', selected: false, onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentProfileScreen()));
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

                      // Content Row
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          children: [
                            // Subject List
                            Expanded(
                              child: SizedBox(
                                height: 500,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Subjects", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 20),
                                    ...List.generate(subjects.length, (index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(bottom: 10.0, left: 10, right: 30),
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSubjectIndex = index;
                                            });
                                          },
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Card(
                                              color: Colors.white,
                                              elevation: 2,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                                side: BorderSide(
                                                  color: selectedSubjectIndex == index ? appGreen : Colors.transparent,
                                                  width: 2,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(16.0),
                                                child: Text(subjects[index]['name']),
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                            ),
                            // Attendance Report
                            Expanded(
                              child: selectedSubjectIndex == null
                                  ? const Center(
                                child: Text(
                                  'Select a subject to see attendance',
                                  style: TextStyle(fontSize: 16),
                                ),
                              )
                                  : AttendanceChart(subject: subjects[selectedSubjectIndex!]),
                            ),
                          ],
                        ),
                      )
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
            body: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: subject.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: ListTile(
                    title: Text(subject[index], style: TextStyle(fontWeight: FontWeight.w400),),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 15,),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StudentAttendanceDetailScreen(
                            subject: subject[index],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}

class AttendanceChart extends StatelessWidget {
  final Map<String, dynamic> subject;

  const AttendanceChart({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    int total = subject['total'];
    int attended = subject['attended'];
    int missed = total - attended;
    double percentage = (attended / total) * 100;

    final dataMap = {
      "Attended": attended.toDouble(),
      "Missed": missed.toDouble(),
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PieChart(
          dataMap: dataMap,
          chartRadius: 150,
          animationDuration: const Duration(milliseconds: 800),
          chartType: ChartType.ring,
          ringStrokeWidth: 20,
          baseChartColor: Colors.grey[200]!,
          colorList: [appGreen, Colors.grey.shade200],
          centerText: "${percentage.toStringAsFixed(0)}%",
          centerTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black, // or any color you want
            backgroundColor: Colors.white,
          ),
          legendOptions: const LegendOptions(showLegends: false),
          chartValuesOptions: const ChartValuesOptions(showChartValues: false),
        ),
        const SizedBox(height: 10),
        Text(
          percentage == 100 ? "Excellent!" : percentage >= 75 ? "Good!" : "Needs Improvement",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 20),
        InfoTile(label: "Total Classes", value: "$total"),
        InfoTile(label: "Classes Attended", value: "$attended"),
        InfoTile(label: "Classes Missed", value: "$missed"),
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(label, style: const TextStyle(fontSize: 14)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Text(value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
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

class StudentAttendanceDetailScreen extends StatelessWidget {
  final String subject;

  const StudentAttendanceDetailScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    final int total = 10;
    final int attended = 10;
    final int missed = total - attended;
    final double percentage = (attended / total) * 100;

    final dataMap = {
      "Attended": attended.toDouble(),
      "Missed": missed.toDouble(),
    };

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          subject,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PieChart(
              dataMap: dataMap,
              chartRadius: MediaQuery.of(context).size.width / 3,
              animationDuration: const Duration(milliseconds: 800),
              chartType: ChartType.ring,
              ringStrokeWidth: 20,
              baseChartColor: Colors.grey[200]!,
              colorList: [appGreen, Colors.grey],
              centerText: "${percentage.toStringAsFixed(0)}%",
              centerTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                backgroundColor: Colors.transparent,
              ),
              legendOptions: const LegendOptions(showLegends: false),
              chartValuesOptions: const ChartValuesOptions(showChartValues: false),
            ),
            const SizedBox(height: 20),
            const Text(
              "Excellent!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            AttendanceStatCard(label: "Total Classes", value: total),
            AttendanceStatCard(label: "Classes Attended", value: attended),
            AttendanceStatCard(label: "Classes Missed", value: missed),
          ],
        ),
      ),
    );
  }
}

class AttendanceStatCard extends StatelessWidget {
  final String label;
  final int value;

  const AttendanceStatCard({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(label),
        trailing: Text(value.toString(), style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
      ),
    );
  }
}
