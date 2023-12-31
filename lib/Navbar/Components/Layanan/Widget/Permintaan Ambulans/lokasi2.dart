// import 'package:dermain/Navbar/Components/Layanan/Widget/Permintaan%20Ambulans/show.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
//
// class Maps extends StatefulWidget {
//   const Maps({Key? key}) : super(key: key);
//
//   @override
//   State<Maps> createState() => _MapsState();
// }
//
// class _MapsState extends State<Maps> {
//   final MapController controller = MapController(
//     initPosition:
//         GeoPoint(latitude: -7.764445427461722, longitude: 110.3341524669497),
//   );
//
//   GeoPoint? currentLocation;
//
//   @override
//   void initState() {
//     super.initState();
//     controller.onLocationChanged.listen((location) {
//       setState(() {
//         currentLocation = location;
//       });
//     });
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         children: [
//           OSMFlutter(
//             controller: controller,
//             onGeoPointClicked: (geoPoint) async {
//               print(
//                   'latitude: ${geoPoint.latitude}, longitude: ${geoPoint.longitude}');
//             },
//             osmOption: OSMOption(
//               userTrackingOption: const UserTrackingOption(
//                 enableTracking: true,
//                 unFollowUser: false,
//               ),
//               zoomOption: const ZoomOption(
//                 initZoom: 16,
//                 minZoomLevel: 3,
//                 maxZoomLevel: 19,
//                 stepZoom: 4.0,
//               ),
//               userLocationMarker: UserLocationMaker(
//                 personMarker: const MarkerIcon(
//                   icon: Icon(
//                     Icons.location_history,
//                     color: Colors.blue,
//                     size: 50,
//                   ),
//                 ),
//                 directionArrowMarker: const MarkerIcon(
//                   icon: Icon(
//                     Icons.location_history,
//                     color: Colors.blue,
//                     size: 90,
//                   ),
//                 ),
//               ),
//               roadConfiguration: RoadOption(
//                 roadColor: Colors.yellowAccent,
//               ),
//               markerOption: MarkerOption(
//                 defaultMarker: const MarkerIcon(
//                   icon: Icon(
//                     Icons.person_pin_circle,
//                     color: Colors.red,
//                     size: 48,
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               if (currentLocation != null) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         LocationDisplayPage(location: currentLocation!),
//                   ),
//                 );
//               }
//             },
//             child: Text('Atur lokasi'),
//           ),
//         ],
//       ),
//     );
//   }
// }
