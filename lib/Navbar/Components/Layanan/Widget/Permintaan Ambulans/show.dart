
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class LocationDisplayPage extends StatelessWidget {
  final GeoPoint location;

  LocationDisplayPage({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lokasi Saat Ini'),
      ),
      body: Center(
        child: Text(
          'Latitude: ${location.latitude}, Longitude: ${location.longitude}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
