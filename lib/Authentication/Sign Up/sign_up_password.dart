// import 'package:dermain/Providers/user_provider.dart';
// import 'package:dermain/theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:iconsax/iconsax.dart';
// import '../../Methods/auth_method.dart';
// import '../../Models/user_model.dart';
//
// class SignUpPassword extends ConsumerStatefulWidget {
//   const SignUpPassword({super.key});
//
//   @override
//   ConsumerState<SignUpPassword> createState() => _SignUpPasswordState();
// }
//
// class _SignUpPasswordState extends ConsumerState<SignUpPassword> {
//   final _passwordController = TextEditingController();
//   final _passwordConfirmationController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _passwordOne = true;
//   bool _passwordTwo = true;
//   String id = '';
//
//   UserModel user = UserModel(
//     id: '',
//     email: '',
//     name: '',
//     password: '',
//     passwordConfirmation: '',
//   );
//
//   @override
//   void didChangeDependencies() {
//     id = ModalRoute.of(context)!.settings.arguments as String;
//     UserModel tempUser = ref.read(usersProvider.notifier).findUser(id);
//     user = UserModel(
//       id: tempUser.id,
//       name: tempUser.name,
//       email: tempUser.email,
//       password: tempUser.password,
//       passwordConfirmation: tempUser.passwordConfirmation,
//     );
//     _passwordController.text = user.password;
//     _passwordConfirmationController.text = user.passwordConfirmation;
//     super.didChangeDependencies();
//   }
//
//   // void _updatePassword() async {
//   //   if (!_formKey.currentState!.validate()) {
//   //     return;
//   //   }
//   //   _formKey.currentState!.save();
//   //   user = UserModel(
//   //     id: user.id,
//   //     name: '',
//   //     email: '',
//   //     password: _passwordController.text,
//   //     passwordConfirmation: _passwordConfirmationController.text,
//   //   );
//   //   bool status = await AuthMethod.updatePassword(user);
//   //
//   //   if (!mounted) return;
//   //   ScaffoldMessenger.of(context).clearSnackBars();
//   //   if (status) {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text('Password successfully updated')));
//   //   } else {
//   //     ScaffoldMessenger.of(context).showSnackBar(
//   //         const SnackBar(content: Text('Failed to update password')));
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: cWhite,
//       appBar: AppBar(
//         toolbarHeight: 0,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         backgroundColor: cWhite,
//         systemOverlayStyle: SystemUiOverlayStyle(
//           statusBarColor: cWhite,
//           statusBarIconBrightness: Brightness.dark,
//         ),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   keterangan(),
//                   const SizedBox(height: 24),
//                   kataSandi(),
//                   const SizedBox(height: 12),
//                   konfirmasiSandi(),
//                   const SizedBox(height: 32),
//                 ],
//               ),
//               tombolDaftar(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget keterangan() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           textAlign: TextAlign.start,
//           'Buat Akun Baru',
//           style: GoogleFonts.poppins(
//             color: c1,
//             fontSize: 28,
//             fontWeight: semibold,
//           ),
//         ),
//         Text(
//           // textAlign: TextAlign.left,
//           'Buat kata sandi anda.',
//           style: GoogleFonts.poppins(
//             color: c1,
//             fontSize: 16,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget kataSandi() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Kata Sandi',
//           style: GoogleFonts.poppins(
//             color: c1,
//             fontSize: 12,
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 6),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           height: 60,
//           decoration: BoxDecoration(
//             color: c5,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 Iconsax.key,
//                 color: c1,
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               Expanded(
//                 child: TextFormField(
//                   style: GoogleFonts.poppins(color: c1),
//                   controller: _passwordController,
//                   obscureText: _passwordOne,
//                   keyboardType: TextInputType.visiblePassword,
//                   decoration: InputDecoration(
//                     hintText: '******',
//                     hintStyle: GoogleFonts.poppins(
//                       color: c3,
//                       fontSize: 16,
//                     ),
//                     enabledBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                     ),
//                     focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter title';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _passwordOne = !_passwordOne;
//                   });
//                 },
//                 icon: Icon(
//                   _passwordOne ? Iconsax.eye_slash : Iconsax.eye,
//                   color: c1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget konfirmasiSandi() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Konfirmasi Kata Sandi',
//           style: GoogleFonts.poppins(
//             color: c1,
//             fontSize: 12,
//           ),
//         ),
//         Container(
//           margin: const EdgeInsets.only(top: 6),
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           height: 60,
//           decoration: BoxDecoration(
//             color: c5,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Row(
//             children: [
//               Icon(
//                 Iconsax.key,
//                 color: c1,
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               Expanded(
//                 child: TextFormField(
//                   style: GoogleFonts.poppins(color: c1),
//                   controller: _passwordConfirmationController,
//                   obscureText: _passwordTwo,
//                   keyboardType: TextInputType.visiblePassword,
//                   decoration: InputDecoration(
//                     hintText: '******',
//                     hintStyle: GoogleFonts.poppins(
//                       color: c3,
//                       fontSize: 16,
//                     ),
//                     enabledBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                     ),
//                     focusedBorder: const UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.transparent),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (_passwordController.text.compareTo(value.toString()) !=
//                         0) {
//                       return 'Tolong masukkan kata sandi yang sama!';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   setState(() {
//                     _passwordTwo = !_passwordTwo;
//                   });
//                 },
//                 icon: Icon(
//                   _passwordTwo ? Iconsax.eye_slash : Iconsax.eye,
//                   color: c1,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget tombolDaftar() {
//     return Container(
//       margin: const EdgeInsets.only(
//         top: 32,
//         bottom: 12,
//       ),
//       height: 56,
//       width: double.infinity,
//       child: TextButton(
//         onPressed: () {
//           _updatePassword();
//         },
//         style: TextButton.styleFrom(
//           backgroundColor: c2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//         ),
//         child: Text(
//           'Simpan',
//           style: GoogleFonts.poppins(
//             color: c1,
//             fontSize: 16,
//             fontWeight: semibold,
//           ),
//         ),
//       ),
//     );
//   }
// }
