import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:security_agency/screens/campus_management_screen.dart';
import 'package:security_agency/screens/sign_up_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFFEFEFEF),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Durga Agency",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 32),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                ),
                                const Text("Swargate, Pune"),
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    "change",
                                    style: TextStyle(
                                        decoration: TextDecoration.underline),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.notifications,
                          color: Color(0xFF1A4CAD),
                          size: 48,
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3))
                        ],
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                            hintText: 'Search for services',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitle("Management"),
                  buildIconGrid([
                    GridItem(
                      "Performance\nDashboard",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Branch\nManagement",
                      "assets/svg/Group 2547.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Employee\nManagement",
                      "assets/svg/Group 2548.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Manager and\nSupervisor",
                      "assets/svg/Group 2549.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Guard\nManagement",
                      "assets/svg/Group 2550.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Client\nManagement",
                      "assets/svg/logo-FinalConcept112 1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Campus\nManagement",
                      "assets/svg/Group 2551.svg",
                      CampusManagementPage(),
                    ),
                  ]),
                  const SectionTitle("Settings"),
                  buildIconGrid([
                    GridItem(
                      "Agency\nSettings",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Branch\nSettings",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Branch with\nGuard Type",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Campus\nSettings",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "System\nSettings",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Guard Activities"),
                  buildIconGrid([
                    GridItem(
                      "Duty\nAllocation",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Groups and\nMessages",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Purchase and Services"),
                  buildIconGrid([
                    GridItem(
                      "Smart\nWrist",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Licenses",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Other\nServices",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Support and\n Services",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Supervisors"),
                  buildIconGrid([
                    GridItem(
                      "Guard duty\nOn/Off",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Guard duty\nManagement",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Guard\nMonitoring",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Uniforms and Materials"),
                  buildIconGrid([
                    GridItem(
                      "Uniforms",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Materials",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Issued",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Returned",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Accounts"),
                  buildIconGrid([
                    GridItem(
                      "Fund\nDisbursement",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Client Invoice",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Transaction\nHistory",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Wallet\nRecharge",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Reports"),
                  buildIconGrid([
                    GridItem(
                      "Campus\nReport",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Guard\nReport",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Employee\nReport",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Transaction\nReport",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Get in touch"),
                  buildIconGrid([
                    GridItem(
                      "Help and\nSupport",
                      "assets/svg/1.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "Get in Touch\nwith Us",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                    GridItem(
                      "FAQs",
                      "assets/svg/Group 2546.svg",
                      const SignUpScreen(),
                    ),
                  ]),
                  const SectionTitle("Log out"),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.power_settings_new,
                              color: Colors.red),
                          onPressed: () {},
                          iconSize: 40,
                        ),
                        const Text("Log out"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIconGrid(List<GridItem> items) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => item.screen),
              );
            },
            child: Container(
              margin:
                  const EdgeInsets.only(left: 12, top: 8, bottom: 8, right: 16),
              child: Column(
                children: [
                  SvgPicture.asset(
                    item.iconPath,
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.label,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class GridItem {
  final String label;
  final String iconPath;
  final Widget screen;

  GridItem(this.label, this.iconPath, this.screen);
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
