// import 'package:dropdown_search/dropdown_search.dart';
import 'package:dermain/Methods/ambulan_method.dart';
import 'package:dermain/Providers/ambulans_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

List<String> kg = <String>['1-30kg', '31-60kg', '61-90kg', '>90kg'];
List<String> level = <String>['Ringan', 'Sedang', 'Berat'];
List<String> jam = <String>[
  'Pukul 06.00-08.00 WIB',
  'Pukul 08.00-10.00 WIB',
  'Pukul 10.00-12.00 WIB',
  'Pukul 13.00-15.00 WIB',
  'Pukul 16.00-18.00 WIB',
  'Pukul 19.00-21.00 WIB'
];

class PermintaanAmbulan extends StatefulWidget {
  const PermintaanAmbulan({super.key});

  @override
  State<PermintaanAmbulan> createState() => _PermintaanAmbulanState();
}



class _PermintaanAmbulanState extends State<PermintaanAmbulan> {
  final namaPemesan = TextEditingController();
  final namaPasien = TextEditingController();
  final beratBadan = TextEditingController();
  final levelDarurat = TextEditingController();
  final tanggal = TextEditingController();
  final pukul = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String lokasi='';
  String dropdownBerat = kg.first;
  String dropdownValue = level.first;
  String dropdownPukul = jam.first;

  DateTime selectDate = DateTime.now();


  void _addAmbulan() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await AmbulanMethod.addAmbulan(
      namaPemesan.text,
      namaPasien.text,
      beratBadan.text,
      levelDarurat.text,
      tanggal.text,
      pukul.text,
      lokasi,


    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(ambulansProvider.notifier)
          .addAmbulan(await AmbulanMethod.loadAllAmbulan());
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Ambulans successfully added')));
    }
  }

  bool isShowPasswordError = false;
  bool isLoading = false;



  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  _getCurrentLocation() async{
    PermissionStatus permission = await Permission.location.status;

    if (permission != PermissionStatus.granted) {
      permission = await Permission.location.request();
      if (permission != PermissionStatus.granted) {
        // Handle permission denial
        return;
      }
    }
    final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      lokasi = '${position.latitude}, ${position.longitude}';
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Iconsax.arrow_left,
            color: cBlack,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Permintaan Ambulans',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              pemesan(),
              const SizedBox(height: 12),
              pasien(),
              const SizedBox(height: 12),
              berat(),
              const SizedBox(height: 12),
              darurat(),
              const SizedBox(height: 12),
              date(),
              const SizedBox(height: 12),
              waktu(),
              const SizedBox(height: 12),
              lokasis(),
              const SizedBox(height: 32),
              tombol(),
            ],
          ),
        ),
      ),
    );
  }

  Widget pemesan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Pemesan',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user,
                color: cBlack,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: namaPemesan,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: const EdgeInsets.only(
              top: 6,
            ),
            child: Text(
              'Nama pemesan tidak boleh kosong',
              style: GoogleFonts.poppins(
                color: cRed,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget pasien() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama Pasien',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user,
                color: cBlack,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: namaPasien,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama Lengkap',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isShowPasswordError)
          Container(
            margin: const EdgeInsets.only(
              top: 6,
            ),
            child: Text(
              'Nama tidak boleh kosong',
              style: GoogleFonts.poppins(
                color: cRed,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }

  Widget berat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Berat Badan',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.weight,
                color: cBlack,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: c6,
                  value: dropdownBerat,
                  isExpanded: true,
                  isDense: true,
                  icon: Icon(Iconsax.arrow_down_1, color: cBlack),
                  elevation: 16,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 16,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownBerat = value!;
                    });
                  },
                  items: kg.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget darurat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Level Darurat',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.level,
                color: cBlack,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: c6,
                  value: dropdownValue,
                  isExpanded: true,
                  isDense: true,
                  icon: Icon(Iconsax.arrow_down_1, color: cBlack),
                  elevation: 16,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 16,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownValue = value!;
                      beratBadan.text = value;
                    });
                  },
                  items: level.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget date() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.only(
            left: 16,
            right: 4,
          ),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Iconsax.calendar_1,
                    color: cBlack,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    DateFormat.yMMMMEEEEd().format(selectDate),
                    style: GoogleFonts.poppins(
                      color: cBlack,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Container(
                height: 52,
                width: 52,
                decoration: BoxDecoration(
                  color: c2,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: IconButton(
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: selectDate,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2050),
                    ).then(
                      (value) {
                        if (value != null) {
                          setState(() {
                            selectDate = value;
                            // date.text = value;
                          });
                        }
                      },
                    );
                  },
                  icon: const Icon(
                    Iconsax.calendar_add5,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget waktu() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Pukul',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.clock,
                color: cBlack,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: c6,
                  value: dropdownPukul,
                  isExpanded: true,
                  isDense: true,
                  icon: Icon(Iconsax.arrow_down_1, color: cBlack),
                  elevation: 16,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 16,
                  ),
                  onChanged: (String? value) {
                    // This is called when the user selects an item.
                    setState(() {
                      dropdownPukul = value!;
                    });
                  },
                  items: jam.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget lokasis() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Dapatkan Lokasi Jemput',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 6,
          ),
          height: 60,
          child: TextButton(
            onPressed: () {
              //
            },
            style: TextButton.styleFrom(
              backgroundColor: c6,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              // side: BorderSide(color: c2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  lokasi,
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontWeight: regular,
                    fontSize: 16,
                  ),
                ),
                // Icon(
                //   Iconsax.arrow_right_3,
                //   color: cBlack,
                // ),
              ],
            ),
          ),
        ),
          ElevatedButton(
            onPressed: () {
              _getCurrentLocation();
            },
            child: const Text('Dapatkan Lokasi'),
          ),
      ],
    );
  }

  Widget tombol() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // TOMBOL BATALKAN
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(right: 8),
            height: 56,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/navbar');
              },
              style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    style: BorderStyle.solid,
                    color: c2,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Batalkan',
                style: GoogleFonts.poppins(
                  color: cBlack,
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
          ),
        ),

        // TOMBOL KONFIRMASI
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 8),
            height: 56,
            child: TextButton(
              onPressed: () {
                setState(() {
                  isLoading = true;
                });

                Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    isLoading = false;
                  });
                  if (
                  namaPemesan.text.isNotEmpty ||
                  namaPasien.text.isNotEmpty ||
                  beratBadan.text.isNotEmpty ||
                  levelDarurat.text.isNotEmpty ||
                  tanggal.text.isNotEmpty ||
                  dropdownPukul.isNotEmpty ||
                  lokasi.isNotEmpty
                  ) {
                    setState(() {
                      isShowPasswordError = true;
                    });
                  } else {
                    _addAmbulan();
                    Navigator.pushNamed(context, '/homeboarding');
                  }
                });
              },
              style: TextButton.styleFrom(
                backgroundColor: c2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: isLoading
                  ? CircularProgressIndicator(
                      color: cWhite,
                      backgroundColor: c6,
                    )
                  : Text(
                      'Pesan',
                      style: GoogleFonts.poppins(
                        color: cBlack,
                        fontSize: 16,
                        fontWeight: semibold,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
