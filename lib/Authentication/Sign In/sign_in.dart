import 'package:dermain/Methods/auth_method.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dermain/globals.dart' as globals;
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../route_animation.dart';
import '../../theme.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController(text: 'tes@gmail.com');
  final _passwordController = TextEditingController(text: 'qqqqqq');
  final _formKey = GlobalKey<FormState>();
  bool _isVisiblePassword = true;

  void _login() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    _formKey.currentState!.save();
    bool status =
        await AuthMethod.login(_emailController.text, _passwordController.text);

    if (!status) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email or password invalid!')),
      );
      return;
    }
    globals.isLogin = true;
    String? token = await AuthMethod.getToken();

    if (token != null) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', token);
      // localStorage.setString('user', json.encode(body['user'])); // Kode ini tidak diperlukan jika Anda tidak mengembalikan objek 'user' dalam respons token.
    }
    if (!mounted) return;
    Navigator.of(context).push(navbar());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cWhite,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: cWhite,
        elevation: 0,
        iconTheme: IconThemeData(
          color: c2,
        ),
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
            sandi(),
            // lupaSandi(),
            tombolMasuk(),
            daftar(),
          ],
        ),
      ),
    );
  }

  Widget keterangan() {
    return Column(
      children: [
        Text(
          'Selamat Datang',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 28,
            fontWeight: semibold,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          textAlign: TextAlign.center,
          'Silahkan masuk dengan menggunakan alamat email dan kata sandi anda.',
          style: GoogleFonts.poppins(
            color: cBlack,
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
                      return 'Please enter email.';
                    }
                    bool isEmailvalid =
                        EmailValidator.validate(value.toString());
                    if (!isEmailvalid) {
                      return 'Please enter a valid email (ex: jhon@gmail.com)';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(height: 6),
        // if (emailTextEditingController.text.isNotEmpty &&
        //     !_isEmailValid(emailTextEditingController.text))
        //   Text(
        //     'Format email tidak valid',
        //     style: GoogleFonts.poppins(
        //       color: cRed,
        //       fontSize: 12,
        //     ),
        //   ),
      ],
    );
  }

  Widget sandi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Kata sandi',
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
                  style: GoogleFonts.poppins(color: cBlack),
                  controller: _passwordController,
                  obscureText: _isVisiblePassword,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration.collapsed(
                    hintText: '********',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isVisiblePassword = !_isVisiblePassword;
                  });
                },
                icon: Icon(
                  _isVisiblePassword ? Iconsax.eye_slash : Iconsax.eye,
                  color: cBlack,
                ),
              ),
            ],
          ),
        ),
        // if (isShowPasswordError)
        //   Container(
        //     margin: const EdgeInsets.only(
        //       top: 6,
        //     ),
        //     child: Text(
        //       'Kata sandi salah',
        //       style: GoogleFonts.poppins(
        //         color: cRed,
        //         fontSize: 12,
        //       ),
        //     ),
        //   ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }

  // Widget lupaSandi() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.end,
  //     children: [
  //       InkWell(
  //         onTap: () {},
  //         child: Text(
  //           'Lupa kata sandi?',
  //           style: GoogleFonts.poppins(
  //             color: cBlack,
  //           ),
  //           textAlign: TextAlign.center,
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Widget tombolMasuk() {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
        bottom: 12,
      ),
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          _login();
        },
        style: TextButton.styleFrom(
          backgroundColor: c2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Masuk',
          style: GoogleFonts.poppins(
            color: cWhite,
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }

  Widget daftar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Belum punya akun?',
              style: GoogleFonts.poppins(
                color: cBlack,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(signUp());
              },
              child: Text(
                'Daftar',
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
