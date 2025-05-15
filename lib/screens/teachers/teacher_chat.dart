import 'package:al_mehdi_online_school/screens/teachers/teacher_attendance.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_classes.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_home_screen.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_profile.dart';
import 'package:al_mehdi_online_school/screens/teachers/teacher_settings.dart';
import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TeacherChatScreen extends StatefulWidget {
  const TeacherChatScreen({super.key});

  @override
  State<TeacherChatScreen> createState() => _TeacherChatScreenState();
}

class _TeacherChatScreenState extends State<TeacherChatScreen> {
  int? selectedChatIndex;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Web/tablet layout
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
                      _SidebarItem(
                        icon: Icons.home,
                        label: 'Home',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TeacherHomeScreen(),
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
                              builder:
                                  (context) => const TeacherClassesScreen(),
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
                        selected: true,
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
                // Chat list
                Container(
                  width: 320,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    border: Border(
                      right: BorderSide(color: Color(0xFFE5EAF1), width: 1),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 33,
                          vertical: 21,
                        ),
                        child: const Text(
                          'Chats',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Color(0xFF2B3A4A),
                          ),
                        ),
                      ),
                      const Divider(
                        height: 1,
                        thickness: 1,
                        color: Color(0xFFE5EAF1),
                      ),
                      SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search chats...',
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
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView(
                          children: [
                            _ChatListTile(
                              avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                              name: 'Mr. Hafiz',
                              message: 'Can we do Chapter 4 today?',
                              time: '2:30 PM',
                              selected: selectedChatIndex == 0,
                              onTap:
                                  () => setState(() => selectedChatIndex = 0),
                            ),
                            _ChatListTile(
                              avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                              name: 'Ali',
                              message: "Sure! Let's revise that first.",
                              time: '2:15 PM',
                              selected: selectedChatIndex == 1,
                              onTap:
                                  () => setState(() => selectedChatIndex = 1),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Chat conversation or empty area
                Expanded(
                  child:
                      selectedChatIndex == null
                          ? const Center(
                            child: Text(
                              'select the chat to appear',
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                          : _ChatConversation(
                            chat:
                                selectedChatIndex == 0
                                    ? {
                                      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                                      'name': 'Mr. Hafiz',
                                      'online': true,
                                    }
                                    : {
                                      'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                                      'name': 'Ali',
                                      'online': false,
                                    },
                          ),
                ),
              ],
            ),
          );
        } else {
          // Mobile layout: just show chat list
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
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            body: ListView(
              children: [
                _ChatListTile(
                  avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                  name: 'Mr. Hafiz',
                  message: 'Can we do Chapter 4 today?',
                  time: '2:30 PM',
                  selected: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => StudentChatConversationScreen(
                              chat: {
                                'avatar':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                                'name': 'Mr. Hafiz',
                                'online': true,
                              },
                            ),
                      ),
                    );
                  },
                ),
                _ChatListTile(
                  avatar: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                  name: 'Ali',
                  message: "Sure! Let's revise that first.",
                  time: '2:15 PM',
                  selected: false,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => StudentChatConversationScreen(
                              chat: {
                                'avatar': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzmDFOpRqmQmU64T6__2MDOl6NLaCK4I-10MHVrCGltXOSeXcl56_sD59-0ddr4M9aNc0&usqp=CAU',
                                'name': 'Ali',
                                'online': false,
                              },
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: appGreen,
              unselectedItemColor: Colors.black,
              currentIndex: 2, // Chat is selected
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedLabelStyle: const TextStyle(fontSize: 12),
              unselectedLabelStyle: const TextStyle(fontSize: 12),
              selectedIconTheme: const IconThemeData(size: 24),
              unselectedIconTheme: const IconThemeData(size: 24),
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
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.teacher),
                  label: 'Classes',
                ),
                BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
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
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
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
      selected: selected,
      onTap: onTap,
    );
  }
}

class _ChatListTile extends StatelessWidget {
  final String avatar;
  final String name;
  final String message;
  final String time;
  final bool selected;
  final VoidCallback onTap;

  const _ChatListTile({
    required this.avatar,
    required this.name,
    required this.message,
    required this.time,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: selected ? const Color(0xFFe5faf3) : Colors.transparent,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatar),
          radius: 22,
        ),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Text(
          time,
          style: const TextStyle(fontSize: 13, color: Colors.black),
        ),
        onTap: onTap,
      ),
    );
  }
}

class _ChatConversation extends StatelessWidget {
  final Map<String, dynamic> chat;
  final bool showHeader;
  const _ChatConversation({
    required this.chat,
    this.showHeader = true,
  });

  @override
  Widget build(BuildContext context) {
    // Example chat messages
    final messages = [
      {
        'fromMe': false,
        'text': "Sure! Let's revise that first.",
        'time': '2:33 PM',
      },
      {'fromMe': true, 'text': "Can we do Chapter 4 today?", 'time': '2:32 PM'},
      {'fromMe': true, 'text': "Thanks! 🙌", 'time': '2:34 PM'},
      {
        'fromMe': false,
        'text': "Join via the same link at 2 PM.",
        'time': '2:35 PM',
      },
    ];

    return Column(
      children: [
        if (showHeader)
          // Chat header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                bottom: BorderSide(color: Color(0xFFE5EAF1), width: 1),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(chat['avatar']),
                  radius: 18,
                ),
                const SizedBox(width: 8),
                Text(
                  chat['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 8),
                if (chat['online'])
                  const Text(
                    'Online',
                    style: TextStyle(
                      color: appGreen,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
              ],
            ),
          ),
        // Chat messages
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            itemCount: messages.length,
            itemBuilder: (context, index) {
              final msg = messages[index];
              final isMe = msg['fromMe'] as bool;
              return Align(
                alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isMe ? const Color(0xFFDDF8E5) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Text(
                          msg['text'].toString(),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        msg['time'].toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Message input
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Color(0xFFE5EAF1), width: 1)),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Write your message...',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: Colors.grey[100],
                    filled: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.attach_file, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.send, color: appGreen),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class StudentChatConversationScreen extends StatelessWidget {
  final Map<String, dynamic> chat;
  const StudentChatConversationScreen({required this.chat, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(chat['avatar']),
              radius: 18,
            ),
            const SizedBox(width: 8),
            Text(
              chat['name'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            if (chat['online'])
              const Text(
                'Online',
                style: TextStyle(
                  color: appGreen,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
          ],
        ),
      ),
      body: _ChatConversation(chat: chat, showHeader: false),
    );
  }
}
