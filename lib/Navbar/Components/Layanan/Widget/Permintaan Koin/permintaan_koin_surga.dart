import 'package:dermain/Methods/koinSurga_method.dart';
import 'package:dermain/Providers/koinSurga_provider.dart';
import 'package:dermain/route_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';

List<String> jenis = [
  'Antar Kencleng Koin Surga',
  'Jemput Kencleng Koin Surga'
];

class PermintaanKoin extends ConsumerStatefulWidget {
  const PermintaanKoin({super.key});

  @override
  ConsumerState<PermintaanKoin> createState() => _PermintaanKoinState();
}

class _PermintaanKoinState extends ConsumerState<PermintaanKoin> {
  final catatanController = TextEditingController(text: 'Tidak ada catatan');
  final tanggalController = TextEditingController();
  final titleController = TextEditingController();
  final jenisController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String dropdownJenis = jenis.first;

  bool isShowPasswordError = false;
  bool isLoading = false;

  DateTime selectDate = DateTime.now();

  void _addKoinSurga() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status = await KoinSurgaMethod.addKoinSurga(
      titleController.text,
      jenisController.text,
      catatanController.text,
      tanggalController.text,
    );

    if (status) {
      _formKey.currentState!.reset();

      ref
          .read(koinSurgasProvider.notifier)
          .addKoinSurgas(await KoinSurgaMethod.loadAllKoinSurga());
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Koin surga successfully added')));
    }
  }

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
        elevation: 0,
        backgroundColor: c2,
        iconTheme: IconThemeData(
          color: c2,
        ),
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
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              titleController.text = 'Koin Surga',
              style: GoogleFonts.poppins(
                color: cBlack,
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
          ],
        ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: c2,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            catatan(),
            const SizedBox(height: 12),
            tanggal(),
            const SizedBox(height: 12),
            jenisPermintaan(),
            const SizedBox(height: 32),
            tombol(),
          ],
        ),
      ),
    );
  }

  Widget catatan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Catatan',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.all(16),
          height: 180,
          decoration: BoxDecoration(
            color: c6,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: catatanController,
            maxLines: null,
            decoration: InputDecoration.collapsed(
              hintText: '',
              hintStyle: GoogleFonts.poppins(
                color: c5,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget tanggal() {
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
                    // 'Pilih tanggal',
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

  Widget jenisPermintaan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Jenis Permintaan',
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
                Iconsax.more_circle,
                color: cBlack,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: DropdownButton<String>(
                  dropdownColor: c6,
                  value: dropdownJenis,
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
                      dropdownJenis = value!;
                      jenisController.text = value;
                    });
                  },
                  items: jenis.map<DropdownMenuItem<String>>((String value) {
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
        if (jenisController.text.isEmpty)
          Container(
            margin: const EdgeInsets.only(top: 6),
            child: Text(
              'Pastikan jenis permintaan sudah benar',
              style: GoogleFonts.poppins(
                color: cRed,
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
            height: 56,
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
                  if (tanggalController.text.isEmpty ||
                      jenisController.text.isEmpty) {
                  } else {
                    _addKoinSurga();
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
