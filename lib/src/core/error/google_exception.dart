// import 'package:bloc/bloc.dart';
// import 'package:flutter/services.dart';


// class GooglePlatformException {
//   static void googlePlatformException(
//     PlatformException err,
//     GoogleSignInState state,
//     Emitter<GoogleSignInState> emit,
//     bool isGoogleLogin,
//     String data,
//   ) {
//     switch (err.code) {
//       case 'ERROR_USER_DISABLED':
//         break;
//       case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
//         emit(state.copyWith(
//             message:
//                 "Google $data error: Account already exists with a different credential.",
//             status: isGoogleLogin
//                 ? GoogleSignInStatus.googleLoginFailure
//                 : GoogleSignInStatus.googleRegisterFailure));
//         break;
//       case 'ERROR_INVALID_CREDENTIAL':
//         emit(state.copyWith(
//             message: "Invalid credentials",
//             status: isGoogleLogin
//                 ? GoogleSignInStatus.googleLoginFailure
//                 : GoogleSignInStatus.googleRegisterFailure));
//         break;
//       case 'ERROR_OPERATION_NOT_ALLOWED':
//         break;
//       case 'sign_in_canceled':
//         emit(state.copyWith(
//             message: "$data Cancelled",
//             status: isGoogleLogin
//                 ? GoogleSignInStatus.googleLoginFailure
//                 : GoogleSignInStatus.googleRegisterFailure));
//         break;
//       default:
//         emit(state.copyWith(
//             message: err.toString(),
//             status: isGoogleLogin
//                 ? GoogleSignInStatus.googleLoginFailure
//                 : GoogleSignInStatus.googleRegisterFailure));
//         break;
//     }
//   }
// }
