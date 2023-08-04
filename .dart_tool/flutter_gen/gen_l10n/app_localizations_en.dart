import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get splash => 'Pokemon!';

  @override
  String get homepage => 'Hello to your pokedex';

  @override
  String get search => 'Search Pokemon';

  @override
  String get empty => 'Let\'s catch some pokemon';

  @override
  String get exist => 'Pokemon already in your pokedex';

  @override
  String get errorTitle => 'Error';

  @override
  String get errorButton => 'OK';

  @override
  String get exception => 'Something wrong happen, try later';

  @override
  String get submit => 'submit';

  @override
  String get cancel => 'Cancel';

  @override
  String get name => 'Name';

  @override
  String get nickname => 'Nickname';

  @override
  String get nameEmpty => 'This field can\'t be empty';
}
