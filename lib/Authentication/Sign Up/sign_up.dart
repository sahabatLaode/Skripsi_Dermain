import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/Reusable%20Components/Widget/custom_snackbar.dart';
import 'package:dermain/Reusable%20Components/Widget/email_form.dart';
import 'package:dermain/Reusable%20Components/Widget/nama_form.dart';
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
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _passwordOne = true;
  bool _passwordTwo = true;
  bool isLoading = false;

  var _user = UserModel(
    id: '',
    name: '',
    email: '',
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
            NamaForm(
              title: 'Nama',
              hint: 'Nama Lengkap',
              warning: 'Masukkan nama lengkap',
              color: cBlack,
              controller: _nameController,
            ),
            const SizedBox(height: 12),
            EmailForm(
              title: 'Email',
              controller: _emailController,
              warnaIcon: cBlack,
            ),
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
                  style: GoogleFonts.poppins(),
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
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _passwordOne = !_passwordOne;
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
        if (_passwordController.text.isEmpty || _passwordController.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan kata sandi',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
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
                  style: GoogleFonts.poppins(),
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
                  _passwordTwo ? Iconsax.eye : Iconsax.eye_slash,
                  color: cBlack,
                ),
              ),
            ],
          ),
        ),
        if (_passwordConfirmationController.text.isEmpty ||
            _passwordConfirmationController.text == '')
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              'Masukkan konfirmasi kata sandi',
              style: GoogleFonts.poppins(
                color: cRed,
              ),
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
          setState(() {
            isLoading = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              isLoading = false;
            });
            if (_nameController.text.isEmpty ||
                _emailController.text.isEmpty ||
                _passwordController.text.isEmpty ||
                _passwordConfirmationController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                CustomSnackBar(
                  message: 'Semua field harus diisi',
                  icon: Iconsax.warning_2,
                  background: cRed,
                ),
              );
            } else if (_passwordController.text !=
                _passwordConfirmationController.text) {
              ScaffoldMessenger.of(context).showSnackBar(
                CustomSnackBar(
                  message: 'Masukkan kata sandi yang sama!',
                  icon: Iconsax.warning_2,
                  background: cRed,
                ),
              );
            } else {
              _saveRegister();
              ScaffoldMessenger.of(context).showSnackBar(
                CustomSnackBar(
                  message: 'Akun baru berhasil dibuat',
                  icon: Iconsax.user_add,
                  background: c4,
                ),
              );
            }
          });
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
            fontSize: 16,
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
