import 'package:flutter/material.dart';
import 'package:security_agency/screens/campus_details_screen.dart';
import 'package:security_agency/screens/introduce_new_campus_screen.dart';

class CampusListPage extends StatelessWidget {
  final List<Map<String, dynamic>> campusDetails = [
    {
      'title': 'Nivedita Gardens',
      'address': 'Undri Pune 411060',
      'client': 'Nivedita Groups',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '3.6 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
    {
      'title': 'Kumar Corners',
      'address': 'MG Road Pune 411028',
      'client': 'Nivedita Groups',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '5 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
    {
      'title': 'Bramha Suncity',
      'address': 'MG Road Pune 411028',
      'client': 'Bramha Group',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '5 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
    {
      'title': 'Nyati Elsia',
      'address': 'Kharadi',
      'client': 'Nyati Group',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '5 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
    {
      'title': 'Raga Foundations',
      'address': 'MG Road Pune 411028',
      'client': 'Raga Groups',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '5 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
    {
      'title': 'Raga Foundations',
      'address': 'MG Road Pune 411028',
      'client': 'Raga Groups',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '5 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
    {
      'title': 'Raga Foundations',
      'address': 'MG Road Pune 411028',
      'client': 'Raga Groups',
      'outstandingAmount': '₹ 10,500.00',
      'rating': '5 Star',
      'pbp': '+12',
      'lastAssociation': '12/01/2024',
      'imagePath': 'assets/images/non_campus.png',
    },
  ];

  CampusListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF1A2273),
          title: const Text(
            'Non Premisafe Campus',
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by Campus Name/Client Name',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: campusDetails.length,
                itemBuilder: (context, index) {
                  final campus = campusDetails[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CampusDetailPage(),
                        ),
                      );
                    },
                    child: CampusDetailCard(
                      title: campus['title'],
                      address: campus['address'],
                      client: campus['client'],
                      outstandingAmount: campus['outstandingAmount'],
                      rating: campus['rating'],
                      pbp: campus['pbp'],
                      lastAssociation: campus['lastAssociation'],
                      imagePath: campus['imagePath'],
                    ),
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => showFilterBottomSheet(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      color: const Color(0xFF225FA6),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_alt,
                            color: Colors.white,
                          ),
                          Text(
                            "Filter",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const IntroduceNewCampusScreen(),
                        ),
                      );
                    },
                    child: const Center(child: Text("Introduce New Campus")),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.red, fontSize: 16),
                    ),
                  ),
                  const Text(
                    'Filter',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 48), // To align center title
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Sort by',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Received'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text('Transferred'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Date',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Date Picker for "Select from Date"
                      },
                      child: const Text('Select from Date'),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        // Date Picker for "Select to Date"
                      },
                      child: const Text('Select to Date'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Apply Filters
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.3),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    color: const Color(0xFF225FA6),
                    alignment: Alignment.center,
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class CampusDetailCard extends StatelessWidget {
  final String title;
  final String address;
  final String client;
  final String outstandingAmount;
  final String rating;
  final String pbp;
  final String lastAssociation;
  final String imagePath;

  const CampusDetailCard({
    super.key,
    required this.title,
    required this.address,
    required this.client,
    required this.outstandingAmount,
    required this.rating,
    required this.pbp,
    required this.lastAssociation,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        size: 12,
                        color: Color(0xFFFAD349),
                      ),
                      const Text(
                        "3.6 Star",
                        style: TextStyle(fontSize: 10),
                      ),
                      const Spacer(),
                      const Text(
                        "PBP +12",
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                  Text(
                    'Address: $address',
                    style: const TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Client Name: $client',
                    style: const TextStyle(fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Outstanding Amount: $outstandingAmount',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.info,
                        color: Colors.red,
                        size: 12,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Last Association Date: $lastAssociation',
                        style: const TextStyle(fontSize: 10),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: const Text(
                          'Change',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
