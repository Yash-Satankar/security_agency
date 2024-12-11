import 'package:flutter/material.dart';
import 'package:security_agency/screens/campus_list_screen.dart';
import 'package:security_agency/screens/sign_up_screen.dart';

class CampusManagementPage extends StatelessWidget {
  final List<Map<String, dynamic>> campuses = [
    {
      'title': 'Non- Premisafe Campus',
      'count': 20,
      'imagePath': 'assets/images/non-premisafe.png',
      'screen': CampusListPage(),
    },
    {
      'title': 'Premisafe Campus',
      'count': 12,
      'imagePath': 'assets/images/premisafe.png',
      'screen': const SignUpScreen(),
    },
    {
      'title': 'Office Campus',
      'count': 11,
      'imagePath': 'assets/images/office.png',
      'screen': const SignUpScreen(),
    },
    {
      'title': 'Roastr',
      'count': 2,
      'imagePath': 'assets/images/roastr.png',
      'screen': const SignUpScreen(),
    },
    {
      'title': 'Other Premises',
      'count': 7,
      'imagePath': 'assets/images/other.png',
      'screen': const SignUpScreen(),
    },
  ];

  CampusManagementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF1A2273),
          title: const Text(
            'Campus Management',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.85,
            ),
            itemCount: campuses.length,
            itemBuilder: (context, index) {
              final campus = campuses[index];
              return CampusCard(
                title: campus['title'],
                count: campus['count'],
                imagePath: campus['imagePath'],
                screen: campus['screen'],
              );
            },
          ),
        ),
      ),
    );
  }
}

class CampusCard extends StatelessWidget {
  final String title;
  final int count;
  final String imagePath;
  final Widget screen;

  const CampusCard({
    super.key,
    required this.title,
    required this.count,
    required this.imagePath,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '($count)',
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
