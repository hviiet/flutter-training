import 'dart:ui';
import 'package:flutter/material.dart';

class DataBankScreen extends StatefulWidget {
  const DataBankScreen({super.key});

  @override
  State<DataBankScreen> createState() => _DataBankScreenState();
}

class _DataBankScreenState extends State<DataBankScreen> {
  bool _isRequestSent = false;

  void _submitRequest() {
    setState(() {
      _isRequestSent = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _isRequestSent = false;
        });
      }
    });
  }

  void _dismissBanner() {
    setState(() {
      _isRequestSent = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Stack(
          children: [
            _buildRequestForm(),
            if (_isRequestSent) _buildSuccessOverlay(),
          ],
        ),
      ),
    );
  }

  Widget _buildRequestForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/data_bank_request.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 20),
          const Text(
            'Request for Data',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            'If you would like to download pollutant data, please place your request here. We’ll share the AQI data along with a link to the Live Emission Visualiser - Data Bank dashboard.',
            style: TextStyle(color: Colors.grey[600], fontSize: 16, height: 1.5),
          ),
          const SizedBox(height: 32),
          _buildTextField(
            initialValue: 'user@email.com',
            icon: Icons.email_outlined,
            enabled: !_isRequestSent,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            initialValue: 'Birmingham',
            icon: Icons.location_on_outlined,
            enabled: !_isRequestSent,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            hintText: 'Select Dates',
            icon: Icons.calendar_today_outlined,
            suffixIcon: Icons.arrow_drop_down,
            readOnly: true,
            enabled: !_isRequestSent,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isRequestSent ? null : _submitRequest,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Make Request',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessOverlay() {
    return Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: Stack(
            children: [
              Positioned(
                left: 24,
                right: 24,
                bottom: 10,
                child: Material(
                  elevation: 4,
                  color: const Color(0xFF28A745),
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Colors.white),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            'Request Sent!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: _dismissBanner,
                          child: const Icon(Icons.close, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    String? initialValue,
    String? hintText,
    required IconData icon,
    IconData? suffixIcon,
    bool readOnly = false,
    bool enabled = true,
  }) {
    return TextFormField(
      initialValue: initialValue,
      readOnly: readOnly,
      enabled: enabled,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}