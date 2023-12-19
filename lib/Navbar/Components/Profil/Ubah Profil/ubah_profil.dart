import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dermain/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class UbahProfil extends StatefulWidget {
  const UbahProfil({super.key});

  @override
  State<UbahProfil> createState() => _UbahProfilState();
}

class _UbahProfilState extends State<UbahProfil> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordConfirmationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _passwordOne = true;
  bool _passwordTwo = true;

  // void _updateUserData() async {
  //   String? token = await AuthMethod.getToken();
  //   String? userId = await AuthMethod.getUserId();
  //   if (token != null && userId != null) {
  //     bool status = await updateUserData(
  //       userId,
  //       _nameController.text,
  //       _emailController.text,
  //       token,
  //     );
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text(status ? 'Update successful' : 'Update failed')),
  //     );
  //   } else {
  //     print('Error: No token or user ID found');
  //   }
  // }


  // final String userId = ;

  // var _user = UserModel(
  //   id: '',
  //   name: '',
  //   email: '',
  //   // phone: '',
  //   password: '',
  //   passwordConfirmation: '',
  // );
  //
  // void _saveRegister() async {
  //   if (!_formKey.currentState!.validate()) {
  //     return;
  //   }
  //
  //   _formKey.currentState!.save();
  //   _user = UserModel(
  //     id: DateTime.now().toString(),
  //     name: _nameController.text,
  //     email: _emailController.text,
  //     // phone: _phoneController.text,
  //     password: _passwordController.text,
  //     passwordConfirmation: _passwordConfirmationController.text,
  //   );
  //   bool status = await AuthMethod.register(_user);
  //
  //   // print(status);
  //   globals.isLogin = true;
  //   if (!mounted) return;
  //   Navigator.of(context).push(signIn());
  // }

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
          'Ubah Profil',
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
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            nama(),
            const SizedBox(height: 12),
            email(),
            const SizedBox(height: 12),
            // hp(),
            // const SizedBox(height: 12),
            // kataSandi(),
            // const SizedBox(height: 12),
            // konfirmasiSandi(),
            const SizedBox(height: 32),
            tombolSimpan(),
          ],
        ),
      ),
    );
  }

  Widget nama() {
    return IgnorePointer(
      child: Column(
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
                    controller: _nameController,
                    decoration: InputDecoration(
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
          // if (_nameController.text.isNotEmpty && _nameController.text.trim().isEmpty) {
          //               return 'Please enter email.';
          //             }
          //             bool isEmailvalid =
          //                 EmailValidator.validate(value.toString());
          //             if (!isEmailvalid) {
          //               return 'Please enter a valid email (ex: jhon@gmail.com)';
          //             }
          //             return null;

          if (_nameController.text.isNotEmpty &&
              _nameController.text.trim().isEmpty)
            const Padding(
              padding: EdgeInsets.only(left: 52),
              child: Text(
                'Nama harus diisi',
                style: TextStyle(color: Colors.red, fontSize: 12),
              ),
            ),
        ],
      ),
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

        // const SizedBox(height: 6),
        // if (_emailController.text.isNotEmpty &&
        //     !_isEmailValid(_emailController.text))
        //   Text(
        //     'Format email tidak valid',
        //     style: GoogleFonts.poppins(
        //       color: cRed,
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
        //         color: cRed,
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
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration.collapsed(
                    hintText: '081234567890',
                    hintStyle: GoogleFonts.poppins(
                      color: c5,
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
        //         color: cRed,
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

  Widget tombolSimpan() {
    return Container(
      margin: const EdgeInsets.only(
        top: 32,
        bottom: 12,
      ),
      height: 56,
      width: double.infinity,
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: c2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: Text(
          'Simpan',
          style: GoogleFonts.poppins(
            color: cBlack,
            fontSize: 16,
            fontWeight: semibold,
          ),
        ),
      ),
    );
  }
}
