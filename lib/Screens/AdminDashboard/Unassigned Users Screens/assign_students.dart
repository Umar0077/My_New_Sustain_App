import 'package:flutter/material.dart';

class AssignStudents extends StatefulWidget {
  const AssignStudents({super.key});

  @override
  State<AssignStudents> createState() => _AssignStudentsState();
}

class _AssignStudentsState extends State<AssignStudents> {
  final List<String> students = ['Student 1', 'Student 2', 'Student 3', 'Student 4'];
  final Map<String, bool> assignedStatus = {};

  @override
  void initState() {
    super.initState();
    for (var student in students) {
      assignedStatus[student] = false;
    }
  }

  void assignStudent(String student) {
    setState(() {
      assignedStatus[student] = true;
    });
  }

  void assignAll() {
    setState(() {
      for (var student in students) {
        assignedStatus[student] = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth >= 700;

    // Dynamic text size based on screen width
    double baseFontSize = isWide ? 20 : 14;
    double labelFontSize = isWide ? 18 : 14;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Assign Students',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: BackButton(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: isWide ? 80 : 16, vertical: 24),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,  // white background
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1), // subtle shadow
                      spreadRadius: 3,
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  itemCount: students.length,
                  separatorBuilder: (_, __) => Divider(height: 1, thickness: 1, color: Colors.grey[300]),
                  itemBuilder: (context, index) {
                    final student = students[index];
                    final assigned = assignedStatus[student] ?? false;
                    return ListTile(
                      title: Text(
                        student,
                        style: TextStyle(fontSize: labelFontSize),
                      ),
                      trailing: assigned
                          ? Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.check, size: 16, color: Colors.white),
                                  const SizedBox(width: 6),
                                  Text('Assign', style: TextStyle(color: Colors.white, fontSize: labelFontSize)),
                                ],
                              ),
                            )
                          : ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF02D185),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              ),
                              onPressed: () => assignStudent(student),
                              icon: const Icon(Icons.check, size: 16, color: Colors.white),  // icon color set here
                              label: Text('Assign', style: TextStyle(fontSize: labelFontSize, color: Colors.white)),
                            ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: assignAll,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF02D185),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  'Assign All',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: baseFontSize, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
