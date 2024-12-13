import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:security_agency/screens/configure_guard_type_screen.dart';

class ConfigureShiftScreen extends StatefulWidget {
  const ConfigureShiftScreen({super.key});

  @override
  _ConfigureShiftScreenState createState() => _ConfigureShiftScreenState();
}

class _ConfigureShiftScreenState extends State<ConfigureShiftScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _minsController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _postEndTimeController = TextEditingController();
  final TextEditingController _preStartTimeController = TextEditingController();
  final TextEditingController _smsAlertTimeController = TextEditingController();
  final TextEditingController _effectiveDateController =
      TextEditingController();

  bool isAcknowledged = false;

  Future<void> _selectTime(TextEditingController controller) async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      controller.text = time.format(context);
    }
  }

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(date);
    }
  }

  void _submitForm() {
    if (_formKey.currentState!.validate() && isAcknowledged) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Shift configured successfully!')),
      );
    } else if (!isAcknowledged) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please acknowledge the responsibility.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2273),
          foregroundColor: Colors.white,
          title: const Text('Configure Shift 3'),
          actions: [
            InkWell(
              onTap: () {},
              child: const Text(
                "Current Configuration",
                style: TextStyle(
                    fontSize: 12,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.white),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Text(
                  "Fill in the information to Configure the Shift",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _hoursController,
                        decoration: InputDecoration(
                          labelText: 'Hours',
                          hintText: 'HH',
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) < 0) {
                            return 'Invalid hours';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _minsController,
                        decoration: InputDecoration(
                          labelText: 'Mins',
                          hintText: 'MM',
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Required';
                          }
                          if (int.tryParse(value) == null ||
                              int.parse(value) < 0 ||
                              int.parse(value) >= 60) {
                            return 'Invalid minutes';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildTimeField('Start Time', _startTimeController),
                _buildTimeField('End Time', _endTimeController),
                _buildTimeField('Post End Time', _postEndTimeController),
                _buildTimeField('Pre Start Time', _preStartTimeController),
                _buildTimeField('SMS Alert Time', _smsAlertTimeController),
                _buildDateField('Effective From', _effectiveDateController),
                const SizedBox(height: 16),
                TextFormField(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const ConfigureGuardTypePositionsScreen(),
                      ),
                    );
                  },
                  controller: _minsController,
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const ConfigureGuardTypePositionsScreen(),
                          ),
                        );
                      },
                    ),
                    labelText: 'Configure Guard Type wise Positions',
                    hintText: 'Not Configured',
                    hintStyle: const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.center,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isAcknowledged,
                      onChanged: (value) {
                        setState(() {
                          isAcknowledged = value ?? false;
                        });
                      },
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: const Text(
                          "I hereby acknowledge and assume complete responsibility for this action."),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                InkWell(
                  onTap: () async {
                    _submitForm;
                    Navigator.pop(context);
                  },
                  child: Container(
                    color: const Color(0xFF1A2273),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    alignment: Alignment.center,
                    child: const Text(
                      'Configure Shift',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTimeField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        onTap: () => _selectTime(controller),
        controller: controller,
        decoration: InputDecoration(
          hintText: label,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: label,
          suffixIcon: IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () => _selectTime(controller),
          ),
        ),
        readOnly: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildDateField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        onTap: () => _selectDate(controller),
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: label,
          floatingLabelAlignment: FloatingLabelAlignment.center,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          suffixIcon: IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(controller),
          ),
        ),
        readOnly: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Required';
          }
          return null;
        },
      ),
    );
  }
}
