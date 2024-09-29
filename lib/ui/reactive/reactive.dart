import 'package:reactive_forms/reactive_forms.dart';

class NumStringValueAccessor extends ControlValueAccessor<num, String> {
  @override
  String? modelToViewValue(num? modelValue) {
    return modelValue?.toString();
  }

  @override
  num? viewToModelValue(String? viewValue) {
    return viewValue == null ? null : num.tryParse(viewValue);
  }
}

/// Validator that validates if control's value is a numeric value.
class NullableNumberValidator extends Validator<dynamic> {
  /// The regex expression of a numeric string value (integer and decimals).
  static final RegExp numberRegex = RegExp(r'^-?\d+(\.\d+)?$');

  @override
  Map<String, dynamic>? validate(AbstractControl<dynamic> control) {
    if (control.value == null) {
      // Handle null as an error if desired
      return null; // Return an error if null is invalid
    }

    if (!numberRegex.hasMatch(control.value.toString())) {
      return <String, dynamic>{ValidationMessage.number: true};
    }

    return null;
  }
}

