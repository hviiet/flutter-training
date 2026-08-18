import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/location/location_cubit.dart';
import '../models/air_quality.dart';
import '../models/weather.dart';
import 'aqi_scale_screen.dart';

class LocationDetailScreen extends StatefulWidget {
  const LocationDetailScreen({super.key});

  @override
  State<LocationDetailScreen> createState() => _LocationDetailScreenState();
}

class _LocationDetailScreenState extends State<LocationDetailScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<LocationCubit>().loadLocation('Birmingham');
      }
    });
  }

  void _refresh() {
    context.read<LocationCubit>().refreshLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Align(
          alignment: Alignment.centerRight,
          child: Text(
          'Current Location',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
          ),
        ),
      ),
        actions: [
          IconButton(
          onPressed: _refresh,
          icon: const Icon(Icons.refresh),
        ),
      ],
  ),
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state.details == null) {
            if (state.status == LocationStatus.failure) {
              return _ErrorView(message: state.error ?? 'Không có dữ liệu', onRetry: _refresh);
            }
            return const Center(child: CircularProgressIndicator());
          }

          final details = state.details!;
          return Stack(
            children: [
              ListView(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 32),
                children: [
                  _LocationCard(weather: details.weather),
                  const SizedBox(height: 12),
                  _AirQualityCard(air: details.airQuality),
                  const SizedBox(height: 12),
                  _WeatherCard(weather: details.weather),
                  const SizedBox(height: 12),
                  _AqForecastCard(values: details.airQuality.forecast),
                  const SizedBox(height: 12),
                  _WeatherForecastCard(days: details.weather.forecast),
                  const SizedBox(height: 20),
                  const Text('Recommendations', style: TextStyle(fontSize: 16, color: Color(0xff555555))),
                  const SizedBox(height: 10),
                  const _Recommendations(),
                ],
              ),
              if (state.status == LocationStatus.loading)
                const LinearProgressIndicator(minHeight: 2),
            ],
          );
        },
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final Widget child;
  const _Section({required this.child});
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: .025), blurRadius: 14)],
        ),
        child: child,
      );
}

class _LocationCard extends StatelessWidget {
  final Weather weather;
  const _LocationCard({required this.weather});
  @override
  Widget build(BuildContext context) => _Section(
        child: Row(
          children: [
            const Icon(Icons.my_location, color: Color(0xff237cff)),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(weather.locationName, style: const TextStyle(fontWeight: FontWeight.w700)),
              Text(weather.region, style: const TextStyle(fontSize: 12, color: Colors.grey)),
            ])),
            Text('${weather.temperature.round()}°', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
          ],
        ),
      );
}

class _AirQualityCard extends StatelessWidget {
  final AirQuality air;
  const _AirQualityCard({required this.air});
  @override
  Widget build(BuildContext context) => InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AqiScaleScreen())),
        child: _Section(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Air Quality', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              Icon(Icons.info, size: 18, color: Color(0xff237cff)),
            ]),
            const SizedBox(height: 12),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('${air.aqi}', style: TextStyle(fontSize: 42, fontWeight: FontWeight.w800, color: _aqiColor(air.aqi))),
              const SizedBox(width: 8),
              Text(_aqiLabel(air.aqi), style: TextStyle(fontWeight: FontWeight.w700, color: _aqiColor(air.aqi))),
            ]),
            const SizedBox(height: 18),
            Wrap(spacing: 8, runSpacing: 14, alignment: WrapAlignment.spaceBetween, children: [
              _Pollutant('CO', air.co), _Pollutant('PM10', air.pm10), _Pollutant('NO₂', air.no2),
              _Pollutant('PM2.5', air.pm25), _Pollutant('O₃', air.o3), _Pollutant('SO₂', air.so2),
            ]),
          ]),
        ),
      );
}

class _Pollutant extends StatelessWidget {
  final String label; final double value;
  const _Pollutant(this.label, this.value);
  @override
  Widget build(BuildContext context) => SizedBox(width: 82, child: Column(children: [
    Text(label, style: const TextStyle(fontSize: 11, color: Colors.grey)),
    Text(value.toStringAsFixed(1), style: const TextStyle(fontWeight: FontWeight.w700)),
    const Text('µg/m³', style: TextStyle(fontSize: 9, color: Colors.grey)),
  ]));
}

class _WeatherCard extends StatelessWidget {
  final Weather weather;
  const _WeatherCard({required this.weather});
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final upcoming = weather.hourlyForecast.where((h) {
      final time = DateTime.tryParse(h.time);
      return time == null || time.hour >= now.hour;
    }).take(8).toList();
    final hours = upcoming.isEmpty ? weather.hourlyForecast.take(8).toList() : upcoming;

    return _Section(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text('Weather', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
      const SizedBox(height: 14),
      Row(children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text('NOW', style: TextStyle(fontSize: 11, letterSpacing: 1.2, color: Colors.grey)),
          Text(weather.condition, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          Text('Feels like ${weather.feelsLike.round()}°C', style: const TextStyle(fontSize: 11, color: Colors.grey)),
        ])),
        Text('${weather.temperature.round()}°', style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
        const Text('C', style: TextStyle(fontSize: 11, color: Colors.grey)),
        Image.network(weather.iconUrl, width: 50, errorBuilder: (_, __, ___) => const Icon(Icons.cloud, color: Color(0xff536dfe), size: 38)),
      ]),
      const SizedBox(height: 16),
      SizedBox(height: 82, child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: hours.length,
        separatorBuilder: (_, __) => const SizedBox(width: 8),
        itemBuilder: (_, index) => _HourTile(hour: hours[index]),
      )),
      const SizedBox(height: 12),
      const _Dots(),
    ]));
  }
}

class _HourTile extends StatelessWidget {
  final WeatherHour hour;
  const _HourTile({required this.hour});
  @override
  Widget build(BuildContext context) {
    final time = hour.time.length >= 16 ? hour.time.substring(11, 16) : hour.time;
    return Container(width: 58, padding: const EdgeInsets.symmetric(vertical: 7), decoration: BoxDecoration(color: const Color(0xfffbfbfc), borderRadius: BorderRadius.circular(10)), child: Column(children: [
      Image.network(hour.iconUrl, width: 28, height: 28, errorBuilder: (_, __, ___) => const Icon(Icons.cloud_outlined, size: 24, color: Color(0xff536dfe))),
      Text('${hour.temperature.round()}°', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
      Text(time, style: const TextStyle(fontSize: 9, color: Colors.grey)),
    ]));
  }
}

class _AqForecastCard extends StatelessWidget {
  final List<int> values;
  const _AqForecastCard({required this.values});
  @override
  Widget build(BuildContext context) {
    final shown = values.isEmpty ? const [32, 55, 72, 44, 36, 81, 29] : values.take(7).toList();
    final maxValue = shown
        .reduce((a, b) => a > b ? a : b)
        .clamp(1, 500)
        .toDouble();
    return _Section(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('AQ Forecast', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)), Text('Next 7 days', style: TextStyle(fontSize: 11, color: Colors.grey))]),
        TextButton.icon(onPressed: () {}, label: const Text('AQI', style: TextStyle(fontWeight: FontWeight.w700)), iconAlignment: IconAlignment.end, icon: const Icon(Icons.arrow_drop_down)),
      ]),
      const SizedBox(height: 12),
      SizedBox(height: 145, child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: List.generate(shown.length, (index) {
        final value = shown[index];
        final height = 35.0 + (value / maxValue) * 72.0;
        return Expanded(child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          Container(width: 31, height: height, alignment: Alignment.topCenter, decoration: BoxDecoration(color: _aqiColor(value).withValues(alpha: .22), borderRadius: const BorderRadius.vertical(top: Radius.circular(18))), child: Container(width: 31, height: 31, alignment: Alignment.center, decoration: BoxDecoration(color: _aqiColor(value), shape: BoxShape.circle), child: Text('$value', style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700)))),
          const SizedBox(height: 7), Text(_weekday(index), style: const TextStyle(fontSize: 10, color: Colors.grey)),
        ]));
      }))),
    ]));
  }
}

class _WeatherForecastCard extends StatelessWidget {
  final List<WeatherDay> days;
  const _WeatherForecastCard({required this.days});
  @override
  Widget build(BuildContext context) => _Section(child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    const Text('Weather Forecast', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
    const Text('Next 7 days', style: TextStyle(fontSize: 11, color: Colors.grey)),
    const SizedBox(height: 14),
    ...days.take(7).toList().asMap().entries.map((entry) => Container(
      margin: const EdgeInsets.only(bottom: 7),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 8
        ),
      decoration: BoxDecoration(
        color: const Color(0xfffbfbfc),
        borderRadius: BorderRadius.circular(9),
        boxShadow: [BoxShadow(
          color: Colors.black.withValues(alpha: .025),
           blurRadius: 7
           )
          ],
        ),
      child: Row(children: [
        Expanded(child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(_dateLabel(entry.value.date),
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600
            ),
            ),
           if (entry.key < 2) Text(entry.key == 0 ? 'TODAY' : 'TOMORROW', style: const TextStyle(fontSize: 8, letterSpacing: 1.2, color: Colors.grey))])),
        Text(
          '${entry.value.maxTemp.round()}°',
           style: const TextStyle(fontSize: 16)),
           const Text(
            ' ↑ ',
           style: TextStyle(
            fontSize: 10,
            color: Colors.green
            ),
            ),
        Text('${entry.value.minTemp.round()}°', style: const TextStyle(fontSize: 16)), const Text(' ↓', style: TextStyle(fontSize: 10, color: Colors.red)),
        const SizedBox(width: 6), Image.network(entry.value.iconUrl, width: 27, height: 27, errorBuilder: (_, __, ___) => const Icon(Icons.cloud_outlined, size: 22, color: Color(0xff536dfe))),
      ]),
    )),
  ]));
}

class _Recommendations extends StatelessWidget {
  const _Recommendations();
  @override
  Widget build(BuildContext context) => SizedBox(height: 85, child: ListView(scrollDirection: Axis.horizontal, children: const [
    _Recommendation(title: 'General', text: 'With this level of air quality, you have no limitations. Enjoy the outdoors.'),
    SizedBox(width: 10),
    _Recommendation(title: 'Asthma', text: 'If you start to feel respiratory symptoms, reduce outdoor activity.'),
  ]));
}

class _Recommendation extends StatelessWidget {
  final String title, text;
  const _Recommendation({required this.title, required this.text});
  @override
  Widget build(BuildContext context) => Container(width: 210, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
    const Icon(Icons.sentiment_satisfied_alt, color: Color(0xff20c122), size: 18), const SizedBox(width: 8),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w600)), const SizedBox(height: 4), Text(text, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 9, color: Colors.grey))])),
  ]));
}

class _Dots extends StatelessWidget {
  const _Dots();
  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
    Container(width: 20, height: 5, decoration: BoxDecoration(color: const Color(0xff1685ff), borderRadius: BorderRadius.circular(5))),
    ...List.generate(3, (_) => Container(margin: const EdgeInsets.only(left: 4), width: 6, height: 6, decoration: const BoxDecoration(color: Color(0xffd9dde5), shape: BoxShape.circle))),
  ]);
}

class _ErrorView extends StatelessWidget {
  final String message; final VoidCallback onRetry;
  const _ErrorView({required this.message, required this.onRetry});
  @override
  Widget build(BuildContext context) => Center(child: Padding(padding: const EdgeInsets.all(24), child: Column(mainAxisSize: MainAxisSize.min, children: [
    const Icon(Icons.cloud_off, size: 48, color: Colors.grey), const SizedBox(height: 12), Text(message, textAlign: TextAlign.center), const SizedBox(height: 12), FilledButton(onPressed: onRetry, child: const Text('Thử lại')),
  ])));
}

String _weekday(int offset) {
  const labels = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
  return labels[(DateTime.now().weekday - 1 + offset) % 7];
}

String _dateLabel(String raw) {
  final date = DateTime.tryParse(raw);
  if (date == null) return raw;
  return '${_weekday(date.weekday - DateTime.now().weekday)} ${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year.toString().substring(2)}';
}

Color _aqiColor(int value) {
  if (value <= 50) return const Color(0xff00c968);
  if (value <= 100) return const Color(0xffffa348);
  if (value <= 150) return const Color(0xffff6b3d);
  if (value <= 200) return const Color(0xffef4444);
  if (value <= 300) return const Color(0xffa855f7);
  return const Color(0xff7e0023);
}

String _aqiLabel(int value) {
  if (value <= 50) return 'Good';
  if (value <= 100) return 'Moderate';
  if (value <= 150) return 'Sensitive';
  if (value <= 200) return 'Unhealthy';
  if (value <= 300) return 'Very Unhealthy';
  return 'Hazardous';
}
