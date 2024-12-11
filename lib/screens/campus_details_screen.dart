import 'package:flutter/material.dart';

class CampusDetailPage extends StatelessWidget {
  const CampusDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Nivedita Gardens'),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Section
            Image.asset(
              'assets/images/detail_campus.png',
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Campus Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Nivedita Gardens',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Address: Maruti Chowk, Baner Street, Baner, Pune, Maharashtra 411045',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 8),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.key, color: Colors.orange),
                    label: const Text(
                      'Manage Access Code',
                      style: TextStyle(color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),

            // Tab Section
            Container(
              color: Colors.grey[200],
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.blue[900],
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        'Current Configuration\nValid Till 01/07/23 08:00 am',
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(12.0),
                      child: const Text(
                        'Upcoming Configuration\nStarting From 01/07/23 08:00 am',
                        style: TextStyle(color: Colors.green),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Shift Information Section
            const ShiftCard(
              title: 'Shift 1 Information',
              dutyTime: '07:00 am',
              requiredGuards: 12,
              appliedFrom: '07/06/23',
              isChecked: true,
            ),
            const ShiftCard(
              title: 'Shift 2 Information',
              dutyTime: '05:00 pm',
              requiredGuards: 7,
              appliedFrom: '07/06/23',
              isChecked: false,
            ),

            // Create Shift Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                icon: const Icon(Icons.add),
                label: const Text('Create Shift 3'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ShiftCard extends StatelessWidget {
  final String title;
  final String dutyTime;
  final int requiredGuards;
  final String appliedFrom;
  final bool isChecked;

  const ShiftCard({
    super.key,
    required this.title,
    required this.dutyTime,
    required this.requiredGuards,
    required this.appliedFrom,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                Icon(
                  isChecked ? Icons.check_circle : Icons.check_circle_outline,
                  color: isChecked ? Colors.green : Colors.blue,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Duty Time: $dutyTime | Required Guards: $requiredGuards',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text(
              'Applied From: $appliedFrom',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Configure Guards',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Temporary Allocation',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
