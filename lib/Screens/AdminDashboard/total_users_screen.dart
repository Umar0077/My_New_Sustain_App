import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';

class TotalUsersScreen extends StatefulWidget {
  const TotalUsersScreen({super.key});

  @override
  State<TotalUsersScreen> createState() => _TotalUsersScreenState();
}

class _TotalUsersScreenState extends State<TotalUsersScreen> {
  String selectedRole = 'All';
  String selectedStatus = 'All';

  List<Map<String, dynamic>> users = [
    {
      'name': 'Umer Ahmed',
      'role': 'Student',
      'enabled': true,
      'avatarUrl': 'https://i.pravatar.cc/100?img=11'
    },
    {
      'name': 'Laiba Ahmar',
      'role': 'Teacher',
      'enabled': true,
      'avatarUrl': 'https://i.pravatar.cc/100?img=12'
    },
    {
      'name': 'Umer Ahmed',
      'role': 'Student',
      'enabled': false,
      'avatarUrl': 'https://i.pravatar.cc/100?img=13'
    },
    {
      'name': 'Laiba Ahmar',
      'role': 'Teacher',
      'enabled': false,
      'avatarUrl': 'https://i.pravatar.cc/100?img=14'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 600;

    final double padding = isWeb ? 32 : 16;
    final double fontSize = isWeb ? 18 : 14;
    final double avatarRadius = isWeb ? 28 : 22;
    final double cardSpacing = isWeb ? 16 : 10;
    final double dropdownWidth = isWeb ? 180 : 140;

    final filteredUsers = users.where((user) {
      final roleMatch = selectedRole == 'All' || user['role'] == selectedRole;
      final statusMatch = selectedStatus == 'All' ||
          (selectedStatus == 'Enabled' && user['enabled'] == true) ||
          (selectedStatus == 'Disabled' && user['enabled'] == false);
      return roleMatch && statusMatch;
    }).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const AdminHomeScreen()),
            );
          },
        ),
        title: const Text(
          'Total User',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Registered Users: ${filteredUsers.length}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
            ),
            const SizedBox(height: 16),

            // Dropdown Filters
            Row(
              mainAxisAlignment:
                  isWeb ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: dropdownWidth,
                  child: DropdownButton<String>(
                    value: selectedRole,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() => selectedRole = value ?? 'All');
                    },
                    items: ['All', 'Student', 'Teacher']
                        .map((role) => DropdownMenuItem(
                              value: role,
                              child: Text(role),
                            ))
                        .toList(),
                    style: TextStyle(fontSize: fontSize, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: dropdownWidth,
                  child: DropdownButton<String>(
                    value: selectedStatus,
                    isExpanded: true,
                    onChanged: (value) {
                      setState(() => selectedStatus = value ?? 'All');
                    },
                    items: ['All', 'Enabled', 'Disabled']
                        .map((status) => DropdownMenuItem(
                              value: status,
                              child: Text(status),
                            ))
                        .toList(),
                    style: TextStyle(fontSize: fontSize, color: Colors.black),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // User List
            Expanded(
              child: ListView.separated(
                itemCount: filteredUsers.length,
                separatorBuilder: (_, __) => SizedBox(height: cardSpacing),
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return Container(
                    padding: EdgeInsets.all(isWeb ? 20 : 14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5FFF6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: avatarRadius,
                          backgroundImage:
                              NetworkImage(user['avatarUrl'] ?? ''),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style:
                                      TextStyle(color: Colors.black, fontSize: fontSize),
                                  children: [
                                    const TextSpan(
                                        text: 'Name: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: user['name'] ?? ''),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 4),
                              RichText(
                                text: TextSpan(
                                  style:
                                      TextStyle(color: Colors.black, fontSize: fontSize),
                                  children: [
                                    const TextSpan(
                                        text: 'Role: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(text: user['role'] ?? ''),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: user['enabled'] ?? false,
                          onChanged: (value) {
                            setState(() {
                              user['enabled'] = value;
                            });
                          },
                          activeColor: Colors.green,
                          inactiveThumbColor: Colors.red,
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
