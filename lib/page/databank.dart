import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/ui_overlay_provider.dart';

class DataBank extends StatelessWidget {
  const DataBank({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
      body: Stack(
        children: [
          // ===== MAIN CONTENT =====
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 16.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Image
                    Image.asset(
                      'assets/images/databank/databank_img.png',
                      height: 260,
                    ),
                    const SizedBox(height: 24),
                    // Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
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
                        SizedBox(height: 8),
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
                        SizedBox(
                          height: 56,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Your email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  'assets/images/databank/sms.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 56,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Your location',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  'assets/images/databank/location.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 56,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Date',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: Image.asset(
                                  'assets/images/databank/calendar.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Image.asset(
                                  'assets/images/databank/arrow-down.png',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        GestureDetector(
                          onTap: () {
                            context.read<UiOverlayProvider>().showBlur();
                          },
                          child: Container(
                            height: 56,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(24, 130, 255, 1),
                              borderRadius: BorderRadius.circular(12),
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
          ),
        ],
      ),
    );
  }
}
