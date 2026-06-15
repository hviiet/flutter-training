import 'dart:ui';

import 'package:flutter/material.dart';
import '../widgets/app_text_field.dart';

class DataBankScreen extends StatefulWidget {
  const DataBankScreen({super.key});

  @override
  State<DataBankScreen> createState() => _DataBankScreenState();
}

class _DataBankScreenState extends State<DataBankScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  String selectedDateTime = 'Select Dates';
  bool _isSubmitting = false;

  @override
  void dispose() {
    emailController.dispose();
    locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double screenWidth = constraints.maxWidth;
        final double imageHeight = (screenWidth * 0.72).clamp(270, 300);

        return Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
              physics: const ClampingScrollPhysics(),

              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 42, // Account for padding
                ),

                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/images/data_bank.png',
                            width: screenWidth * 0.72,
                            height: imageHeight,
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 24),

                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Request for Data',       
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(15, 22, 35, 1),
                      ),
                    ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'If you would like to download pollutant data, please place your request here. '
                      'We’ll share the AQI data along with a link to the Live Emission Visualiser - '
                      'Data Bank dashboard.',

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(78, 78, 78, 1),
                      ),
                    ),

                    const SizedBox(height: 30),

                    AppTextField(
                      controller: emailController,
                      hintText: 'Email Address',
                      prefixIcon: Icons.email_outlined,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 8),

                    AppTextField(
                      controller: locationController,
                      hintText: 'Location',
                      prefixIcon: Icons.location_on_outlined,
                    ),

                    const SizedBox(height: 8),

                    AppTextField(
                      hintText: selectedDateTime,
                      prefixIcon: Icons.calendar_month_outlined,
                      readOnly: true,
                      onTap: _selectDateTime,
                      suffixIcon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                      
                    ),

                    const SizedBox(height: 24),

                    Container(
                      width: double.infinity,
                      height: 54,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(13, 125, 246, 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ElevatedButton(
                        onPressed: _submitRequest,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(30, 136, 255, 1),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        child: const Text(
                          'Make Request',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),
            ),

            Visibility(
              visible: _isSubmitting,
              child: Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    color: const Color.fromARGB(127, 255, 255, 255),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDateTime() async {
    final DateTime now = DateTime.now();

    final DateTimeRange? pickedDateRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 1),

      initialDateRange: DateTimeRange(
        start: now,
        end: now.add(const Duration(days: 7)),
      ),
    );

    if (pickedDateRange != null) {
      setState(() {
        selectedDateTime = '${pickedDateRange.start.day}/${pickedDateRange.start.month}/${pickedDateRange.start.year} - '
                           '${pickedDateRange.end.day}/${pickedDateRange.end.month}/${pickedDateRange.end.year}';
      });
    }
  }

  void _resetForm() {
    setState(() {
      emailController.clear();
      locationController.clear();
      selectedDateTime = 'Select Dates';
    });
  }

  Future<void> _submitRequest() async {
    if (emailController.text.isEmpty || locationController.text.isEmpty || selectedDateTime == 'Select Dates') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    setState(() => _isSubmitting = true);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(        
        duration: const Duration(seconds: 4),
        behavior: SnackBarBehavior.floating,        
        backgroundColor: const Color.fromRGBO(0, 190, 25, 1),        
        margin: const EdgeInsets.fromLTRB(24, 0, 24, 18),        
        shape: RoundedRectangleBorder(          
          borderRadius: BorderRadius.circular(10),        
        ),        
        content: const Row(          
          children: [            
            Icon(Icons.check_circle_outline, color: Colors.white),            
            SizedBox(width: 12),            
            Text(                
              'Request Sent',                
              style: TextStyle(color: Colors.white),              
            ),
          ],        
        ),  
      ),
    );

    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() => _isSubmitting = false);
    

    _resetForm();
  }
}