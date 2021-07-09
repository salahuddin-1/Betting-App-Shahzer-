class PassWord implements CheckPasswordStrength {
  final _hasCharacters = new HasCharacters();

  @override
  bool isAverage(String value) {
    if (value.length == 8 &&
        value.contains(_hasCharacters.lowerCaseChararacters) &&
        value.contains(_hasCharacters.upperCaseChararacters) &&
        value.contains(_hasCharacters.numbers) &&
        value.contains(_hasCharacters.specialChararacters)) {
      return true;
    }

    if (value.length == 9 &&
        value.contains(_hasCharacters.lowerCaseChararacters) &&
        value.contains(_hasCharacters.upperCaseChararacters) &&
        value.contains(_hasCharacters.numbers)) {
      return true;
    }

    if (value.length == 10 &&
        value.contains(_hasCharacters.lowerCaseChararacters) &&
        value.contains(_hasCharacters.upperCaseChararacters)) {
      return true;
    }

    return false;
  }

  @override
  bool isStrong(String value) {
    if (value.length >= 9 &&
        value.contains(_hasCharacters.lowerCaseChararacters) &&
        value.contains(_hasCharacters.upperCaseChararacters) &&
        value.contains(_hasCharacters.numbers) &&
        value.contains(_hasCharacters.specialChararacters)) {
      return true;
    }

    if (value.length >= 10 &&
        value.contains(_hasCharacters.lowerCaseChararacters) &&
        value.contains(_hasCharacters.upperCaseChararacters) &&
        value.contains(_hasCharacters.numbers)) {
      return true;
    }

    if (value.length >= 11 &&
        value.contains(_hasCharacters.lowerCaseChararacters) &&
        value.contains(_hasCharacters.upperCaseChararacters)) {
      return true;
    }

    return false;
  }
}

abstract class CheckPasswordStrength {
  bool isStrong(String value);
  bool isAverage(String value);
}

class HasCharacters {
  final _lowerCaseChararacters = RegExp(r'[a-z]');
  final _upperCaseChararacters = RegExp(r'[A-Z]');
  final _numbers = RegExp(r'[0-9]');
  final _specialChararacters = RegExp(r'[!@#$%^&*(),.?":{}|<>]');

  RegExp get lowerCaseChararacters => _lowerCaseChararacters;
  RegExp get upperCaseChararacters => _upperCaseChararacters;
  RegExp get numbers => _numbers;
  RegExp get specialChararacters => _specialChararacters;
}
