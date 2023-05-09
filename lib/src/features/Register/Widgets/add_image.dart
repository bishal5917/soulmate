// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:soulmate/di_injection.dart';
// import 'package:soulmate/src/core/app/dimensions.dart';
// import 'package:soulmate/src/features/Register/cubit/register_cubit.dart';

// class AddImage extends StatefulWidget {
//   const AddImage({Key? key}) : super(key: key);

//   @override
//   State<AddImage> createState() => _AddImageState();
// }

// class _AddImageState extends State<AddImage> {
//   ImagePicker imgP = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RegisterCubit, RegisterState>(
//       builder: (context, state) {
//         print(state);
//         return Form(
//           // key: sl.get<RegisterCubit>().registerForm2Key,
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   Container(
//                       width: 200,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         border: Border.all(
//                           width: 4,
//                           color: Colors.white,
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                               spreadRadius: 2,
//                               blurRadius: 10,
//                               color: Colors.black.withOpacity(0.1))
//                         ],
//                         shape: BoxShape.circle,
//                       ),
//                       child: state.status == RegisterStatus.image1Loaded
//                           ? CircleAvatar(
//                               backgroundImage: FileImage(
//                                   File(sl.get<RegisterCubit>().image1!.path)),
//                               radius: 30)
//                           : const Icon(
//                               Icons.image_outlined,
//                               size: 50,
//                             )),
//                   Positioned(
//                       bottom: 0,
//                       right: 0,
//                       child: InkWell(
//                         onTap: () async {
//                           var img =
//                               await imgP.pickImage(source: ImageSource.gallery);
//                           sl.get<RegisterCubit>().setImage1 = XFile(img!.path);
//                         },
//                         child: Container(
//                           height: 40,
//                           width: 40,
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             shape: BoxShape.circle,
//                             border: Border.all(width: 2, color: Colors.black26),
//                           ),
//                           child: const Icon(
//                             Icons.edit,
//                             color: Colors.red,
//                           ),
//                         ),
//                       ))
//                 ],
//               ),
//               vSizedBox1,
//               // Stack(
//               //   children: [
//               //     Container(
//               //         width: 200,
//               //         height: 200,
//               //         decoration: BoxDecoration(
//               //           border: Border.all(
//               //             width: 4,
//               //             color: Colors.white,
//               //           ),
//               //           boxShadow: [
//               //             BoxShadow(
//               //                 spreadRadius: 2,
//               //                 blurRadius: 10,
//               //                 color: Colors.black.withOpacity(0.1))
//               //           ],
//               //           shape: BoxShape.circle,
//               //         ),
//               //         child: state.status == RegisterStatus.image2Loaded
//               //             ? CircleAvatar(
//               //                 backgroundImage: FileImage(
//               //                     File(sl.get<RegisterCubit>().image2!.path)),
//               //                 radius: 30)
//               //             : const Icon(
//               //                 Icons.image_outlined,
//               //                 size: 50,
//               //               )),
//               //     Positioned(
//               //         bottom: 0,
//               //         right: 0,
//               //         child: InkWell(
//               //           onTap: () async {
//               //             var img =
//               //                 await imgP.pickImage(source: ImageSource.gallery);
//               //             sl.get<RegisterCubit>().setImage2 = XFile(img!.path);
//               //           },
//               //           child: Container(
//               //             height: 40,
//               //             width: 40,
//               //             decoration: BoxDecoration(
//               //               color: Colors.white,
//               //               shape: BoxShape.circle,
//               //               border: Border.all(width: 2, color: Colors.black26),
//               //             ),
//               //             child: const Icon(
//               //               Icons.edit,
//               //               color: Colors.red,
//               //             ),
//               //           ),
//               //         )),
//               //   ],
//               // ),
//               vSizedBox1
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
