import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class StudentNotificationScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'icon': Icons.calendar_today,
      'text': 'Reminder: Math with Mr. Ariff at 4 PM.',
      'time': '20 minutes ago',
      'unread': true,
    },
    {
      'icon': Icons.message,
      'text': 'Miss Alia replied to your message.',
      'time': '1 hour ago',
      'unread': true,
    },
    {
      'icon': Icons.system_update,
      'text': 'New version 1.3.0 is available.',
      'time': 'Yesterday',
      'unread': false,
    },
    {
      'icon': Icons.calendar_today,
      'text': 'You\'ve got a class with Cikgu Aina tomorrow at 9 AM.',
      'time': 'Just now',
      'unread': false,
    },
    {
      'icon': Icons.lock,
      'text': 'Your password was updated successfully.',
      'time': '2 hours ago',
      'unread': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 900) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Row(
                children: [
                  // Left: Notifications
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(width: 10,),
                              const Text(
                                'Notifications',
                                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14.0),
                            child: const Text(
                              'Latest updates about your classes and app.',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Filter + Search
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                DropdownButton<String>(
                                  focusColor: Colors.white,
                                  dropdownColor: Color(0xFFe5faf3),
                                  icon: Icon(Icons.arrow_drop_down, color: appGreen,),
                                  underline: SizedBox.shrink(),
                                  value: 'All',
                                  items: ['All', 'Read', 'Unread']
                                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                                      .toList(),
                                  onChanged: (_) {},
                                ),
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    child: TextField(
                                      style: TextStyle(fontSize: 14),
                                      decoration: InputDecoration(
                                        hintText: 'Search Notifications...',
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Notifications List
                          Expanded(
                            child: ListView.builder(
                              itemCount: notifications.length,
                              itemBuilder: (context, index) {
                                final notif = notifications[index];
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 16),
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade100,
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Color(0xFFe5faf3),
                                            child: Icon(notif['icon'], color: appGreen,),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              notif['text'],
                                              style: const TextStyle(fontSize: 15),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          Text(
                                            notif['time'],
                                            style: TextStyle(color: Colors.grey[600], fontSize: 13),
                                          ),
                                          const Spacer(),
                                          notif['unread']
                                              ? Row(
                                            children: const [
                                              Icon(Icons.check_circle, color: appGreen, size: 18),
                                              SizedBox(width: 6),
                                              Text('Mark as Read'),
                                              SizedBox(width: 16),
                                              Icon(Icons.delete, color: appRed, size: 18),
                                              SizedBox(width: 6),
                                              Text('Delete'),
                                            ],
                                          )
                                              : Row(
                                            children: const [
                                              Icon(Icons.check_circle, color: appGreen, size: 18),
                                              SizedBox(width: 6),
                                              Text('Mark as Unread'),
                                              SizedBox(width: 16),
                                              Icon(Icons.delete, color: appRed, size: 18),
                                              SizedBox(width: 6),
                                              Text('Delete'),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                  // Right: Filters & Stats
                  Container(
                    width: 280,
                    padding: const EdgeInsets.all(24),
                    color: Colors.grey[50],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Filters', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        _filterButton('Read'),
                        _filterButton('Unread'),
                        const SizedBox(height: 24),
                        const Text('Preferences', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: appGreen,
                              side: BorderSide(
                                color: appGreen,
                              )
                            ),
                            child: const Text('Mark all as read'),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: appGreen,
                                side: BorderSide(
                                  color: appGreen,
                                )
                            ),
                            child: const Text('Delete all'),
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text('Stats', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 12),
                        _statRow(Icons.error, '3 Unread', appGreen),
                        _statRow(Icons.calendar_today, '2 Class Reminders Today', appGreen),
                        _statRow(Icons.check_circle, '58 Read in past 7 days', appGreen),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notifications',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            DropdownButton<String>(
                              focusColor: Colors.white,
                              dropdownColor: Color(0xFFe5faf3),
                              icon: const Icon(Icons.arrow_drop_down, color: appGreen),
                              value: 'All',
                              underline: SizedBox(),
                              items: ['All', 'Read', 'Unread']
                                  .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text(val),
                              ))
                                  .toList(),
                              onChanged: (val) {},
                            ),
                            IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Notifications list
                    Expanded(
                      child: ListView.separated(
                        itemCount: notifications.length,
                        separatorBuilder: (_, __) => const SizedBox(height: 10),
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          return Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade200,
                                  blurRadius: 6,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                // Icon
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Color(0xFFe5faf3),
                                  child: Icon(notif['icon'], color: appGreen),
                                ),
                                const SizedBox(width: 12),
                                // Texts
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        notif['text'],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        notif['time'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Green dot if unread
                                if (notif['unread'])
                                  Row(
                                    children: const [
                                      Icon(Icons.circle, color: appGreen, size: 12),
                                      SizedBox(width: 10),
                                    ],
                                  ),
                                Icon(Icons.delete, color: appRed, size: 18),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
  Widget _filterButton(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: appGreen,
            side: BorderSide(
              color: appGreen,
            )
          ),
          child: Text(label),
        ),
      ),
    );
  }

  Widget _statRow(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, color: color, size: 18),
          const SizedBox(width: 8),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}
