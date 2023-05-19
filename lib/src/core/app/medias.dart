//svg data here...
const baseSVGPath = 'assets/svg/';

//image data here...
const baseImagePath = 'assets/images/';

//json data here...
const baseJsonPath = 'assets/json/';

//splash screen
final kOneLogoSvg = _getSvgBasePath('oneLogo.svg');

//main screen
final kUpDownSvg = _getSvgBasePath('upDown.svg');

final kGoogleSvg = _getSvgBasePath('google.svg');
final kAppleSvg = _getSvgBasePath('apple.svg');
final kCameraSvg = _getSvgBasePath('camera.svg');
const kLogoSvg = 'logo.png';

final countriesJson = _getJsonBasePath('countries.json');

//svg function here...
String _getSvgBasePath(String name) {
  return baseSVGPath + name;
}

//image function here...
String _getImageBasePath(String name) {
  return baseImagePath + name;
}

//json function here...
String _getJsonBasePath(String name) {
  return baseJsonPath + name;
}
