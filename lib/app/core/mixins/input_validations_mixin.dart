mixin InputValidationsMixin {
  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? "Esse campo é obrigatório";
    return null;
  }

  String? hasMinChars(String? value, [String? message]) {
    if (value!.length < 6) return message ?? "Valor informado muito curto";
    return null;
  }

  String? isValidEmail(String? value, [String? message]) {
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!);
    if (!emailValid) return message ?? "E-mail com formato inválido";
    return null;
  }

  String? isConfirmationValid(String? firstValue, String? secondValue, [String? message]) {
    if (firstValue != secondValue) return message ?? "Confirmação diferente da senha";
    return null;
  }

  String? combine(List<String? Function()> validators) {
    for (final function in validators) {
      final validation = function();
      if (validation != null) return validation;
    }
    return null;
  }
}