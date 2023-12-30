import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../../route_animation.dart';
import '../../theme.dart';
import 'package:dermain/Models/user_model.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _birthController = TextEditingController();
  final _nikController = TextEditingController();
  final _addressController = TextEditingController();
  final _rantingController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordOne = true;
  bool _passwordTwo = true;

  var _user = UserModel(
    id: '',
    name: '',
    email: '',
    // phone: '',
    // birth: '',
    // nik: '',
    // address: '',
    // ranting: '',
    password: '',
    passwordConfirmation: '',
  );

  void _saveRegister() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    _user = UserModel(
      id: DateTime.now().toString(),
      name: _nameController.text,
      email: _emailController.text,
      // phone: _phoneController.text,
      password: _passwordController.text,
      passwordConfirmation: _passwordConfirmationController.text,
    );
    bool status = await AuthMethod.register(_user);

    print(status);
    globals.isLogin = true;
    if (!mounted) return;
    Navigator.of(context).push(signIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        // toolbarHeight: 0,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: cWhite,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            keterangan(),
            const SizedBox(height: 24),
            email(),
            const SizedBox(height: 12),
            nama(),
            // const SizedBox(height: 12),
            // hp(),
            // const SizedBox(height: 12),
            // tglLahir(),
            // const SizedBox(height: 12),
            // nik(),
            // const SizedBox(height: 12),
            // alamat(),
            // const SizedBox(height: 12),
            // ranting(),
            const SizedBox(height: 12),
            kataSandi(),
            const SizedBox(height: 12),
            konfirmasiSandi(),
            const SizedBox(height: 32),
            tombolDaftar(),
            const SizedBox(height: 12),
            tombolMasuk(),
          ],
        ),
      ),
    );
  }

  Widget keterangan() {
    return Column(
      children: [
        Text(
          textAlign: TextAlign.center,
          'Buat Akun Baru',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 28,
            fontWeight: semibold,
          ),
        ),
        Text(
          // textAlign: TextAlign.left,
          'Lengkapi data diri anda.',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
      ],
    );
  }

  Widget nama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama',
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
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _nameController,
                  decoration: InputDecoration(
                    counterStyle: GoogleFonts.poppins(
                      color: c2,
                    ),
                    hintText: 'Nama lengkap',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        // if (isShowNameError)
        //   Container(
        //     margin: const EdgeInsets.only(
        //       top: 6,
        //     ),
        //     child: Text(
        //       'Nama harus diisi',
        //       style: GoogleFonts.poppins(
        //         color: cRed,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
      ],
    );
  }

  Widget email() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
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
                Iconsax.sms,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'lazismu@mail.com',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email!';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget hp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor Telepon',
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
                Iconsax.call,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '081234567890',
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
      ],
    );
  }

  Widget tglLahir() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Tanggal Lahir',
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
                Iconsax.calendar_1,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _birthController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '00-00-0000',
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
      ],
    );
  }

  Widget nik() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nomor Induk KTP',
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
                Iconsax.strongbox,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _nikController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '00000000000000000',
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
      ],
    );
  }

  Widget alamat() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Alamat',
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
                Iconsax.location,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _addressController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Jl.........',
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
      ],
    );
  }

  Widget ranting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ranting',
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
                Iconsax.data,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _rantingController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: 'Ranting Banguntapan Selatan',
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
      ],
    );
  }

  Widget kataSandi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kata Sandi',
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
                Iconsax.key,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: _passwordOne,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: '******',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  // validator: _validatePassword,
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _passwordOne = !_passwordOne;
                  });
                },
                icon: Icon(
                  _passwordOne ? Iconsax.eye_slash : Iconsax.eye,
                  color: cBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget konfirmasiSandi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Konfirmasi Kata Sandi',
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
                Iconsax.key,
                color: cBlack,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _passwordConfirmationController,
                  obscureText: _passwordTwo,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    hintText: '******',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  validator: (value) {
                    if (_passwordController.text.compareTo(value.toString()) !=
                        0) {
                      return 'Tolong masukkan kata sandi yang sama!';
                    }
                    return null;
                  },
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _passwordTwo = !_passwordTwo;
                  });
                },
                icon: Icon(
                  _passwordOne ? Iconsax.eye : Iconsax.eye_slash,
                  color: cBlack,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget tombolDaftar() {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
        bottom: 12,
      ),
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          _saveRegister();
        },
        style: TextButton.styleFrom(
          backgroundColor: c2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Daftar',
          style: GoogleFonts.poppins(
            color: cWhite,
            fontSize: 18,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }

  Widget tombolMasuk() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sudah punya akun?',
              style: GoogleFonts.poppins(
                color: cBlack,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(signIn());
              },
              child: Text(
                'Masuk',
                style: GoogleFonts.poppins(
                  color: cBlack,
                  fontWeight: semibold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
