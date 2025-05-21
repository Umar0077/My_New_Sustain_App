import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart'; // Import this

class FeesStatusScreen extends StatefulWidget {
  const FeesStatusScreen({super.key});

  @override
  State<FeesStatusScreen> createState() => _FeesStatusScreenState();
}

class _FeesStatusScreenState extends State<FeesStatusScreen> {
  String selectedRole = 'All';
  String selectedStatus = 'All';
  TextEditingController searchController = TextEditingController();

  final List<Map<String, String>> users = [
    {
      'name': 'Ahmed Ali',
      'role': 'Teacher',
      'feeStatus': 'Paid',
    },
    {
      'name': 'Sara Khan',
      'role': 'Student',
      'feeStatus': 'Unpaid',
    },
    {
      'name': 'Bilal Shah',
      'role': 'Teacher',
      'feeStatus': 'Paid',
    },
    {
      'name': 'Ayesha Siddiqi',
      'role': 'Student',
      'feeStatus': 'Unpaid',
    },
    {
      'name': 'Farhan Mehmood',
      'role': 'Teacher',
      'feeStatus': 'Paid',
    },
  ];

  List<Map<String, String>> get filteredUsers {
    return users.where((user) {
      final matchesRole = selectedRole == 'All' || user['role'] == selectedRole;
      final matchesStatus = selectedStatus == 'All' || user['feeStatus'] == selectedStatus;
      final matchesSearch = searchController.text.isEmpty ||
          user['name']!.toLowerCase().contains(searchController.text.toLowerCase()) ||
          user['name']!.toLowerCase().contains(searchController.text.toLowerCase());
      return matchesRole && matchesStatus && matchesSearch;
    }).toList();
  }

  Color getRoleColor(String role) {
    if (role == 'Teacher') return Colors.blue;
    if (role == 'Student') return Colors.orange;
    return Colors.grey;
  }

  Color getFeeStatusColor(String status) {
    if (status == 'Paid') return Colors.green;
    if (status == 'Unpaid') return Colors.red;
    return Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWeb = screenWidth > 600;

    return Scaffold(
      backgroundColor: Colors.grey[200],
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
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Fees Status',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isWeb ? screenWidth * 0.1 : 16,
          vertical: 24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Filters Row
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                DropdownButton<String>(
                  value: selectedRole,
                  items: ['All', 'Teacher', 'Student']
                      .map((role) => DropdownMenuItem(
                            value: role,
                            child: Text(role),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selectedRole = val;
                      });
                    }
                  },
                  underline: Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                ),
                DropdownButton<String>(
                  value: selectedStatus,
                  items: ['All', 'Paid', 'Unpaid']
                      .map((status) => DropdownMenuItem(
                            value: status,
                            child: Text(status),
                          ))
                      .toList(),
                  onChanged: (val) {
                    if (val != null) {
                      setState(() {
                        selectedStatus = val;
                      });
                    }
                  },
                  underline: Container(
                    height: 1,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(
                  width: isWeb ? 250 : 200,
                  child: TextField(
                    controller: searchController,
                    onChanged: (val) => setState(() {}),
                    decoration: InputDecoration(
                      hintText: 'Search by name or email',
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Table Header
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              color: Colors.grey[300],
              child: Row(
                children: [
                  Expanded(flex: 4, child: Text('User Name', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text('Role', style: TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text('Fee Status', style: TextStyle(fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            const SizedBox(height: 4),

            // Users List
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 8)],
                ),
                child: ListView.separated(
                  itemCount: filteredUsers.length,
                  separatorBuilder: (_, __) => Divider(height: 1, color: Colors.grey[300]),
                  itemBuilder: (context, index) {
                    final user = filteredUsers[index];
                    return Container(
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                      child: Row(
                        children: [
                          Expanded(flex: 4, child: Text(user['name'] ?? '')),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: getRoleColor(user['role'] ?? '').withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                user['role'] ?? '',
                                style: TextStyle(
                                  color: getRoleColor(user['role'] ?? ''),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: getFeeStatusColor(user['feeStatus'] ?? '').withOpacity(0.15),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                user['feeStatus'] ?? '',
                                style: TextStyle(
                                  color: getFeeStatusColor(user['feeStatus'] ?? ''),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
