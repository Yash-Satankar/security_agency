import 'package:flutter/material.dart';

class ConfigureGuardTypePositionsScreen extends StatefulWidget {
  const ConfigureGuardTypePositionsScreen({super.key});

  @override
  _ConfigureGuardTypePositionsScreenState createState() =>
      _ConfigureGuardTypePositionsScreenState();
}

class _ConfigureGuardTypePositionsScreenState
    extends State<ConfigureGuardTypePositionsScreen> {
  final TextEditingController _maleGuardController =
      TextEditingController(text: '05');
  final TextEditingController _femaleGuardController =
      TextEditingController(text: '05');
  final TextEditingController _srMaleGuardController =
      TextEditingController(text: '05');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2273),
          foregroundColor: Colors.white,
          title: const Text('Configure Guard Type Wise Positions'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Fill in the information to Configure the Shift',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 20),
                  _buildGuardTypeField('Male Guard', _maleGuardController),
                  const SizedBox(height: 20),
                  _buildGuardTypeField('Female Guard', _femaleGuardController),
                  const SizedBox(height: 20),
                  _buildGuardTypeField(
                      'Sr. Male Guard', _srMaleGuardController),
                ],
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: _validateAndSave,
              child: Container(
                color: const Color(0xFF1A2273),
                padding: const EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                child: const Text(
                  'Save and Back',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGuardTypeField(
      String guardType, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Guard Type: $guardType',
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter positions';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 10),
            Checkbox(
              value: controller.text.isNotEmpty,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }

  void _validateAndSave() {
    if (_maleGuardController.text.isEmpty ||
        _femaleGuardController.text.isEmpty ||
        _srMaleGuardController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill all fields'),
        ),
      );
      return;
    }

    if (int.tryParse(_maleGuardController.text) == null ||
        int.tryParse(_femaleGuardController.text) == null ||
        int.tryParse(_srMaleGuardController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter valid numbers for all fields'),
        ),
      );
      return;
    }

    // Save logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Saved successfully!'),
      ),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _maleGuardController.dispose();
    _femaleGuardController.dispose();
    _srMaleGuardController.dispose();
    super.dispose();
  }
}
