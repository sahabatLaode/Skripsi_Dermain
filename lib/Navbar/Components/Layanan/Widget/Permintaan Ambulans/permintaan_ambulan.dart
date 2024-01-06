import 'package:dermain/Methods/ambulan_method.dart';
import 'package:dermain/Providers/ambulans_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../../route_animation.dart';
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

class PermintaanAmbulan extends ConsumerStatefulWidget {
  const PermintaanAmbulan({super.key});

  @override
  ConsumerState<PermintaanAmbulan> createState() => _PermintaanAmbulanState();
}

class _PermintaanAmbulanState extends ConsumerState<PermintaanAmbulan> {
  final titleController = TextEditingController();
  final namaPemesanController = TextEditingController();
  final namaPasienController = TextEditingController();
  final beratBadanController = TextEditingController();
  final levelDaruratController = TextEditingController();
  final tanggalController = TextEditingController();
  final pukulController = TextEditingController();
  final lokasiController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  // String lokasi='';
  String dropdownBerat = kg.first;
  String dropdownLevel = level.first;
  String dropdownPukul = jam.first;

  DateTime selectDate = DateTime.now();

  void _addAmbulan() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await AmbulanMethod.addAmbulan(
      titleController.text,
      namaPemesanController.text,
      namaPasienController.text,
      beratBadanController.text,
      levelDaruratController.text,
      tanggalController.text,
      pukulController.text,
      lokasiController.text,
    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(ambulansProvider.notifier)
          .addAmbulans(await AmbulanMethod.loadAllAmbulan());
      if (!mounted) return;
      // ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Permintaan Ambulan successfully added')));
    }
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  // }

  // _getCurrentLocation() async{
  //   PermissionStatus permission = await Permission.location.status;
  //
  //   if (permission != PermissionStatus.granted) {
  //     permission = await Permission.location.request();
  //     if (permission != PermissionStatus.granted) {
  //       // Handle permission denial
  //       return;
  //     }
  //   }
  //   final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //   setState(() {
  //     lokasi = '${position.latitude}, ${position.longitude}';
  //   });
  // }

  void myAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          title: Text(
            'Yakin untuk membatalkan?',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: <Widget>[
            SizedBox(
              height: 60,
              width: 140,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: TextButton.styleFrom(
                  backgroundColor: c2,
                  shape: RoundedRectangleBorder(
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
            SizedBox(
              height: 60,
              width: 140,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/navbar');
                },
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 2,
                      style: BorderStyle.solid,
                      color: c2,
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text(
                  'Ya',
                  style: GoogleFonts.poppins(
                    color: cBlack,
                    fontSize: 16,
                    fontWeight: semibold,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
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
          titleController.text = 'Ambulans',
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
              const SizedBox(height: 20),
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
                  controller: namaPemesanController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (namaPemesanController.text.isEmpty ||
            namaPemesanController.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan nama pemesan',
              style: GoogleFonts.poppins(
                color: cRed,
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
                  controller: namaPasienController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Nama Lengkap',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (namaPasienController.text.isEmpty ||
            namaPasienController.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan nama pemesan',
              style: GoogleFonts.poppins(
                color: cRed,
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
                      beratBadanController.text = value;
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
        if (beratBadanController.text.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              'Pastikan berat badan sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
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
                  value: dropdownLevel,
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
                      dropdownLevel = value!;
                      levelDaruratController.text = value;
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
        if (levelDaruratController.text.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              'Pastikan level darurat sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
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
                    DateFormat('dd MMMM yyyy').format(selectDate),
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
                            tanggalController.text =
                                DateFormat('dd MMMM yyyy').format(selectDate);
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
        if (tanggalController.text.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              'Pastikan tanggal yang dipilih sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
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
                      pukulController.text = value;
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
        if (pukulController.text.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              'Pastikan pukul sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
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
          'Lokasi',
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
                Iconsax.map_14,
                color: cBlack,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  enabled: false,
                  controller: lokasiController,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Lokasi',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
        ),
        if (lokasiController.text.isEmpty || lokasiController.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan lokasi',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
            ),
          ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: c2,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tentukan Lokasi',
                  style: GoogleFonts.poppins(
                    color: cWhite,
                    fontWeight: semibold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
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
            height: 60,
            child: TextButton(
              onPressed: () {
                myAlert();
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

        // TOMBOL PESAN
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
                  if (namaPemesanController.text.isEmpty ||
                      namaPasienController.text.isEmpty ||
                      beratBadanController.text.isEmpty ||
                      levelDaruratController.text.isEmpty ||
                      tanggalController.text.isEmpty ||
                      pukulController.text.isEmpty ||
                      lokasiController.text.isEmpty) {
                  } else {
                    _addAmbulan();
                    Navigator.of(context).push(konfirmasiDonasi());
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
                        color: cWhite,
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
