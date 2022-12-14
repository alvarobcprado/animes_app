import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'home_strings_en.dart';
import 'home_strings_pt.dart';

/// Callers can lookup localized strings with an instance of HomeStrings
/// returned by `HomeStrings.of(context)`.
///
/// Applications need to include `HomeStrings.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/home_strings.dart';
///
/// return MaterialApp(
///   localizationsDelegates: HomeStrings.localizationsDelegates,
///   supportedLocales: HomeStrings.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the HomeStrings.supportedLocales
/// property.
abstract class HomeStrings {
  HomeStrings(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static HomeStrings? of(BuildContext context) {
    return Localizations.of<HomeStrings>(context, HomeStrings);
  }

  static const LocalizationsDelegate<HomeStrings> delegate = _HomeStringsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @animeListPageSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Enter the anime name you are looking for'**
  String get animeListPageSearchHint;

  /// No description provided for @animeListPageLabeledCardTitle.
  ///
  /// In en, this message translates to:
  /// **'Title:'**
  String get animeListPageLabeledCardTitle;

  /// No description provided for @animeListPageLabeledCardGenre.
  ///
  /// In en, this message translates to:
  /// **'Genre:'**
  String get animeListPageLabeledCardGenre;

  /// No description provided for @animeListPageLabeledCardEpisodes.
  ///
  /// In en, this message translates to:
  /// **'Episodes:'**
  String get animeListPageLabeledCardEpisodes;

  /// No description provided for @animeInformationSoon.
  ///
  /// In en, this message translates to:
  /// **'Em breve'**
  String get animeInformationSoon;

  /// No description provided for @animeOriginalTitle.
  ///
  /// In en, this message translates to:
  /// **'Original title:'**
  String get animeOriginalTitle;

  /// No description provided for @animeEnglishTitle.
  ///
  /// In en, this message translates to:
  /// **'English title:'**
  String get animeEnglishTitle;

  /// No description provided for @animeReleaseDate.
  ///
  /// In en, this message translates to:
  /// **'Release:'**
  String get animeReleaseDate;

  /// No description provided for @animeEndDate.
  ///
  /// In en, this message translates to:
  /// **'End:'**
  String get animeEndDate;

  /// No description provided for @animeNote.
  ///
  /// In en, this message translates to:
  /// **'Note:'**
  String get animeNote;

  /// No description provided for @animeSynopsis.
  ///
  /// In en, this message translates to:
  /// **'Synopsis:'**
  String get animeSynopsis;

  /// No description provided for @animeDetailsPageFavorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get animeDetailsPageFavorite;

  /// No description provided for @favoriteAnimesPageTitleAppBar.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get favoriteAnimesPageTitleAppBar;

  /// No description provided for @favoriteAnimesPageNoAnimes.
  ///
  /// In en, this message translates to:
  /// **'Add anime to your favorites'**
  String get favoriteAnimesPageNoAnimes;

  /// No description provided for @animeListNextPageError.
  ///
  /// In en, this message translates to:
  /// **'Error loading more animes'**
  String get animeListNextPageError;
}

class _HomeStringsDelegate extends LocalizationsDelegate<HomeStrings> {
  const _HomeStringsDelegate();

  @override
  Future<HomeStrings> load(Locale locale) {
    return SynchronousFuture<HomeStrings>(lookupHomeStrings(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_HomeStringsDelegate old) => false;
}

HomeStrings lookupHomeStrings(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return HomeStringsEn();
    case 'pt': return HomeStringsPt();
  }

  throw FlutterError(
    'HomeStrings.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
