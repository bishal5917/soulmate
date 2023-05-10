// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';

// import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';

// import '../../core/app/texts.dart';

// import '../../core/configs/api_config.dart';
// import '../../core/development/console.dart';
// import '../../core/error/api_exceptions.dart';

// import '../local/secure_storage.dart';

// class ApiHandler {
//   static const int timeOutDuration = 60;
//   var client = http.Client();
//   final Map<String, String> _headers = {
//     contentTypeText: applicationJsonText,
//     acceptText: applicationJsonText
//   };

//   //DELETE
//   Future<dynamic> delete(String api,
//       {dynamic payloadObj, bool isauth = true}) async {
//     var uri = Uri.parse(ApiConfig.baseUrl + api);
//     var token = SharedPreference.getToken();
//     String? payload;
//     if (payloadObj != null) {
//       payload = json.encode(payloadObj);
//     }
//     try {
//       var response = await http
//           .delete(uri,
//               body: payload,
//               headers: isauth == true
//                   ? {
//                       contentTypeText: applicationJsonText,
//                       acceptText: applicationJsonText,
//                       authorizationText: "$bearerText $token"
//                     }
//                   : _headers)
//           .timeout(const Duration(seconds: timeOutDuration));
//       consolelog(response.body);
//       consolelog(uri);
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException(noInternetConnectionText, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
//     }
//   }

//   //GET
//   Future<dynamic> get(String api,
//       {Map<String, String>? header, bool? isAuthenticated = false}) async {
//     var uri = Uri.parse(ApiConfig.baseUrl + api);
//     try {
//       String? token;
//       if (isAuthenticated ?? false) {
//         token = SharedPreference.getToken();
//       }
//       var response = await http
//           .get(
//             uri,
//             headers: header ??
//                 {
//                   contentTypeText: applicationJsonText,
//                   acceptText: applicationJsonText,
//                   if (isAuthenticated ?? false)
//                     authorizationText: "$bearerText $token"
//                 },
//           )
//           .timeout(const Duration(seconds: timeOutDuration));
//       consolelog(response.body);
//       consolelog(uri);
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException(noInternetConnectionText, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
//     }
//   }

// //PATCH
//   Future<dynamic> patch(String api, dynamic payloadObj,
//       {bool? isauth = true}) async {
//     var uri = Uri.parse(ApiConfig.baseUrl + api);
//     console(uri);
//     try {
//       var payload = json.encode(payloadObj);
//       console("payload $payload");
//       var token = SharedPreference.getToken();
//       var response = await http
//           .patch(uri,
//               body: payload,
//               headers: isauth == true
//                   ? {
//                       contentTypeText: applicationJsonText,
//                       acceptText: applicationJsonText,
//                       authorizationText: "$bearerText $token"
//                     }
//                   : _headers)
//           .timeout(const Duration(seconds: timeOutDuration));
//       consolelog(response.body);
//       consolelog(uri);
//       consolelog("$bearerText $token");
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException(noInternetConnectionText, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
//     }
//   }

//   //PUT
//   Future<dynamic> put(String api, dynamic payloadObj,
//       {bool? isauth = true}) async {
//     var uri = Uri.parse(ApiConfig.baseUrl + api);
//     var payload = json.encode(payloadObj);
//     var token = SharedPreference.getToken();
//     try {
//       var response = await http
//           .put(uri,
//               body: payload,
//               headers: isauth == true
//                   ? {
//                       contentTypeText: applicationJsonText,
//                       acceptText: applicationJsonText,
//                       authorizationText: "$bearerText $token"
//                     }
//                   : _headers)
//           .timeout(const Duration(seconds: timeOutDuration));
//       consolelog(response.body);
//       consolelog(uri);
//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException(noInternetConnectionText, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
//     }
//   }

//   //POST
//   Future<dynamic> post(
//     String api,
//     dynamic payloadObj, {
//     bool? isauth = true,
//     bool? checkout = false,
//     Map<String, String>? checkoutHeader,
//     Map<String, String>? header,
//     bool? isCustomApi = false,
//   }) async {
//     var uri = isCustomApi == true
//         ? Uri.parse(api.toString())
//         : Uri.parse(ApiConfig.baseUrl + api);
//     console(uri);
//     var payload = json.encode(payloadObj);
//     console("payload $payload");
//     try {
//       var token = SharedPreference.getToken();

//       var response = await http
//           .post(
//             uri,
//             body: payload,
//             headers: checkout == true
//                 ? checkoutHeader
//                 : isauth == true
//                     ? {
//                         contentTypeText: applicationJsonText,
//                         acceptText: "application/json",
//                         authorizationText: "$bearerText $token"
//                       }
//                     : _headers,
//           )
//           .timeout(
//             const Duration(seconds: timeOutDuration),
//           );
//       consolelog(response.body);
//       consolelog(payload);
//       consolelog(uri);
//       consolelog(response.headers);
//       return _processResponse(response);
//     } on SocketException catch (e) {
//       console(e.toString());
//       throw FetchDataException(noInternetConnectionText, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
//     }
//   }

//   //any method for image or files
//   //PUT
//   Future<dynamic> postWithImage(
//     String api, {
//     Map<String, String>? payloadObj,
//     File? file,
//     String method = 'POST',
//     String? imageKey,
//     Map<String, String>? header,
//     bool? isauth = false,
//   }) async {
//     var uri = Uri.parse(
//       ApiConfig.baseUrl + api,
//     );
//     try {
//       var token = SharedPreference.getToken();
//       var request = http.MultipartRequest(method, uri);
//       request.headers.addAll(
//         isauth == true
//             ? {
//                 contentTypeText: applicationJsonText,
//                 authorizationText: "$bearerText $token"
//               }
//             : _headers,
//       );
//       if (file != null) {
//         request.files.add(
//           await http.MultipartFile.fromPath("$imageKey", file.path,
//               contentType: MediaType('image', 'jpg')),
//         );
//       }

//       request.fields.addAll(payloadObj ?? <String, String>{});

//       var data = await request.send();
//       var response = await http.Response.fromStream(data);
//       consolelog(uri);

//       consolelog(response.body);

//       return _processResponse(response);
//     } on SocketException {
//       throw FetchDataException(noInternetConnectionText, uri.toString());
//     } on TimeoutException {
//       throw ApiNotRespondingException(apiNotRespondingText, uri.toString());
//     }
//   }

//   dynamic _processResponse(http.Response response) async {
//     switch (response.statusCode) {
//       case 200:
//       case 201:
//       case 304:
//         var responseJson = utf8.decode(response.bodyBytes);
//         return responseJson.toString();
//       default:
//         throw ApiException(
//           json.decode(response.body)["message"],
//           response.request?.url.toString(),
//         );
//     }
//   }
// }
