import 'dart:ui';

import 'package:flutter/material.dart';

class DataBankScreen extends StatefulWidget {
  const DataBankScreen({super.key});

  @override
  State<DataBankScreen> createState() => _DataBankScreenState();
}

class _DataBankScreenState extends State<DataBankScreen> {
  final TextEditingController locationController =
      TextEditingController(text: 'Birmingham');

  String selectedDate = 'Select Dates';
  bool isSending = false;
  bool isRequestSent = false;

  Future<void> selectDateRange() async {
    final result = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      initialDateRange: DateTimeRange(
        start: DateTime.now(),
        end: DateTime.now().add(const Duration(days: 7)),
      ),
    );

    if (result == null) return;

    setState(() {
      selectedDate =
          '${result.start.day}/${result.start.month}/${result.start.year}'
          ' - '
          '${result.end.day}/${result.end.month}/${result.end.year}';
    });
  }

  Future<void> submitRequest() async {
    if (locationController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your location'),
        ),
      );
      return;
    }

    setState(() {
      isSending = true;
    });

    await Future.delayed(const Duration(milliseconds: 700));

    if (!mounted) return;

    setState(() {
      isSending = false;
      isRequestSent = true;
    });

  }

  @override
  void dispose() {
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 22, 20, 24),
            children: [
          SizedBox(
            height: 190,
            child: Image.asset(
              'assets/images/request_data.png',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(
                  Icons.nature_people_rounded,
                  size: 130,
                  color: Color(0xff80d8b6),
                );
              },
            ),
          ),
          const SizedBox(height: 18),
          const Text(
            'Request for Data',
            style: TextStyle(
              color: Color(0xff141b2b),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'If you would like to download pollutant data, please place '
            'your request here. We’ll share the AQI data along with a '
            'link to the Live Emission Visualiser - Data Bank dashboard.',
            style: TextStyle(
              color: Color(0xff6f7480),
              fontSize: 14,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 22),

          TextFormField(
            initialValue: 'user@email.com',
            readOnly: true,
            decoration: _inputDecoration(
              icon: Icons.email,
              hint: 'Email',
            ),
          ),
          const SizedBox(height: 10),

          TextFormField(
            controller: locationController,
            decoration: _inputDecoration(
              icon: Icons.location_on,
              hint: 'Location',
            ),
          ),
          const SizedBox(height: 10),

          InkWell(
            onTap: selectDateRange,
            borderRadius: BorderRadius.circular(9),
            child: InputDecorator(
              decoration: _inputDecoration(
                icon: Icons.calendar_month,
                hint: '',
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      selectedDate,
                      style: TextStyle(
                        color: selectedDate == 'Select Dates'
                            ? Colors.grey
                            : const Color(0xff141b2b),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: isSending ? null : submitRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff1685ff),
                foregroundColor: Colors.white,
                disabledBackgroundColor:
                    const Color(0xff1685ff).withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9),
                ),
                elevation: 0,
              ),
              child: isSending
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : const Text(
                      'Make Request',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
            ],
          ),
          if (isRequestSent) ...[
            Positioned.fill(
              child: ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: ColoredBox(
                    color: Color(0x8CFFFFFF),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 16,
              child: Material(
                color: const Color(0xff00b814),
                borderRadius: BorderRadius.circular(8),
                elevation: 6,
                child: SizedBox(
                  height: 54,
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(Icons.check_circle, color: Colors.white),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          'Request Sent!',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isRequestSent = false;
                          });
                        },
                        icon: const Icon(Icons.close),
                        color: Colors.white,
                        iconSize: 18,
                        tooltip: 'Close',
                      ),
                      const SizedBox(width: 4),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  InputDecoration _inputDecoration({
    required IconData icon,
    required String hint,
  }) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: const Color(0xff858b94),
      ),
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 16),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Color(0xffdddddd)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(
          color: Color(0xff1685ff),
          width: 1.5,
        ),
      ),
    );
  }
}
