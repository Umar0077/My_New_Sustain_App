import 'package:flutter/material.dart';

class TeachersDetails extends StatelessWidget {
  final Map<String, dynamic> user;

  const TeachersDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final isTeacher = user['role'] == 'Teacher';

    final details = {
      'Mehreen': {
        'phone': '+123 456 7890',
        'qualification': "Master's in Education",
        'email': 'mehreen@example.com',
        'degreeProof': 'https://via.placeholder.com/600x400.png?text=Degree+Proof',
      },
      'jennie': {
        'phone': '+111 222 3333',
        'qualification': 'BS Computer Science',
        'email': 'jennie@example.com',
        'degreeProof': 'https://via.placeholder.com/600x400.png?text=Degree+Proof',
      },
      'kim': {
        'phone': '+987 654 3210',
        'qualification': 'M.Ed Linguistics',
        'email': 'kim@example.com',
        'degreeProof': 'https://via.placeholder.com/600x400.png?text=Degree+Proof',
      },
      'zubia': {
        'phone': '+444 555 6666',
        'qualification': 'B.Ed in Science',
        'email': 'zubia@example.com',
        'degreeProof': 'https://via.placeholder.com/600x400.png?text=Degree+Proof',
      },
    }[user['name']] ?? {
      'phone': 'N/A',
      'qualification': 'N/A',
      'email': 'N/A',
      'degreeProof':
          'https://images.unsplash.com/photo-1607083206173-cd98260aa6d0?auto=format&fit=crop&w=800&q=80',
    };

    final screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth >= 600;

    final double avatarRadius = isLargeScreen ? 80 : 70;

    Widget profileSection = Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: avatarRadius,
              backgroundImage: NetworkImage(user['avatar'] ?? ''),
              backgroundColor: Colors.grey[200],
            ),
            Positioned(
              right: 4,
              bottom: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.all(4),
                child: const Icon(Icons.camera_alt, size: 20, color: Colors.black54),
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Text(
          user['name'] ?? '',
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Text(
          user['role'] ?? '',
          style: TextStyle(
            fontSize: 17,
            color: isTeacher ? Colors.blue : Colors.orange[800],
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.check_box, color: Colors.green, size: 20),
            SizedBox(width: 6),
            Text('Verified',
                style: TextStyle(
                    color: Colors.green, fontWeight: FontWeight.w600, fontSize: 16)),
          ],
        ),
      ],
    );

    Widget infoField(String label, String value) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black54,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Text(
              value,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      );
    }

    Widget infoSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Teacher Information',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 30),
        infoField('Full Name', user['name'] ?? ''),
        const SizedBox(height: 24),
        infoField('Email Address', details['email'] ?? ''),
        const SizedBox(height: 24),
        infoField('Phone Number', details['phone'] ?? ''),
        const SizedBox(height: 24),
        infoField('Role', user['role'] ?? ''),
        const SizedBox(height: 40),
        const Text(
          'Degree Proof',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black87),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DegreePreviewScreen(
                  imageUrl: details['degreeProof'] ?? '',
                ),
              ),
            );
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              details['degreeProof'] ?? '',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  const Text('Could not load document image.'),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'Teacher Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),  // Added SizedBox under AppBar
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: isLargeScreen ? 64 : 20,
                vertical: 32,
              ),
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: isLargeScreen ? 1400 : double.infinity),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  ),
                  child: isLargeScreen
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 1, child: profileSection),
                            const SizedBox(width: 56),
                            Expanded(flex: 2, child: infoSection),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            profileSection,
                            const SizedBox(height: 40),
                            infoSection,
                          ],
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DegreePreviewScreen extends StatelessWidget {
  final String imageUrl;

  const DegreePreviewScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Degree Preview'),
      ),
      body: Center(
        child: InteractiveViewer(
          child: Image.network(imageUrl),
        ),
      ),
    );
  }
}
