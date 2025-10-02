import 'package:geocoding/geocoding.dart';

Future<String> getStreetFromLatLng(double lat, double lon) async {
  final placemarks = await placemarkFromCoordinates(lat, lon);
  if (placemarks.isEmpty) return '';
  final p = placemarks.first;
  return p.street ?? '';
}
