// widgets/places_carousel.dart
import 'package:flutter/material.dart';

class PlaceCardData {
  final String title;
  final String subtitle;
  final int aqi;
  final int temp;
  const PlaceCardData(this.title, this.subtitle, this.aqi, this.temp);
}

class PlacesCarouselWithIndicator extends StatefulWidget {
  const PlacesCarouselWithIndicator({super.key, required this.cards});
  final List<PlaceCardData> cards;

  @override
  State<PlacesCarouselWithIndicator> createState() =>
      _PlacesCarouselWithIndicatorState();
}

class _PlacesCarouselWithIndicatorState
    extends State<PlacesCarouselWithIndicator> {
  final _scrollCtrl = ScrollController();
  int _currentPage = 0;
  int _pageCount = 1;

  static const double _cardWidth = 240;
  static const double _spacing = 12;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollCtrl.hasClients) return;
    final viewportWidth = MediaQuery.of(context).size.width - 32;
    final totalWidth = widget.cards.length * (_cardWidth + _spacing);
    _pageCount = (totalWidth / viewportWidth).ceil();

    final page = (_scrollCtrl.offset / (_cardWidth + _spacing)).round();
    setState(() => _currentPage = page.clamp(0, _pageCount - 1));
  }

  @override
  void dispose() {
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: ListView.separated(
            controller: _scrollCtrl,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: widget.cards.length,
            separatorBuilder: (_, __) => const SizedBox(width: _spacing),
            itemBuilder: (_, i) => _PlaceMiniCard(data: widget.cards[i]),
          ),
        ),
        const SizedBox(height: 12),

        // Dot indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pageCount, (i) {
            final bool active = i == _currentPage;
            return Container(
              width: active ? 20 : 6,
              height: 6,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: active
                    ? const Color.fromRGBO(24, 130, 255, 1)
                    : const Color.fromRGBO(209, 213, 219, 1),
                borderRadius: BorderRadius.circular(100),
              ),
            );
          }),
        ),
      ],
    );
  }
}

class _PlaceMiniCard extends StatelessWidget {
  const _PlaceMiniCard({required this.data});
  final PlaceCardData data;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 88,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.06),
            offset: const Offset(0, 4),
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Edmund Street',
                    style: TextStyle(
                      fontFamily: 'ABeeZee',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      height: 16 / 12,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    'Birmingham',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      height: 10 / 8,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/images/decorate_icon.png',
                width: 16,
                height: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/normal_icon.png',
                    width: 16,
                    height: 16,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${data.aqi}',
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    'AQI',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      height: 1.0,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    '${data.temp}',
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      height: 1.0,
                      letterSpacing: -0.5,
                      color: Color.fromRGBO(0, 0, 0, 0.96),
                    ),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    '°C',
                    style: TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w300,
                      fontSize: 8,
                      height: 1.0,
                      color: Color.fromRGBO(0, 0, 0, 0.72),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Image.asset(
                    'assets/images/cold_icon.png',
                    width: 16,
                    height: 16,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
