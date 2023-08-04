import 'app_localizations.dart';

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get language => 'עברית';

  @override
  String get splash => 'פוקימון!';

  @override
  String get homepage => 'ברוכים הבאים לפוקידקס האישי שלך';

  @override
  String get search => 'חפש פוקימון';

  @override
  String get empty => 'זה הזמן לתפוס כמה פוקימונים';

  @override
  String get exist => 'הפוקימון קיים אצלך בפוקידקס';

  @override
  String get errorTitle => 'שגיאה';

  @override
  String get errorButton => 'הבנתי';

  @override
  String get exception => 'קרה משהו לא צפוי, נסה פעם אחרת';

  @override
  String get submit => 'שנה';

  @override
  String get cancel => 'ביטול';

  @override
  String get name => 'שם';

  @override
  String get nickname => 'כינוי';

  @override
  String get nameEmpty => 'חייב למלא כאן';
}
