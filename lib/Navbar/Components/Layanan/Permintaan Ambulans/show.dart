// import 'package:dermain/Reusable%20Components/Button/tombol_primer.dart';
// import 'package:dermain/route_animation.dart';
// import 'package:flutter/material.dart';
// import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

// class LocationDisplayPage extends StatefulWidget {
//   const LocationDisplayPage({super.key});

//   @override
//   State<LocationDisplayPage> createState() => _LocationDisplayPageState();
// }

// class _LocationDisplayPageState extends State<LocationDisplayPage> {
//   String address = '';
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             SizedBox(
//               height: 100,
//               child: Center(
//                 child: Text(address),
//               ),
//             ),
//             SizedBox(
//               height: 600,
//               child: OpenStreetMapSearchAndPick(
//                 buttonColor: Colors.blue,
//                 buttonText: 'Pilih lokasi',
//                 onPicked: (pickedData) {
//                   setState(() {
//                     address = pickedData.addressName;
//                   });
//                   print(pickedData.latLong.latitude);
//                   print(pickedData.latLong.longitude);
//                   print(pickedData.address);
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
//               child: TombolPrimer(
//                   title: 'Simpan lokasi',
//                   ditekan: () {
//                     Navigator.of(context).push(permintaanAmbulan());
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
