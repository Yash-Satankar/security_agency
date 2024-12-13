import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class IntroduceNewCampusScreen extends StatefulWidget {
  const IntroduceNewCampusScreen({super.key});

  @override
  _IntroduceNewCampusScreenState createState() =>
      _IntroduceNewCampusScreenState();
}

class _IntroduceNewCampusScreenState extends State<IntroduceNewCampusScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedClient;
  String? _selectedCategory;
  String? _campusType;
  String? _subCategory;
  String? _licenseType;
  String? _state;
  String? _city;
  final TextEditingController _campusNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _campusRadiusController = TextEditingController();
  final TextEditingController _basicAmountController = TextEditingController();
  final TextEditingController _taxController = TextEditingController();
  final TextEditingController _contactNameController = TextEditingController();
  final TextEditingController _contactMobileController =
      TextEditingController();
  final TextEditingController _contactEmailController = TextEditingController();
  DateTime? _selectedDate;
  List<PlatformFile>? pickedFiles;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A2273),
          foregroundColor: Colors.white,
          title: const Text('Introduce New Campus'),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      color: Colors.grey,
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    const Positioned(
                      bottom: -40,
                      child: Center(
                        child: CircleAvatar(
                          radius: 40,
                          backgroundColor: Colors.grey,
                          child: Icon(Icons.camera_alt,
                              size: 40, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Fill in the details',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      const SizedBox(height: 20),
                      _buildDropdownField(
                          'Select Client',
                          ['Khurna Builders', 'Other Client'],
                          (value) => _selectedClient = value),
                      _buildDropdownField(
                          'Select Category',
                          ['Builder', 'Contractor'],
                          (value) => _selectedCategory = value),
                      _buildDropdownField(
                          'Campus Type',
                          ['Non-Premisafe', 'Premisafe'],
                          (value) => _campusType = value),
                      _buildDropdownField(
                          'Select Sub Category',
                          ['Category 1', 'Category 2'],
                          (value) => _subCategory = value),
                      _buildTextField('Campus Name', _campusNameController),
                      _buildTextField(
                          'Enter Campus Address', _addressController),
                      _buildDropdownField(
                          'Select License Type',
                          ['Housing License', 'Other License'],
                          (value) => _licenseType = value),
                      _buildDropdownField(
                          'Select State',
                          ['Maharashtra', 'Other State'],
                          (value) => _state = value),
                      _buildDropdownField('Select City', ['Pune', 'Other City'],
                          (value) => _city = value),
                      _buildTextField('Pincode', _pincodeController,
                          keyboardType: TextInputType.number),
                      _buildDateField('Campus introduced on',
                          (date) => _selectedDate = date),
                      const Divider(),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: false,
                              groupValue: false,
                              onChanged: (value) {},
                              title: const Text('Pin the location'),
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: false,
                              groupValue: true,
                              onChanged: (value) {},
                              title: const Text('Mark the location'),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          children: [
                            const Expanded(
                              flex: 2,
                              child: TextField(
                                decoration: InputDecoration(
                                  label: Text('Campus Radius'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                      bottomLeft: Radius.circular(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 18),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(12),
                                    bottomRight: Radius.circular(12),
                                  ),
                                  color: Color(0xFF1A2273),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  'Meters',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: TextField(
                          decoration: InputDecoration(
                              label: const Text('Pin Location'),
                              hintText: 'Mark a location',
                              suffixIcon: const Icon(Icons.gps_fixed),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                      ),
                      const Divider(),
                      const Text(
                        'Incase of any previous dues',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildTextField('Basic Amount', _basicAmountController,
                          keyboardType: TextInputType.number),
                      _buildTextField('Tax (if any applicable)', _taxController,
                          keyboardType: TextInputType.number),
                      const Divider(),
                      const Text(
                        'Contact person information',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      _buildTextField('Full Name', _contactNameController),
                      _buildTextField('Mobile No.', _contactMobileController,
                          keyboardType: TextInputType.phone),
                      _buildTextField('Email Id', _contactEmailController,
                          keyboardType: TextInputType.emailAddress),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900]),
                        onPressed: _submitForm,
                        child: const Text('Introduce Campus'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField(
      String label, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          DropdownButtonFormField<String>(
            items: options
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: onChanged,
            validator: (value) => value == null ? 'Please select $label' : null,
            decoration: InputDecoration(
              label: Text(label),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        ),
        validator: (value) =>
            value == null || value.isEmpty ? 'Please enter $label' : null,
      ),
    );
  }

  Widget _buildDateField(String label, Function(DateTime) onDateSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 5),
          InkWell(
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2101),
              );
              if (pickedDate != null) {
                onDateSelected(pickedDate);
                setState(() {});
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                _selectedDate != null
                    ? DateFormat('dd/MM/yyyy').format(_selectedDate!)
                    : 'Select Date',
                style: const TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Campus details submitted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields correctly.')),
      );
    }
  }
}
