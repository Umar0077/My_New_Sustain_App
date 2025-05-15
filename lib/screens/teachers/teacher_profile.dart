import 'package:al_mehdi_online_school/screens/students/student_notifications.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_attendance.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_chat.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_classes.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_settings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../constants/colors.dart';

class TeacherProfileScreen extends StatelessWidget {
  const TeacherProfileScreen({super.key});

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
                        selected: false,
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
                        selected: true,
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
                              'Profile',
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
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height - 150,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 70,
                                          backgroundImage: NetworkImage(
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        TextButton(
                                            onPressed: () {},
                                            child: Text("Upload", style: TextStyle(color: appGreen, fontSize: 15),)
                                        ),
                                        SizedBox(height: 20,),
                                        Text("Mohammad Ahmar", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                                        SizedBox(height: 10,),
                                        Text("Teacher", style: TextStyle(fontSize: 15,),),
                                        SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Icon(Iconsax.verify, color: appGreen,),
                                            SizedBox(width: 5,),
                                            Text("Assigned", style: TextStyle(color: appGreen),),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20,),
                            Expanded(
                              child: SizedBox(
                                height: MediaQuery.of(context).size.height - 150,
                                child: Card(
                                  color: Colors.white,
                                  elevation: 2,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 15,),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text(
                                                'Edit Profile',
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 20,),
                                              const Text(
                                                'Full Name',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: appGrey,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(color: appGrey),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Name',
                                                  style: TextStyle(fontSize: 14, color: Colors.black),
                                                ),
                                              ),
                                              const SizedBox(height: 14),
                                              const Text(
                                                'Email',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: appGrey,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(color: appGrey),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'Email',
                                                  style: TextStyle(fontSize: 14, color: Colors.black),
                                                ),
                                              ),
                                              const SizedBox(height: 14),
                                              const Text(
                                                'Phone',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: appGrey,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(color: appGrey),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  '+1234567890',
                                                  style: TextStyle(fontSize: 14, color: Colors.black),
                                                ),
                                              ),
                                              const SizedBox(height: 14),
                                              const Text(
                                                'Class',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: appGrey,
                                                ),
                                              ),
                                              const SizedBox(height: 6),
                                              Container(
                                                width: double.infinity,
                                                padding: const EdgeInsets.symmetric(
                                                  horizontal: 14,
                                                  vertical: 14,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(color: appGrey),
                                                  borderRadius: BorderRadius.circular(10),
                                                ),
                                                child: const Text(
                                                  'fourth',
                                                  style: TextStyle(fontSize: 14, color: Colors.black),
                                                ),
                                              ),
                                              const SizedBox(height: 14),
                                              LayoutBuilder(
                                                  builder: (context, constraints) {
                                                    if (constraints.maxWidth > 300) {
                                                      return Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          TextButton(
                                                              onPressed: (){},
                                                              child: Text("Change Password", style: TextStyle(color: appGreen),)
                                                          ),
                                                          ElevatedButton(
                                                              onPressed: () {},
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: appGreen,
                                                                foregroundColor: Colors.white,
                                                              ),
                                                              child: Text("Edit Changes", style: TextStyle(fontSize: 16),)
                                                          )
                                                        ],
                                                      );
                                                    } else {
                                                      return Column(
                                                        children: [
                                                          Center(
                                                            child: TextButton(
                                                                onPressed: (){},
                                                                child: Text("Change Password", style: TextStyle(color: appGreen),)
                                                            ),
                                                          ),
                                                          SizedBox(height: 10,),
                                                          Center(
                                                            child: ElevatedButton(
                                                                onPressed: () {},
                                                                style: ElevatedButton.styleFrom(
                                                                  backgroundColor: appGreen,
                                                                  foregroundColor: Colors.white,
                                                                ),
                                                                child: Text("Save Changes", style: TextStyle(fontSize: 16),)
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    }
                                                  }
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
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
          // Mobile Layout
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text(
                'Profile',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              foregroundColor: Colors.black,
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 12),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 54,
                        backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                        ),
                      ),
                      Positioned(
                        bottom: 4,
                        right: 4,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.camera_alt, size: 22, color: appGrey),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Mohammad Ahmar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Full Name',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: appGrey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Name',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: appGrey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'Email',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Phone',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: appGrey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                '+1234567890',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 14),
                            const Text(
                              'Class',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: appGrey,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: appGrey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Text(
                                'fourth',
                                style: TextStyle(fontSize: 16, color: Colors.black),
                              ),
                            ),
                            const SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                backgroundColor: appGreen,
                                foregroundColor: Colors.white,
                                side: BorderSide(
                                  color: appGreen,
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Save Changes", style: TextStyle(fontSize: 18),),
                            ),
                          ),
                        ),
                        SizedBox(width: 16), // Space between buttons
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                foregroundColor: appGreen,
                                side: BorderSide(
                                  color: appGreen,
                                )
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Change Password", style: TextStyle(fontSize: 18)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
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
              currentIndex: 4,
              onTap: (index) {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherHomeScreen(),
                    ),
                  );
                }
                if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TeacherClassesScreen(),
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
                      builder: (context) => const TeacherSettingsScreen(),
                    ),
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