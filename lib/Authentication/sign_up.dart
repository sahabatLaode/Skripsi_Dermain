import 'package:dermain/Authentication/sign_in.dart';
import 'package:dermain/Global/global.dart';
import 'package:dermain/Global/progress_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../route_animation.dart';
import '../theme.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _passwordsMatch = true;
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool isShowNameError = false;
  bool isShowEmailError = false;
  bool isShowPhoneError = false;
  bool isShowPasswordError = false;
  bool isShowConfirmPasswordError = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkPasswordMatch);
    _confirmPasswordController.addListener(_checkPasswordMatch);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  validateForm() {
    if (_nameController.text.length < 3) {
      Fluttertoast.showToast(msg: "name must be atleast 3 Characters.");
    } else if (!_emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email address is not Valid.");
    } else if (_passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Phone Number is required.");
    } else if (_phoneController.text.length < 6) {
      Fluttertoast.showToast(msg: "Password must be atleast 6 Characters.");
    } else {
      saveUserInfoNow();
    }
  }

  saveUserInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return ProgressDialog(
            message: "Processing, Please wait...",
          );
        });

    final User? firebaseUser = (await fAuth
            .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    )
            .catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: " + msg.toString());
    }))
        .user;

    if (firebaseUser != null) {
      Map userMap = {
        "id": firebaseUser.uid,
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "phone": _phoneController.text.trim(),
        "password": _passwordController.text.trim(),
      };

      DatabaseReference reference =
          FirebaseDatabase.instance.ref().child("users");
      reference.child(firebaseUser.uid).set(userMap);

      currentFirebaseUser = firebaseUser;
      Fluttertoast.showToast(msg: "Account has been Created.");
      Navigator.push(context, MaterialPageRoute(builder: (c) => SignIn()));
    } else {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been Created.");
    }
  }

  void _checkPasswordMatch() {
    setState(() {
      _passwordsMatch =
          _passwordController.text == _confirmPasswordController.text;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _toggleConfirmPasswordVisibility() {
    setState(() {
      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
    });
  }

  bool _isEmailValid(String email) {
    return email.contains('@') && email.contains('.');
  }

  bool _isFormValid() {
    return _nameController.text.isNotEmpty &&
        _isEmailValid(_emailController.text) &&
        _phoneController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _passwordsMatch;
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
        // centerTitle: true,
        // title: Text(
        //   'Daftar',
        //   style: GoogleFonts.poppins(
        //     color: c5,
        //   ),
        // ),
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: cWhite,
          statusBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Form(
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
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama harus diisi';
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
                  // validator: _validateEmail,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        if (_emailController.text.isNotEmpty &&
            !_isEmailValid(_emailController.text))
          Text(
            'Format email tidak valid',
            style: GoogleFonts.poppins(
              color: kRedColor,
              fontSize: 12,
            ),
          ),
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
                  obscureText: !_isPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: '********',
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
                onPressed: _togglePasswordVisibility,
                icon: Icon(
                  _isPasswordVisible ? Iconsax.eye_slash : Iconsax.eye,
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
                  controller: _confirmPasswordController,
                  obscureText: _isConfirmPasswordVisible,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: '********',
                    // errorText:
                    //     !_passwordsMatch ? 'Kata sandi tidak cocok' : null,
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
                    if (value!.isEmpty) {
                      return 'Konfirmasi kata sandi harus diisi';
                    }
                    if (value != _passwordController.text) {
                      return 'Kata sandi tidak cocok';
                    }
                    return null;
                  },
                ),
              ),
              IconButton(
                onPressed: _toggleConfirmPasswordVisibility,
                icon: Icon(
                  _isConfirmPasswordVisible ? Iconsax.eye : Iconsax.eye_slash,
                  color: c1,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 6),
        if (!_passwordsMatch)
          Text(
            'Kata sandi tidak cocok',
            style: GoogleFonts.poppins(color: kRedColor, fontSize: 12),
          )
      ],
    );
  }

  Widget tombolDaftar() {
    return SizedBox(
      height: 56,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isFormValid()
            ? () {
                validateForm();
                // Navigator.of(context).push(kodeOTP());
                // print('Kata sandi dan konfirmasi kata sandi cocok');
                // setState(() {
                //   isLoading = true;
                // });

                // Future.delayed(const Duration(seconds: 2), () {
                //   setState(() {
                //     isLoading = false;
                //   });
                //   if (passwordController.text != '12345') {
                //     setState(() {
                //       isShowPasswordError = true;
                //     });
                //   } else {
                //     Navigator.pushReplacementNamed(
                //       context,
                //       '/navbar',
                //     );
                //   }
                // });
              }
            : null,
        style: TextButton.styleFrom(
          backgroundColor: c2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator(
                color: cWhite,
                backgroundColor: c5,
              )
            : Text(
                'Lanjutkan',
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
    return Row(
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
    );
  }
}
