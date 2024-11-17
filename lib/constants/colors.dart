import 'package:flutter/material.dart';

class ColorConstants {
  static Color starterWhite = hexToColor('#DADADA');
  static Color primaryColor = hexToColor('#1ED760');
  static Color cardBackGroundColor = hexToColor('#0E0E0F');
  static Color inputHintColor = hexToColor('#FFFFFF');

}

/// Converts a hex string to a color.
///
/// The hex string can have 6 or 8 digits. If it has 6 digits, it is
/// assumed to not have an alpha channel and is treated as opaque.
/// If it has 8 digits, the first two are assumed to represent the
/// alpha channel.
///
/// The hex string must start with `#` and contain only hexadecimal
/// digits (0-9, a-f, A-F). Any other format will cause the assertion
/// to fail.
Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) + (hex.length == 7 ? 0xFF000000 : 0x00000000));
}
