import 'package:flutter/material.dart';

class ManageAccessCodeScreen extends StatelessWidget {
  const ManageAccessCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2273),
          foregroundColor: Colors.white,
          title: const Text('Manage Access Code'),
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'List of Access Codes',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Replace with the dynamic list length
                itemBuilder: (context, index) {
                  return AccessCodeTile(
                    code: 'NIV2106AB',
                    dateTime: '24/12/2023 at 10:30 am',
                    status: index == 1 ? 'Free' : 'Active',
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: const Color(0xFF225FA6),
                alignment: Alignment.center,
                child: const Text(
                  'Generate New Access Code',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccessCodeTile extends StatelessWidget {
  final String code;
  final String dateTime;
  final String status;

  const AccessCodeTile({
    super.key,
    required this.code,
    required this.dateTime,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                code,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                dateTime,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Show dialog when Share button is clicked
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: AlertDialog(
                          title: const Text(
                            'Send Access Code to:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: TextField(
                            decoration: InputDecoration(
                              hintText: "Please Enter Recipient's Mobile No.",
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.grey.shade200),
                              ),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actions: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1A2273),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 24),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Send Access Code Now',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Icon(Icons.share, color: Color(0xFF225FA6)),
              ),
              const SizedBox(width: 16),
              Text(
                status,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: status == 'Free' ? null : Colors.green,
                  decoration:
                      status == 'Free' ? TextDecoration.underline : null,
                ),
              ),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  // Handle Suspend Action
                },
                child: const Text(
                  'Suspend',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
