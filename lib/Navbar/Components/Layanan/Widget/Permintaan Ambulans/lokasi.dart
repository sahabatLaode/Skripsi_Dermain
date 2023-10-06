// import 'package:flutter/material.dart';
// import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

// class Lokasi extends StatefulWidget {
//   const Lokasi({super.key});

//   @override
//   State<Lokasi> createState() => _LokasiState();
// }

// class _LokasiState extends State<Lokasi> {
//   String locationaddress = 'Pick Location';
//   double latitude = -7, longitude = 110;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Lokasi'),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 200,
//               child: Center(
//                 child: Text(locationaddress),
//               ),
//             ),
//             SizedBox(
//               height: 500,
//               child: OpenStreetMapSearchAndPick(
//                   center: LatLong(latitude, longitude),
//                   onPicked: ((pickedData) {
//                     Navigator.pop(context);
//                     setState(() {
//                       locationaddress = pickedData.address as String;
//                       latitude = pickedData.latLong.latitude;
//                       longitude = pickedData.latLong.longitude;
//                     });
//                     print(pickedData.latLong.latitude);
//                     print(pickedData.latLong.longitude);
//                     print(pickedData.address);
//                   })),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
