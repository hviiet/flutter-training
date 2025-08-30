// lib/components/forecast_block.dart
import 'package:flutter/material.dart';

class Forecast {
  final String day;
  final int aqi;
  final int temp;

  const Forecast({required this.day, required this.aqi, required this.temp});
}

class ForecastCarouselWithDots extends StatefulWidget {
  const ForecastCarouselWithDots({super.key, required this.forecasts});

  final List<Forecast> forecasts;

  @override
  State<ForecastCarouselWithDots> createState() =>
      _ForecastCarouselWithDotsState();
}

class _ForecastCarouselWithDotsState extends State<ForecastCarouselWithDots> {
  final _scrollCtrl = ScrollController();
  static const double _itemWidth = 56; // chiều rộng 1 thẻ nhỏ
  static const double _spacing = 8; // khoảng cách giữa thẻ
  static const double _hPad = 8; // padding ngang của list
  int _currentPage = 0;
  int _pageCount = 1;

  @override
  void initState() {
    super.initState();
    _scrollCtrl.addListener(_onScroll);
  }

  void _onScroll() {
    if (!_scrollCtrl.hasClients || !mounted) return;

    // width viewport hiện tại
    final viewportWidth = context.size?.width ?? 0;
    if (viewportWidth <= 0) return;

    // Tổng chiều rộng content (n items + spacing + padding hai bên)
    final totalWidth =
        widget.forecasts.length * (_itemWidth + _spacing) -
        _spacing +
        (_hPad * 2);

    // Số "trang ảo" = tổng chiều rộng / viewport
    final pc = (totalWidth / viewportWidth).ceil().clamp(1, 999);
    // Trang hiện tại xấp xỉ = offset / viewport
    final cp = (_scrollCtrl.offset / viewportWidth).round().clamp(0, pc - 1);

    if (pc != _pageCount || cp != _currentPage) {
      setState(() {
        _pageCount = pc;
        _currentPage = cp;
      });
    }
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_onScroll);
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Forcast', // giữ nguyên chính tả theo yêu cầu trước
          style: TextStyle(
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w500,
            fontSize: 12,
            height: 14 / 12,
            color: Color.fromRGBO(0, 0, 0, 0.72),
          ),
        ),
        const SizedBox(height: 8),

        SizedBox(
          height: 150,
          child: ListView.separated(
            controller: _scrollCtrl,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: _hPad),
            itemCount: widget.forecasts.length,
            separatorBuilder: (_, __) => const SizedBox(width: _spacing),
            itemBuilder: (context, i) {
              final f = widget.forecasts[i];
              return SizedBox(
                width: _itemWidth,
                child: _ForecastMiniCard(f: f),
              );
            },
          ),
        ),
        const SizedBox(height: 10),

        // Dot indicator (giống bạn đang dùng ở PageView)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_pageCount, (i) {
            final active = i == _currentPage;
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

// 1 thẻ nhỏ (card) cho mỗi ngày: nền trắng + shadow nhẹ
class _ForecastMiniCard extends StatelessWidget {
  const _ForecastMiniCard({required this.f});
  final Forecast f;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          // 0px 2px 8px rgba(0,0,0,0.04)
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.04),
            offset: const Offset(0, 2),
            blurRadius: 8,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            f.day,
            style: const TextStyle(
              fontFamily: 'ABeeZee',
              fontWeight: FontWeight.w400,
              fontSize: 8,
              height: 1.0,
              color: Color.fromRGBO(0, 0, 0, 0.72),
            ),
          ),
          const SizedBox(height: 6),

          // AQI
          Column(
            children: [
              Image.asset('assets/images/icon.png', width: 24, height: 24),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  // số AQI
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${f.aqi}',
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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
            ],
          ),
          const SizedBox(height: 6),

          const SizedBox(
            width: 32,
            child: Divider(
              color: Color.fromRGBO(0, 0, 0, 0.08),
              thickness: 1,
              height: 1,
            ),
          ),
          const SizedBox(height: 6),

          // Temp
          Column(
            children: [
              Image.asset(
                'assets/images/weather-icons.png',
                width: 24,
                height: 24,
              ),
              const SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${f.temp}',
                    style: const TextStyle(
                      fontFamily: 'SF Pro Display',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
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
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
