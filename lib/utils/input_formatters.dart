import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

mixin InputFormatters {
  static get phone => [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ];
}
