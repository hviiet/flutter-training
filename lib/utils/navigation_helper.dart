import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_bloc.dart';
import 'package:flutter_training/bloc/location_details/location_details_event.dart';
import 'package:flutter_training/views/location_detail_page.dart';

/// Example helper to navigate to LocationDetailPage
/// 
/// Usage:
/// ```dart
/// NavigateToLocationDetail.navigate(context, 'Birmingham');
/// ```
class NavigateToLocationDetail {
  static void navigate(BuildContext context, String location) {
    // Load location details when navigating
    context.read<LocationDetailsBloc>().add(
          LoadLocationDetails(location: location),
        );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationDetailPage(location: location),
      ),
    );
  }
}
