import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;
  final String name;

  const HomePage({super.key, this.email = '', this.name = ''});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[100],
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome Back 👋",
                style: TextStyle(fontSize: 14, color: Colors.black54)),
            Text(
              widget.name.isNotEmpty ? widget.name : widget.email,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black87),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),

      // BODY
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // WEATHER CARD
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          "Church Street Square, Birmingham",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("19°",
                                style: TextStyle(
                                    fontSize: 42, fontWeight: FontWeight.bold)),
                            Text("Rain Shower • Feels like 17°",
                                style: TextStyle(fontSize: 13)),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 6, horizontal: 12),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: const Text("3 AQI",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Forecast row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        final days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
                        final temps = ["20°", "21°", "22°", "21°", "20°","20°"];
                        return Column(
                          children: [
                            Text(days[index],
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.black)),
                            const SizedBox(height: 8),
                            const Icon(Icons.wb_sunny,
                                size: 28, color: Colors.orange),
                            const SizedBox(height: 8),
                            Text(temps[index],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold)),
                          ],
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            // WORK + HOME
            Row(
              children: [
                Expanded(
                  child: _buildPlaceCard(
                      title: "Work",
                      subtitle: "Coventry ST, Birmingham",
                      info: "3 AQI               25°"),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildPlaceCard(
                      title: "Home",
                      subtitle: "Coventry ST, Birmingham",
                      info: "2 AQI               22°"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // EDMUND + BERKLEY
            Row(
              children: [
                Expanded(
                  child: _buildPlaceCard(
                      title: "Edmund Street",
                      subtitle: "Birmingham",
                      info: "5 AQI             21°"),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: _buildPlaceCard(
                      title: "Berkley Street",
                      subtitle: "Birmingham",
                      info: "4 AQI            20°"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // DETAIL AIR QUALITY
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: ListTile(
                title: const Text("Detail Air Quality"),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                 
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget con tái sử dụng cho các địa điểm
  Widget _buildPlaceCard(
      {required String title,
      required String subtitle,
      required String info}) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(subtitle,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(height: 6),
            Text(info,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
