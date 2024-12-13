import 'package:flutter/material.dart';
import 'package:security_agency/screens/configure_shift_screen.dart';
import 'package:security_agency/screens/manage_access_code_screen.dart';

class CampusDetailPage extends StatelessWidget {
  const CampusDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          title: const Text('Nivedita Gardens'),
          foregroundColor: Colors.white,
        ),
        backgroundColor: Colors.grey[300],
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
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Nivedita Gardens',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    RichText(
                      text: const TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(text: "Address: "),
                            TextSpan(
                              text:
                                  "Maruti Chowk, Baner Street, Baner, Pune, Maharashtra 411045",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(height: 8),
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ManageAccessCodeScreen(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.key,
                        color: Colors.orange,
                      ),
                      label: const Text(
                        'Manage Access Code',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ),

              // Tab Section
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: const Color(0xFF1A2273),
                        ),
                        padding: const EdgeInsets.all(12.0),
                        child: const Column(
                          children: [
                            Text(
                              'Current Configuration',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Valid Till 01/07/23 08:00 am',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white),
                        padding: const EdgeInsets.all(12.0),
                        child: const Column(
                          children: [
                            Text(
                              'Upcoming Configuration',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Starting from 01/07/23 08:00 am',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ],
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
                    backgroundColor: const Color(0xFF1A2273),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConfigureShiftScreen(),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  label: const Text(
                    'Create Shift 3',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                ),
                const Spacer(),
                Checkbox(
                  value: true,
                  onChanged: (value) {},
                  activeColor: isChecked ? Colors.green : null,
                ),
              ],
            ),
            const SizedBox(height: 8),
            RichText(
              text: TextSpan(
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  children: [
                    const TextSpan(
                      text: 'Duty Time: ',
                    ),
                    TextSpan(
                      text: '$dutyTime ',
                      style: const TextStyle(color: Colors.black),
                    ),
                    const TextSpan(
                      text: '| Required Guards: ',
                    ),
                    TextSpan(
                      text: '$requiredGuards',
                      style: const TextStyle(color: Colors.black),
                    ),
                  ]),
            ),
            const SizedBox(height: 4),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                    color: Colors.grey, fontWeight: FontWeight.w700),
                children: [
                  const TextSpan(
                    text: 'Applied From: ',
                  ),
                  TextSpan(
                      text: appliedFrom,
                      style: const TextStyle(color: Colors.black)),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Configure Guards',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Temporary Allocation',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.blue,
                    ),
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
