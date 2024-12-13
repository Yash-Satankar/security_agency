import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:security_agency/screens/dashboard_screen.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  String first = '';
  String second = '1';
  bool pinCreated = false;
  String? enteredPin;
  String? errorPin;

  bool _validateOtp() {
    if (enteredPin == null || enteredPin!.length != 4) {
      setState(() {
        errorPin = 'Enter a valid PIN';
      });
      return false;
    } else {
      setState(() {
        errorPin = null;
      });
      return true;
    }
  }

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
                      'Welcome Mr. Aayush Saxena',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 48),
                    pinCreated
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              children: [
                                const Text(
                                  'Enter Login Pin',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                PinCodeTextField(
                                  appContext: context,
                                  length: 4,
                                  onChanged: (value) {
                                    print("Changed: $value");
                                    enteredPin = value;
                                  },
                                  onCompleted: (value) {
                                    setState(() {
                                      first = value;
                                    });
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
                                  validator: (value) {
                                    if (value == null || value.length != 4) {
                                      return "Enter a valid code";
                                    }
                                    return null;
                                  },
                                  backgroundColor: Colors.transparent,
                                  enableActiveFill: true,
                                  textStyle:
                                      const TextStyle(color: Colors.white),
                                  keyboardType: TextInputType.number,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                ),
                                if (errorPin != null)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      errorPin!,
                                      style: const TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                const SizedBox(
                                  height: 24,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: const Text(
                                    "Forgot PIN?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Colors.white),
                                  ),
                                ),
                                const SizedBox(
                                  height: 80,
                                ),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (_validateOtp() == true) {
                                        showAlertDialog(context);
                                      }
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
                                        'Login',
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
                                  'Kindly setup your PIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(
                                  height: 24,
                                ),
                                const Text(
                                  'Create your PIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                PinCodeTextField(
                                  appContext: context,
                                  length: 4,
                                  onChanged: (value) {
                                    print("Changed: $value");
                                  },
                                  onCompleted: (value) {
                                    setState(() {
                                      first = value;
                                    });
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
                                const SizedBox(height: 24),
                                const Text(
                                  'Re - Enter your PIN',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                PinCodeTextField(
                                  appContext: context,
                                  length: 4,
                                  onChanged: (value) {
                                    print("Changed: $value");
                                  },
                                  onCompleted: (value) {
                                    setState(() {
                                      second = value;
                                    });
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
                                const SizedBox(height: 20),
                                Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      if (first == second) {
                                        setState(() {
                                          pinCreated = true;
                                        });
                                      }
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
                                        'Create PIN',
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

  Future<dynamic> showAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text(
          "Accounts linked with this number",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        content: SizedBox(
          height: 200,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  "Please select any one of the following office:",
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Monarch Surveyors",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text("Address"),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Monarch Surveyors",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text("Address"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 40),
              decoration: const BoxDecoration(color: Colors.orange),
              child: const Text("Proceed"),
            ),
          ),
        ],
        actionsAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
