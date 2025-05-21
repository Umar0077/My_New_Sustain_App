import 'package:flutter/material.dart';
import 'package:al_mehdi_online_school/constants/colors.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/admin_home_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/attendance_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/profile_screen.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/schedule_class.dart';
import 'package:al_mehdi_online_school/Screens/AdminDashboard/sidebar%20and%20bottom%20Tabs%20Screens/settings_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int? selectedChatIndex;

  final Color sidebarBgColor = const Color(0xffe6f6f1);
  final Color sidebarIconColor = Colors.black87;
  final Color sidebarActiveColor = appGreen;

  final List<Map<String, dynamic>> _sidebarItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.schedule, 'label': 'Schedule Class'}, // stays in sidebar
    {'icon': Icons.chat_bubble, 'label': 'Chat'},
    {'icon': Icons.article, 'label': 'Attendance'},
    {'icon': Icons.person, 'label': 'Profile'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  int _selectedSidebarIndex = 2; // Chat index

  void _navigateTo(int index) {
    setState(() => _selectedSidebarIndex = index);

    switch (_sidebarItems[index]['label']) {
      case 'Home':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const AdminHomeScreen()));
        break;
      case 'Schedule Class':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ScheduleClass()));
        break;
      case 'Chat':
        // Already on Chat screen
        break;
      case 'Attendance':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const AttendanceScreen()));
        break;
      case 'Profile':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const ProfileScreen()));
        break;
      case 'Settings':
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => const SettingsScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      backgroundColor: Colors.white,
      body: isWeb
          ? Row(
              children: [
                // Sidebar - includes Schedule Class
                Container(
                  width: 220,
                  decoration: BoxDecoration(
                    color: sidebarBgColor,
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(2, 0),
                      )
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
                              Icon(
                                item['icon'],
                                color: isActive ? sidebarActiveColor : sidebarIconColor,
                              ),
                              const SizedBox(width: 12),
                              Text(
                                item['label'],
                                style: TextStyle(
                                  fontWeight:
                                      isActive ? FontWeight.bold : FontWeight.normal,
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

                // Main Chat Content
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        width: 320,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(right: BorderSide(color: Color(0xFFE5EAF1), width: 1)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 33, vertical: 21),
                              child: Text(
                                'Chats',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            const Divider(height: 1, thickness: 1, color: Color(0xFFE5EAF1)),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search chats...',
                                  filled: true,
                                  fillColor: Colors.grey[100],
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView(
                                children: [
                                  _ChatListTile(
                                    avatar: 'https://i.pravatar.cc/300',
                                    name: 'Teacher Hafiz',
                                    message: 'Can we do Chapter 4 today?',
                                    time: '2:30 PM',
                                    selected: selectedChatIndex == 0,
                                    onTap: () => setState(() => selectedChatIndex = 0),
                                  ),
                                  _ChatListTile(
                                    avatar: 'https://i.pravatar.cc/301',
                                    name: 'Student Ali',
                                    message: "Sure! Let's revise that first.",
                                    time: '2:15 PM',
                                    selected: selectedChatIndex == 1,
                                    onTap: () => setState(() => selectedChatIndex = 1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: selectedChatIndex == null
                            ? const Center(child: Text('Select a chat to view conversation'))
                            : _ChatConversation(
                                chat: selectedChatIndex == 0
                                    ? {
                                        'avatar': 'https://i.pravatar.cc/300',
                                        'name': 'Teacher Hafiz',
                                        'online': true,
                                      }
                                    : {
                                        'avatar': 'https://i.pravatar.cc/301',
                                        'name': 'Student Ali',
                                        'online': false,
                                      },
                              ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      _ChatListTile(
                        avatar: 'https://i.pravatar.cc/300',
                        name: 'Teacher Hafiz',
                        message: 'Can we do Chapter 4 today?',
                        time: '2:30 PM',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatConversationScreen(chat: {
                                'avatar': 'https://i.pravatar.cc/300',
                                'name': 'Teacher Hafiz',
                                'online': true,
                              }),
                            ),
                          );
                        },
                      ),
                      _ChatListTile(
                        avatar: 'https://i.pravatar.cc/301',
                        name: 'Student Ali',
                        message: "Sure! Let's revise that first.",
                        time: '2:15 PM',
                        selected: false,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChatConversationScreen(chat: {
                                'avatar': 'https://i.pravatar.cc/301',
                                'name': 'Student Ali',
                                'online': false,
                              }),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                // Bottom Navigation Bar with Schedule Class removed
                BottomNavigationBar(
                  currentIndex: 1, // Chat index in bottom nav without Schedule Class
                  selectedItemColor: appGreen,
                  unselectedItemColor: Colors.black,
                  backgroundColor: Colors.white,
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  onTap: (index) {
                    switch (index) {
                      case 0:
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AdminHomeScreen()));
                        break;
                      case 1:
                        // Already here
                        break;
                      case 2:
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AttendanceScreen()));
                        break;
                      case 3:
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProfileScreen()));
                        break;
                      case 4:
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const SettingsScreen()));
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
              ],
            ),
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
        leading: CircleAvatar(backgroundImage: NetworkImage(avatar), radius: 22),
        title: Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(message, maxLines: 1, overflow: TextOverflow.ellipsis),
        trailing: Text(time, style: const TextStyle(fontSize: 13)),
        onTap: onTap,
      ),
    );
  }
}

class _ChatConversation extends StatelessWidget {
  final Map<String, dynamic> chat;

  const _ChatConversation({required this.chat});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {'fromMe': true, 'text': 'Can we do Chapter 4 today?', 'time': '2:32 PM'},
      {'fromMe': false, 'text': "Sure! Let's revise that first.", 'time': '2:33 PM'},
      {'fromMe': true, 'text': 'Thanks! 🙌', 'time': '2:34 PM'},
      {'fromMe': false, 'text': 'Join via the same link at 2 PM.', 'time': '2:35 PM'},
    ];

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Color(0xFFE5EAF1), width: 1)),
          ),
          child: Row(
            children: [
              CircleAvatar(backgroundImage: NetworkImage(chat['avatar']), radius: 18),
              const SizedBox(width: 8),
              Text(chat['name'],
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(width: 8),
              if (chat['online'])
                const Text('Online', style: TextStyle(color: appGreen, fontSize: 13)),
            ],
          ),
        ),
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
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isMe ? const Color(0xFFDDF8E5) : Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment:
                        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                    children: [
                      Text(
                        msg['text'] ?? '',
                        style: const TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        msg['time'] ?? '',
                        style: const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        // Removed the input TextField and buttons below here for read-only
      ],
    );
  }
}

class ChatConversationScreen extends StatelessWidget {
  final Map<String, dynamic> chat;

  const ChatConversationScreen({required this.chat, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            CircleAvatar(backgroundImage: NetworkImage(chat['avatar']), radius: 18),
            const SizedBox(width: 8),
            Text(chat['name'],
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            const SizedBox(width: 8),
            if (chat['online'])
              const Text('Online', style: TextStyle(color: appGreen, fontSize: 13)),
          ],
        ),
      ),
      body: _ChatConversation(chat: chat),
    );
  }
}
