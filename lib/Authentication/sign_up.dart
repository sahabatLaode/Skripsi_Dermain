import 'package:dermain/Methods/auth_method.dart';
import 'package:dermain/globals.dart' as globals;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import '../route_animation.dart';
import '../theme.dart';
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
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _validatorKey = GlobalKey<FlutterPwValidatorState>();
  bool _passwordOne = true;
  bool _passwordTwo = true;
  bool isShowNameError = false;

  var _user = UserModel(
    id: '',
    name: '',
    email: '',
    phone: '',
    password: '',
    password_confirmation: '',
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
      phone: _phoneController.text,
      password: _passwordController.text,
      password_confirmation: _passwordConfirmationController.text,
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
        iconTheme: IconThemeData(
          color: c2,
        ),
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
            nama(),
            const SizedBox(height: 12),
            email(),
            const SizedBox(height: 12),
            hp(),
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
    return Text(
      textAlign: TextAlign.center,
      'Buat Akun Baru',
      style: GoogleFonts.poppins(
        color: c1,
        fontSize: 28,
        fontWeight: semibold,
        // fontWeight: medium,
      ),
    );
  }

  Widget nama() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nama',
          style: GoogleFonts.poppins(
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.user,
                color: c1,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Nama lengkap',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 16,
                    ),
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                  ),
                  // validator: (value) {
                  //   if (value == null || value.trim().isEmpty) {
                  //     return 'Please enter your name!';
                  //   }
                  //   return null;
                  // },
                ),
              ),
            ],
          ),
        ),
        if (isShowNameError)
          Container(
            margin: const EdgeInsets.only(
              top: 6,
            ),
            child: Text(
              'Nama harus diisi',
              style: GoogleFonts.poppins(
                color: kRedColor,
                fontSize: 12,
              ),
            ),
          ),
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
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.sms,
                color: c1,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'lazismu@mail.com',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
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
        // const SizedBox(height: 6),
        // if (_emailController.text.isNotEmpty &&
        //     !_isEmailValid(_emailController.text))
        //   Text(
        //     'Format email tidak valid',
        //     style: GoogleFonts.poppins(
        //       color: kRedColor,
        //       fontSize: 12,
        //     ),
        //   ),
        // if (isShowEmailError)
        //   Container(
        //     margin: const EdgeInsets.only(
        //       top: 6,
        //     ),
        //     child: Text(
        //       'Email harus diisi',
        //       style: GoogleFonts.poppins(
        //         color: kRedColor,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
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
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.call,
                color: c1,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '081234567890',
                    hintStyle: GoogleFonts.poppins(
                      color: c3,
                      fontSize: 16,
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your phone number!';
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
        //         color: kRedColor,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
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
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.key,
                color: c1,
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
                      color: c3,
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
                  color: c1,
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
            color: c1,
            fontSize: 12,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 6),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 60,
          decoration: BoxDecoration(
            color: c5,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Icon(
                Iconsax.key,
                color: c1,
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
                      color: c3,
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
                  color: c1,
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
            color: c1,
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
                color: c1,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(signIn());
              },
              child: Text(
                'Masuk',
                style: GoogleFonts.poppins(
                  color: c1,
                  fontWeight: semibold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
        FlutterPwValidator(
          key: _validatorKey,
          controller: _passwordController,
          width: 400,
          height: 200,
          minLength: 6,
          onSuccess: () {},
        ),
      ],
    );
  }
}
