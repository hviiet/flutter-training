import 'package:flutter/material.dart';

import 'location_card.dart';
import '../models/weather_location.dart';

class LargeLocationsCarousel extends StatefulWidget {
  final List<WeatherLocation> locations;

  const LargeLocationsCarousel({
    super.key, 
    required this.locations, 
  });
  
  @override
  State<LargeLocationsCarousel> createState() => _LargeLocationsCarouselState();
}

class _LargeLocationsCarouselState extends State<LargeLocationsCarousel> {
  int _currentPage = 0;
  final PageController _pageController = PageController(viewportFraction: 0.75);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.locations.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 108.0,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.locations.length,
            padEnds: false,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              final location = widget.locations[index];
              return LocationCard(location: location, type: LocationCardType.large);
            },
          ),
        ),

        const SizedBox(height: 10.0),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(widget.locations.length, (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            width: index == _currentPage ? 24.0 : 6.0,
            height: 6.0,
            decoration: BoxDecoration(
              color: index == _currentPage ? const Color.fromRGBO(28, 115, 255, 1) : const Color.fromRGBO(200, 200, 200, 1),
              borderRadius: BorderRadius.circular(3.0),
            ),
          )),
        ),
      ],
    );
  }
}
