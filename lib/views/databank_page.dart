import 'package:flutter/material.dart';

class DataBankScreen extends StatefulWidget {
  const DataBankScreen({super.key});

  @override
  State<DataBankScreen> createState() => _DataBankScreenState();
}

class _DataBankScreenState extends State<DataBankScreen> {
  final TextEditingController emailController = TextEditingController();
  DateTime? selectedDate;
  bool requestSent = false;
  String? selectedCity;

  // Popular cities from Weather API (supports 1M+ locations worldwide)
  final List<Map<String, String>> cities = [
    {'name': 'London', 'country': '🇬🇧 UK'},
    {'name': 'Birmingham', 'country': '🇬🇧 UK'},
    {'name': 'Manchester', 'country': '🇬🇧 UK'},
    {'name': 'Edinburgh', 'country': '🇬🇧 Scotland'},
    {'name': 'Paris', 'country': '🇫🇷 France'},
    {'name': 'Berlin', 'country': '🇩🇪 Germany'},
    {'name': 'Munich', 'country': '🇩🇪 Germany'},
    {'name': 'Madrid', 'country': '🇪🇸 Spain'},
    {'name': 'Barcelona', 'country': '🇪🇸 Spain'},
    {'name': 'Rome', 'country': '🇮🇹 Italy'},
    {'name': 'Milan', 'country': '🇮🇹 Italy'},
    {'name': 'Amsterdam', 'country': '🇳🇱 Netherlands'},
    {'name': 'Brussels', 'country': '🇧🇪 Belgium'},
    {'name': 'Vienna', 'country': '🇦🇹 Austria'},
    {'name': 'Prague', 'country': '🇨🇿 Czech Republic'},
    {'name': 'Warsaw', 'country': '🇵🇱 Poland'},
    {'name': 'Stockholm', 'country': '🇸🇪 Sweden'},
    {'name': 'Copenhagen', 'country': '🇩🇰 Denmark'},
    {'name': 'Oslo', 'country': '🇳🇴 Norway'},
    {'name': 'Helsinki', 'country': '🇫🇮 Finland'},
    {'name': 'New York', 'country': '🇺🇸 USA'},
    {'name': 'Los Angeles', 'country': '🇺🇸 USA'},
    {'name': 'Chicago', 'country': '🇺🇸 USA'},
    {'name': 'San Francisco', 'country': '🇺🇸 USA'},
    {'name': 'Seattle', 'country': '🇺🇸 USA'},
    {'name': 'Boston', 'country': '🇺🇸 USA'},
    {'name': 'Washington DC', 'country': '🇺🇸 USA'},
    {'name': 'Toronto', 'country': '🇨🇦 Canada'},
    {'name': 'Vancouver', 'country': '🇨🇦 Canada'},
    {'name': 'Montreal', 'country': '🇨🇦 Canada'},
    {'name': 'Sydney', 'country': '🇦🇺 Australia'},
    {'name': 'Melbourne', 'country': '🇦🇺 Australia'},
    {'name': 'Brisbane', 'country': '🇦🇺 Australia'},
    {'name': 'Auckland', 'country': '🇳🇿 New Zealand'},
    {'name': 'Tokyo', 'country': '🇯🇵 Japan'},
    {'name': 'Osaka', 'country': '🇯🇵 Japan'},
    {'name': 'Seoul', 'country': '🇰🇷 South Korea'},
    {'name': 'Beijing', 'country': '🇨🇳 China'},
    {'name': 'Shanghai', 'country': '🇨🇳 China'},
    {'name': 'Hong Kong', 'country': '🇭🇰 Hong Kong'},
    {'name': 'Singapore', 'country': '🇸🇬 Singapore'},
    {'name': 'Bangkok', 'country': '🇹🇭 Thailand'},
    {'name': 'Kuala Lumpur', 'country': '🇲🇾 Malaysia'},
    {'name': 'Jakarta', 'country': '🇮🇩 Indonesia'},
    {'name': 'Manila', 'country': '🇵🇭 Philippines'},
    {'name': 'Hanoi', 'country': '🇻🇳 Vietnam'},
    {'name': 'Ho Chi Minh', 'country': '🇻🇳 Vietnam'},
    {'name': 'Mumbai', 'country': '🇮🇳 India'},
    {'name': 'Delhi', 'country': '🇮🇳 India'},
    {'name': 'Bangalore', 'country': '🇮🇳 India'},
    {'name': 'Dubai', 'country': '🇦🇪 UAE'},
    {'name': 'Abu Dhabi', 'country': '🇦🇪 UAE'},
    {'name': 'Istanbul', 'country': '🇹🇷 Turkey'},
    {'name': 'Cairo', 'country': '🇪🇬 Egypt'},
    {'name': 'Johannesburg', 'country': '🇿🇦 South Africa'},
    {'name': 'Cape Town', 'country': '🇿🇦 South Africa'},
    {'name': 'São Paulo', 'country': '🇧🇷 Brazil'},
    {'name': 'Rio de Janeiro', 'country': '🇧🇷 Brazil'},
    {'name': 'Buenos Aires', 'country': '🇦🇷 Argentina'},
    {'name': 'Mexico City', 'country': '🇲🇽 Mexico'},
  ];

  
  void _pickDate(BuildContext context) {
  showDatePicker(
    context: context,
    initialDate: DateTime.now(),             
    firstDate: DateTime(2024, 1, 1),        
    lastDate: DateTime(2026, 12, 31),       
  ).then((value) {
    if (value != null) {
      setState(() {
        selectedDate = value;
      });
    }
  });
}

  void _makeRequest() {
    // Validate city selection
    if (selectedCity == null || selectedCity!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a city'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      requestSent = true;
    });
    
    // Navigate to homepage after showing success message
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        // Navigate to home with the city name
        Navigator.of(context).popUntil((route) => route.isFirst);
        Navigator.of(context).pushReplacementNamed(
          '/main',
          arguments: selectedCity!,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Bank'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/databank/databank.png', height: 160),
                  const SizedBox(height: 16),
                  const Text(
                    'Request for Data',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'If you would like to download pollutant data, please place your request here. We\'ll share the AQI data along with a link to the Live Emission Visualiser - Data Bank dashboard.',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.mail_outline),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // City Dropdown
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedCity,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.location_on_outlined),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 16,
                        ),
                        hintText: 'Select City',
                      ),
                      isExpanded: true,
                      items: cities.map((city) {
                        return DropdownMenuItem<String>(
                          value: city['name'],
                          child: Text(
                            '${city['name']} ${city['country']}',
                            overflow: TextOverflow.ellipsis,
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCity = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 12),
                  GestureDetector(
                    onTap: () => _pickDate(context),
                    child: AbsorbPointer(
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.calendar_today_outlined),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintText: selectedDate == null
                              ? 'Select Dates'
                              : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                          suffixIcon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: requestSent ? null : _makeRequest,
                      child: const Text(
                        'Make Request',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (requestSent)
            Positioned.fill(
              child: Container(
                color: Colors.white.withOpacity(0.8),
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.check_circle, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Request Sent!',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
