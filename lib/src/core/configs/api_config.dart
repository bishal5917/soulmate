class ApiConfig {
  static const String localhost = "http://192.168.1.83:5000";
  static const String devServerUrl =
      'https://octopus-app-2f4az.ondigitalocean.app';
  static const String prodServerUrl = 'https://api.meropadhai.com';
  static const String apiUrl = "/api";
  static const String apiVersion1 = "/v1";
  static const String baseUrl = prodServerUrl + apiUrl + apiVersion1;
  static const String affiliateProdUrl = 'https://affilateapi.meropadhai.com';
  static const String affiliateDevUrl =
      'https://shark-app-9shea.ondigitalocean.app';
  static const String authUrl = "/auth";
  static const String websiteUserUrl = "/website/user";
  static const String loginUrl = "$authUrl/normal-user-login";
  static const String registerUrl = "$authUrl/normal-user-register";
  static const String registerOTPUrl = "$authUrl/normal-user-activation";
  static const String resendRegisterOTPUrl =
      "$authUrl/normal-user/resend-activation";
  static const String resetPasswordOTPUrl =
      "$authUrl/normal-user/password-reset";
  static const String changePasswordUrl =
      "$authUrl/normal-user/change-password";
  static const String getProfileUrl = "/profile";
  static const String updateProfileImage = "/profile-image";
  static const String updateProfile = "/profile-update";
  static const String resetPasswordUrl =
      "$authUrl/normal-user/password-reset-confirm";

  static const String resendResetPasswordOtp =
      "$authUrl/normal-user/resend-password-reset";
  static const String websiteUrl = "/website";
  static const String userUrl = "/user";

  //home
  //explore top course/faculty
  static const String facultyUrl = "$websiteUrl/faculty/list-faculty";

  //trending courses
  static const String trendingCourseUrl = "$websiteUrl/course/list-trending";

  //newest courses
  static const String allCourseUrl = "$websiteUrl/course/list-course";

  //course
  static const String courseUrl = "/course";

  //quiz
  static const String quizUrl = "/quiz";
  static const String quizDetailsUrl = "/quiz-detail";
  static const String quizAnswerUrl = "/answer";
  static const String quizResultUrl = "/result";

  //course details
  static const String courseDetailsNormalUrl = "/list-course-detail";
  static const String courseDetailsLibraryUrl = "/list-course-content";

  //top pick for you
  static const String topPickForYouUrl = "$websiteUrl/course/top-pick";

  //wishlist
  static const String getWishListUrl = "/wishlist/list-wishlist";
  static const String addWishListUrl = "/wishlist/add-to-wishlist";
  static const String removeWishListUrl = "/delete-from-wishlist";
  static const String wishlistUrl = "/wishlist";

  //learning
  static const String learningUrl = "$websiteUrl/library/list-library";

  //cart
  static const String cartUrl = "/cart";
  static const String getCartUrl = "$cartUrl/list-cart";
  static const String addCartUrl = "$cartUrl/add-item-to-cart";
  static const String deleteCartUrl = "/delete-from-cart";
  static const String changeCoursePlanUrl = "/list-course-price-options";
  static const String updateCoursePlanUrl = "/update-price-option";

  //voucher code
  static const String checkReferCodeUrl = "/referalCode";

  //purchase history
  static const String purchaseHistoryUrl = "/order/list-order";

  //contact us
  static const String contactUsUrl = "/contact-us";

  //pay now cart discount
  static const String listPayNowCartDetailsUrl = "/list-cart-details";

  //checkout
  static const String checkoutUrl = "/checkout";

  //chapter
  static const String chapterUrl = "/chapter";
  static const String chapterDetailUrl = "/chapter-detail";
  static const String listDetailsForLibraryContentUrl = "/list-course-content";

  //review
  static const String reviewUrl = "/review";
  static const String allReviewsUrl = "/list-review";

  //course
  static const String markCompletedUrl = "/mark-completed";

  //video url
  static const String getVideoUrl = "/video/url";

  //forum
  static const String forumUrl = "/forum";
  static const String forumAnswerUrl = "/answer";
  //buy from apple
  static const String buyFromAppleUrl = "/buy/apple";
  static const String buyFromAppleFreeUrl = "/buy/free";

  static const String curriculumUrl = "/curriculum";

  //google
  static const String googleLoginUrl = "$authUrl/google-login";
  static const String googleRegisterUrl = "$authUrl/google-signup";

  //change phone number
  static const String contactUrl = "/contact";
  static const String contactVerifyUrl = "/verify";

  //change sign in method
  static const String loginMethodUrl = "/loginMethod";
  static const String loginMethodOtpVerifyUrl = "/verify";

  //apple login
  static const String appleLoginUrl = "$authUrl/apple-login";
  static const String appleRegisterUrl = "$authUrl/apple-signup";

  //notification register

  static const String notificationUrl = "/notification";
  static const String normalUserUrl = "/normal-user";

  //become an affiliate
  static const String becomeAnAffiliateRequestUrl = "/request";

  //bundle course add to cart api
  static const String bundleCourseUrl = "/buy/bridge-course";
}
