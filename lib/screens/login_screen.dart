import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:security_agency/screens/pin_create_screen.dart';
import 'package:security_agency/screens/sign_up_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool otpRequested = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF003C8F), Color(0xFF0073FF)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Container(
              padding: const EdgeInsets.only(top: 100),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/Security Agency Logo.svg',
                      height: 150,
                    ),
                    const SizedBox(height: 48),
                    const Text(
                      'WELCOME !',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Sign in to continue',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    const SizedBox(height: 48),
                    otpRequested
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Enter Verification Code',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'We have sent a verification code on your registered mobile number ********1978',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                PinCodeTextField(
                                  appContext: context,
                                  length: 4,
                                  onChanged: (value) {
                                    print("Changed: $value");
                                  },
                                  onCompleted: (value) {
                                    print("Completed: $value");
                                  },
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(8),
                                    fieldHeight: 60,
                                    fieldWidth: 60,
                                    activeColor: Colors.red,
                                    inactiveColor: Colors.blue[200]!,
                                    selectedColor: Colors.red,
                                    activeFillColor: Colors.red,
                                    inactiveFillColor: Colors.blue[200]!,
                                    selectedFillColor: Colors.red,
                                  ),
                                  backgroundColor: Colors.transparent,
                                  enableActiveFill: true,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                ),
                                const SizedBox(height: 48),
                                const Center(
                                  child: Text(
                                    "Haven't received the verificaton code?",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: const Text(
                                      'Resend OTP',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const CreatePinScreen(),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 48),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Color(0xffF55D3E),
                                      ),
                                      child: const Text(
                                        'Verify and continue',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Enter your Mobile Number',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const Text(
                                  'We will send you a Confirmation Code',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Mobile Number',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
                                const SizedBox(height: 8),
                                const TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Enter your number',
                                    hintStyle: TextStyle(color: Colors.white70),
                                  ),
                                  keyboardType: TextInputType.phone,
                                ),
                                const SizedBox(height: 64),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        otpRequested = true;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: MediaQuery.of(context).size.width,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 48),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                        color: Color(0xffF55D3E),
                                      ),
                                      child: const Text(
                                        'Send verification code',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(
                      height: 64,
                    ),
                    otpRequested
                        ? Container()
                        : Column(
                            children: [
                              const Text(
                                "Don't have an account?",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  'Sign Up Now',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.white,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                    const SizedBox(height: 32),
                    const Spacer(),
                    Column(
                      children: [
                        const Text(
                          'Design and Developed by',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SvgPicture.asset(
                          'assets/svg/MISCOS Logo.svg',
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
