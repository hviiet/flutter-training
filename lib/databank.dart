import 'package:flutter/material.dart';
import 'dart:ui';

class DataBank extends StatefulWidget {
  const DataBank({super.key});

  @override
  State<DataBank> createState() => _DataBankState();
}

class _DataBankState extends State<DataBank> {
  bool _showOverlay = false;
  bool _showToast = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _onMakeRequest() {
    setState(() {
      _showOverlay = true;
      _showToast = true;
    });

    // Tự ẩn sau 2 giây
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      setState(() {
        _showOverlay = false;
        _showToast = false;
      });
    });
  }

  void _dismissOverlay() {
    setState(() {
      _showOverlay = false;
      _showToast = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1),
      body: Stack(
        children: [
          // MAIN CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              child: Column(
                children: [
                  // Image page
                  Image.asset('assets/images/databank_img.png', height: 260),
                  const SizedBox(height: 24),
                  // Text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Request for Data',
                        style: TextStyle(
                          fontFamily: 'SF Pro Display',
                          fontWeight: FontWeight.w700,
                          fontSize: 28,
                          height: 38 / 28,
                          letterSpacing: 0.5,
                          color: Color.fromRGBO(17, 24, 39, 1),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'If you would like to download pollutant data, please place your request here. We’ll share the AQI data along with a link to the Live Emission Visualiser - Data Bank dashboard.',
                        style: TextStyle(
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 1.5,
                          letterSpacing: 0.5,
                          color: Color.fromRGBO(28, 28, 30, 0.72),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  // Form
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Input
                      Column(
                        children: [
                          // Email
                          SizedBox(
                            height: 56,
                            child: TextField(
                              style: const TextStyle(
                                fontFamily: 'ABeeZee',
                                fontSize: 14,
                                color: Color.fromRGBO(28, 28, 30, 0.96),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                ),

                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),

                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 8,
                                  ),
                                  child: Image.asset(
                                    'assets/images/sms.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 24,
                                  minHeight: 24,
                                ),

                                hintText: 'Your email',
                                hintStyle: const TextStyle(
                                  fontFamily: 'ABeeZee',
                                  fontSize: 14,
                                  color: Color.fromRGBO(28, 28, 30, 0.48),
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(28, 28, 30, 0.24),
                                    width: 1,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(24, 130, 255, 1),
                                    width: 1,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(28, 28, 30, 0.24),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Location
                          SizedBox(
                            height: 56,
                            child: TextField(
                              style: const TextStyle(
                                fontFamily: 'ABeeZee',
                                fontSize: 14,
                                color: Color.fromRGBO(28, 28, 30, 0.96),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                ),

                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),

                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 8,
                                  ),
                                  child: Image.asset(
                                    'assets/images/location.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 24,
                                  minHeight: 24,
                                ),

                                hintText: 'Your email',
                                hintStyle: const TextStyle(
                                  fontFamily: 'ABeeZee',
                                  fontSize: 14,
                                  color: Color.fromRGBO(28, 28, 30, 0.48),
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(28, 28, 30, 0.24),
                                    width: 1,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(24, 130, 255, 1),
                                    width: 1,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(28, 28, 30, 0.24),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          // Date
                          SizedBox(
                            height: 56,
                            child: TextField(
                              style: const TextStyle(
                                fontFamily: 'ABeeZee',
                                fontSize: 14,
                                color: Color.fromRGBO(28, 28, 30, 0.96),
                              ),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color.fromRGBO(
                                  255,
                                  255,
                                  255,
                                  1,
                                ),

                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),

                                prefixIcon: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 8,
                                  ),
                                  child: Image.asset(
                                    'assets/images/calendar.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                prefixIconConstraints: const BoxConstraints(
                                  minWidth: 24,
                                  minHeight: 24,
                                ),

                                suffixIcon: Padding(
                                  padding: const EdgeInsets.only(right: 16),
                                  child: Image.asset(
                                    'assets/images/arrow-down.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                ),
                                suffixIconConstraints: const BoxConstraints(
                                  minWidth: 24,
                                  minHeight: 24,
                                ),

                                hintText: 'Your email',
                                hintStyle: const TextStyle(
                                  fontFamily: 'ABeeZee',
                                  fontSize: 14,
                                  color: Color.fromRGBO(28, 28, 30, 0.48),
                                ),

                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(28, 28, 30, 0.24),
                                    width: 1,
                                  ),
                                ),

                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(24, 130, 255, 1),
                                    width: 1,
                                  ),
                                ),

                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color.fromRGBO(28, 28, 30, 0.24),
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      // Make request button
                      GestureDetector(
                        onTap: _onMakeRequest,
                        child: Container(
                          height: 56,
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(24, 130, 255, 1),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(17, 24, 39, 0.1),
                                offset: const Offset(0, 10),
                                blurRadius: 25,
                                spreadRadius: -25,
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "Make Request",
                              style: TextStyle(
                                fontFamily: 'ABeeZee',
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // ===== BLUR  =====
          if (_showOverlay) ...[
            Positioned.fill(
              child: GestureDetector(
                onTap: _dismissOverlay,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    color: const Color.fromRGBO(255, 255, 255, 0.72),
                  ),
                ),
              ),
            ),
          ],

          // ===== TOAST “Request Sent!” =====
          if (_showToast) ...[
            Positioned(
              left: 20,
              right: 20,
              bottom: 20,
              child: Container(
                height: 54,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 174, 17, 1),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        'assets/images/check.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'Request Sent!',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'ABeeZee',
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          height: 24 / 16,
                          letterSpacing: 0.15,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => setState(() => _showToast = false),
                      child: SizedBox(
                        width: 24,
                        height: 24,
                        child: Image.asset(
                          'assets/images/close.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
