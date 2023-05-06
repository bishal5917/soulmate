
// import 'package:ecommerce_mobile/src/core/app/medias.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/svg.dart';

// import '../core/app/colors.dart';
// import '../features/main/presentation/cubit/main_cubit.dart';

// class CustomBottomNavigationBar extends StatelessWidget {
//   const CustomBottomNavigationBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainCubit, int>(
//       builder: (context, state) {
//         return BottomNavigationBar(
//           type: BottomNavigationBarType.fixed,
//           selectedItemColor: EColors.kPrimaryColor,
//           unselectedItemColor: Colors.grey,
//           selectedFontSize: 10.0,
//           unselectedFontSize: 10.0,
//           currentIndex: int.parse(state.toString()),
//           onTap: (int index) {
//             BlocProvider.of<MainCubit>(context).changeCurrentIndex(index);
//           },
//           items: [
//             custombottomitem(
//               "Home",
//               state == 0 ? kFilledHomeSvg : kHomeSvg,
//             ),
//             custombottomitem(
//               "Category",
//               state == 1 ? kFilledCategorySvg : kCategorySvg,
//             ),
//             custombottomitem(
//               "Wishlist",
//               state == 2 ? kFilledWishlistSvg : kWishlistSvg,
//             ),
//             custombottomitem(
//               "Cart",
//               state == 3 ? kFilledCartSvg : kCartSvg,
//             ),
//             custombottomitem(
//               "Profile",
//               state == 4 ? kFilledProfileSvg : kProfileSvg,
//             ),
//           ],
//         );
//       },
//     );
//   }

//   BottomNavigationBarItem custombottomitem(
//     String? label,
//     String? icon,
//   ) {
//     return BottomNavigationBarItem(
//       label: label,
//       activeIcon: Padding(
//         padding: const EdgeInsets.only(bottom: 2.5),
//         child: SvgPicture.asset(
//           icon ?? '',
//           color: OColors.kPrimaryMainColor,
//           height: 20.0,
//         ),
//       ),
//       icon: Padding(
//         padding: const EdgeInsets.only(bottom: 2.5),
//         child: SvgPicture.asset(
//           icon ?? '',
//           height: 20.0,
//         ),
//       ),
//     );
//   }
// }
