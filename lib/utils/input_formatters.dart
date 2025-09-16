import 'package:flutter/services.dart';

class InputFormatters {
  InputFormatters._();
  static get phone => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ];
}
