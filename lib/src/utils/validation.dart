import '../core/configs/regex_config.dart';

extension Validator on String {
  bool isValidEmail() {
    return RegexConfig.emailRegex.hasMatch(this);
  }

  bool isEmptyData() {
    return isEmpty;
  }

  bool isPasswordLength() {
    return (length < 8 || length > 32);
  }

  bool isOtpLength() {
    return !(length == 4);
  }

  bool isValidOtp() {
    return RegexConfig.numberRegex.hasMatch(this);
  }

  bool isSamePassword(String newPassword) {
    return this != newPassword;
  }

  bool isValidPhoneNumber() {
    return RegexConfig.phoneNumberRegrex.hasMatch(this);
  }
}
