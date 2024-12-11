import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:security_agency/screens/login_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color.fromARGB(100, 12, 76, 139),
            Color.fromARGB(100, 12, 84, 148),
            Color.fromARGB(100, 20, 88, 152),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            'Sign up',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    SvgPicture.asset('assets/svg/Security Agency Logo.svg',
                        height: 80),
                    const SizedBox(height: 24),
                    const Text(
                      'Welcome to Security Agency',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'Let’s get you started',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: 'Agency details'),
                    const CustomTextField(label: 'Agency Name'),
                    const CustomDropdown(label: 'No. of Employees'),
                    const CustomTextField(
                      label: 'Select Location',
                      suffixIcon: Icons.location_on_outlined,
                    ),
                    const CustomTextField(label: 'Enter Office Address'),
                    const CustomDropdown(label: 'Select State'),
                    const CustomDropdown(label: 'Select City'),
                    const CustomTextField(label: 'Agency Established Date'),
                    const SizedBox(height: 20),
                    const SectionHeader(title: 'Agency contact details'),
                    const CustomTextField(label: 'Name'),
                    const CustomDropdown(label: 'Select Designation'),
                    const CustomTextField(label: 'Email Id'),
                    CustomTextField(
                      label: 'Enter Mobile Number',
                      suffixWidget: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Verify with OTP',
                          style: TextStyle(color: Colors.orange),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Flexible(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: RichText(
                              text: const TextSpan(
                                  style: TextStyle(color: Colors.white70),
                                  children: <TextSpan>[
                                    TextSpan(text: "By Signing up I agree to "),
                                    TextSpan(
                                      text: "Terms and Conditions ",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    TextSpan(text: "and Privacy Policy")
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 48),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            color: Color(0xffF55D3E),
                          ),
                          child: const Text(
                            'Sign up',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Designed and Developed by',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SvgPicture.asset("assets/svg/MISCOS Logo.svg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData? suffixIcon;
  final Widget? suffixWidget;

  const CustomTextField({
    super.key,
    required this.label,
    this.suffixIcon,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: TextField(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            suffixIcon: suffixIcon != null ? Icon(suffixIcon) : suffixWidget,
          ),
        ),
      ),
    );
  }
}

class CustomDropdown extends StatelessWidget {
  final String label;

  const CustomDropdown({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: DropdownButtonFormField<String>(
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
          ),
          items: const [
            DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
            DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
          ],
          onChanged: (value) {},
        ),
      ),
    );
  }
}
