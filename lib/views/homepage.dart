import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_event.dart';
import 'package:flutter_training/components/current_state.dart';
import 'package:flutter_training/components/location_slider.dart';
import 'package:flutter_training/components/place_add.dart';
import 'package:flutter_training/models/place_info.dart';
import 'package:flutter_training/models/location.dart';
import 'package:flutter_training/utils/navigation_helper.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  final String? selectedCity;
  
  const HomeScreen({super.key, this.selectedCity});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late LocationDetailsBloc _locationBloc;
  String _currentCity = 'Birmingham'; // Default city
  bool _hasLoadedData = false; // Track if we've loaded data for this instance

  @override
  void initState() {
    super.initState();
    _locationBloc = context.read<LocationDetailsBloc>();
    
    // Use selected city from databank or default
    if (widget.selectedCity != null && widget.selectedCity!.isNotEmpty) {
      _currentCity = widget.selectedCity!;
      debugPrint('🌍 HomeScreen: Loading city from databank: $_currentCity');
    } else {
      debugPrint('🌍 HomeScreen: Using default city: $_currentCity');
    }
    
    // Only load if we haven't loaded data yet
    if (!_hasLoadedData) {
      _loadDataIfNeeded();
    }
  }

  void _loadDataIfNeeded() {
    final currentState = _locationBloc.state;
    
    if (currentState is LocationDetailsInitial) {
      debugPrint('🔄 HomeScreen: No data yet, loading $_currentCity');
      _locationBloc.add(LoadLocationDetails(location: _currentCity));
      _hasLoadedData = true;
    } else if (currentState is LocationDetailsLoaded) {
      // Check if loaded data is for different city
      if (currentState.weatherData.location.toLowerCase() != _currentCity.toLowerCase()) {
        debugPrint('🔄 HomeScreen: City changed, loading $_currentCity');
        _locationBloc.add(LoadLocationDetails(location: _currentCity));
        _hasLoadedData = true;
      } else {
        debugPrint('✅ HomeScreen: Using existing data for $_currentCity');
        _hasLoadedData = true;
      }
    } else if (currentState is LocationDetailsError) {
      debugPrint('⚠️ HomeScreen: Previous error, retrying $_currentCity');
      _locationBloc.add(LoadLocationDetails(location: _currentCity));
      _hasLoadedData = true;
    }
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If city changed, reload data
    if (widget.selectedCity != null && 
        widget.selectedCity != oldWidget.selectedCity &&
        widget.selectedCity != _currentCity) {
      _currentCity = widget.selectedCity!;
      debugPrint('🌍 HomeScreen: City updated to: $_currentCity');
      _locationBloc.add(LoadLocationDetails(location: _currentCity));
    }
  }

  @override
  Widget build(BuildContext context) {
    final addPlaces = [
      PlaceInfo(
        title: 'Work',
        address: 'Coventry ST, Birmingham',
        aqi: 6,  // Moderate (4-6)
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 25,
      ),
      PlaceInfo(
        title: 'Home',
        address: 'Coventry ST, Birmingham',
        aqi: 4,  // Moderate (4-6)
        aqiIcon: Icons.sentiment_satisfied,
        weatherIcon: Icons.cloud,
        temp: 22,
      ),
    ];

    final locations = [
      Location(
        title: 'Edmund Street',
        address: 'Birmingham',
        aqi: 9,  // Very High (9-10)
        aqiIcon: Icons.sentiment_satisfied,
        temp: 21,
        weatherIcon: Icons.ac_unit,
        trailingIcon: Icons.wallet,
      ),
      Location(
        title: 'Berkley Street',
        address: 'Birmingham',
        aqi: 7,  // High (7-8)
        aqiIcon: Icons.sentiment_satisfied,
        temp: 20,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Welcome Back 👋',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<LocationDetailsBloc, LocationDetailsState>(
        bloc: _locationBloc,
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                const Text(
                  'Anamoul',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                
                // Current State with real API data
                _buildCurrentState(state),
                
                const SizedBox(height: 16),
                AddPlaces(places: addPlaces),
                const SizedBox(height: 16),
                LocationsSlider(locations: locations),
                const SizedBox(height: 16),
                
                // Detail button - navigate to location detail page
                Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.info_outline, color: Colors.blue),
                    title: const Text('Detail Air Quality'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      NavigateToLocationDetail.navigate(context, _currentCity);
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCurrentState(LocationDetailsState state) {
    if (state is LocationDetailsLoading) {
      return const Card(
        elevation: 2,
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    if (state is LocationDetailsError) {
      return Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 48),
              const SizedBox(height: 8),
              Text(
                'Error: ${state.message}',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  _locationBloc.add(LoadLocationDetails(location: _currentCity));
                },
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      );
    }

    if (state is LocationDetailsLoaded) {
      final weather = state.weatherData;
      final current = weather.current;
      final airQuality = current.airQuality;
      final aqi = airQuality?.aqi ?? 4;  // Use AQI 1-10 scale, default to 4 (moderate)
      
      // Convert forecast data
      final forecastDays = weather.forecast.take(6).map((day) {
        // Use real AQI from forecast day API data
        final dayAqi = day.airQuality?.aqi ?? aqi; // Use day's AQI or fallback to current
        final avgTemp = ((day.maxTempC + day.minTempC) / 2).toInt();
        
        return ForecastDay(
          day: DateFormat('EEE').format(day.date).toUpperCase(),
          aqi: dayAqi,
          aqiIcon: _getAqiIcon(dayAqi),
          weatherIcon: _getWeatherIcon(day.condition),
          temp: avgTemp,
        );
      }).toList();

      return CurrentState(
        location: weather.location,
        city: weather.region,
        temperature: '${current.tempC.toInt()}°C',
        weather: current.condition,
        feelsLike: '${current.feelsLikeC.toInt()}°C',
        aqi: aqi,
        weatherIcon: _getWeatherIcon(current.condition),
        aqiIcon: _getAqiIcon(aqi),
        forecast: forecastDays,
      );
    }

    // Default fallback (shouldn't reach here)
    return const SizedBox.shrink();
  }

  IconData _getAqiIcon(int aqi) {
    // AQI scale 1-10
    if (aqi <= 3) return Icons.sentiment_very_satisfied;  // Low: 1-3
    if (aqi <= 6) return Icons.sentiment_satisfied;       // Moderate: 4-6
    if (aqi <= 8) return Icons.sentiment_neutral;         // High: 7-8
    return Icons.sentiment_very_dissatisfied;             // Very High: 9-10
  }

  IconData _getWeatherIcon(String condition) {
    final lowerCondition = condition.toLowerCase();
    if (lowerCondition.contains('rain') || lowerCondition.contains('shower')) {
      return Icons.water_drop;
    } else if (lowerCondition.contains('cloud')) {
      return Icons.cloud;
    } else if (lowerCondition.contains('sun') || lowerCondition.contains('clear')) {
      return Icons.wb_sunny;
    } else if (lowerCondition.contains('snow')) {
      return Icons.ac_unit;
    } else {
      return Icons.wb_cloudy;
    }
  }
}
