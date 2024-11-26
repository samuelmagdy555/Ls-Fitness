// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hey,`
  String get home_Hey {
    return Intl.message(
      'Hey,',
      name: 'home_Hey',
      desc: '',
      args: [],
    );
  }

  /// `Find`
  String get home_Find {
    return Intl.message(
      'Find',
      name: 'home_Find',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'home_your Workout' key

  /// `Vitamins`
  String get home_Vitamins {
    return Intl.message(
      'Vitamins',
      name: 'home_Vitamins',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'home_Food Calculator' key

  /// `Nutrition`
  String get home_Nutrition {
    return Intl.message(
      'Nutrition',
      name: 'home_Nutrition',
      desc: '',
      args: [],
    );
  }

  /// `Your`
  String get home_Your {
    return Intl.message(
      'Your',
      name: 'home_Your',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get home_Progress {
    return Intl.message(
      'Progress',
      name: 'home_Progress',
      desc: '',
      args: [],
    );
  }

  /// `Vitamin`
  String get Vitamin {
    return Intl.message(
      'Vitamin',
      name: 'Vitamin',
      desc: '',
      args: [],
    );
  }

  /// `About`
  String get Vitamin_Details_About {
    return Intl.message(
      'About',
      name: 'Vitamin_Details_About',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'Vitamin A' key

  // skipped getter for the 'Vitamin B' key

  // skipped getter for the 'Vitamin C' key

  // skipped getter for the 'Vitamin D' key

  // skipped getter for the 'Vitamin E' key

  // skipped getter for the 'Vitamin K' key

  // skipped getter for the 'Omega 3' key

  /// `carrots , sweet potatoes, and spinach`
  String get location1 {
    return Intl.message(
      'carrots , sweet potatoes, and spinach',
      name: 'location1',
      desc: '',
      args: [],
    );
  }

  /// `meat , eggs , dairy products , and whole grains`
  String get location2 {
    return Intl.message(
      'meat , eggs , dairy products , and whole grains',
      name: 'location2',
      desc: '',
      args: [],
    );
  }

  /// `citrus fruits , strawberries , and oranges`
  String get location3 {
    return Intl.message(
      'citrus fruits , strawberries , and oranges',
      name: 'location3',
      desc: '',
      args: [],
    );
  }

  /// `sunlight , fatty fish , and dairy products`
  String get location4 {
    return Intl.message(
      'sunlight , fatty fish , and dairy products',
      name: 'location4',
      desc: '',
      args: [],
    );
  }

  /// `nuts , seeds , and vegetable oils`
  String get location5 {
    return Intl.message(
      'nuts , seeds , and vegetable oils',
      name: 'location5',
      desc: '',
      args: [],
    );
  }

  /// `fatty fish like salmon and tuna , and walnuts`
  String get location6 {
    return Intl.message(
      'fatty fish like salmon and tuna , and walnuts',
      name: 'location6',
      desc: '',
      args: [],
    );
  }

  /// `Helps maintain eye health and strengthens immunity`
  String get benefits1 {
    return Intl.message(
      'Helps maintain eye health and strengthens immunity',
      name: 'benefits1',
      desc: '',
      args: [],
    );
  }

  /// `Supports energy production and nervous system health`
  String get benefits2 {
    return Intl.message(
      'Supports energy production and nervous system health',
      name: 'benefits2',
      desc: '',
      args: [],
    );
  }

  /// `Boosts immunity and maintains skin health`
  String get benefits3 {
    return Intl.message(
      'Boosts immunity and maintains skin health',
      name: 'benefits3',
      desc: '',
      args: [],
    );
  }

  /// `Supports bone health and calcium absorption`
  String get benefits4 {
    return Intl.message(
      'Supports bone health and calcium absorption',
      name: 'benefits4',
      desc: '',
      args: [],
    );
  }

  /// `Protects cells from damage as an antioxidant`
  String get benefits5 {
    return Intl.message(
      'Protects cells from damage as an antioxidant',
      name: 'benefits5',
      desc: '',
      args: [],
    );
  }

  /// `Supports blood clotting and bone health`
  String get benefits6 {
    return Intl.message(
      'Supports blood clotting and bone health',
      name: 'benefits6',
      desc: '',
      args: [],
    );
  }

  /// `Promotes heart health and reduces inflammation`
  String get benefits7 {
    return Intl.message(
      'Promotes heart health and reduces inflammation',
      name: 'benefits7',
      desc: '',
      args: [],
    );
  }

  /// `700-900 mcg`
  String get dailyAmount1 {
    return Intl.message(
      '700-900 mcg',
      name: 'dailyAmount1',
      desc: '',
      args: [],
    );
  }

  /// `1 to 3 mg`
  String get dailyAmount2 {
    return Intl.message(
      '1 to 3 mg',
      name: 'dailyAmount2',
      desc: '',
      args: [],
    );
  }

  /// `75-90 mg`
  String get dailyAmount3 {
    return Intl.message(
      '75-90 mg',
      name: 'dailyAmount3',
      desc: '',
      args: [],
    );
  }

  /// `600-800 IU`
  String get dailyAmount4 {
    return Intl.message(
      '600-800 IU',
      name: 'dailyAmount4',
      desc: '',
      args: [],
    );
  }

  /// `15 mg`
  String get dailyAmount5 {
    return Intl.message(
      '15 mg',
      name: 'dailyAmount5',
      desc: '',
      args: [],
    );
  }

  /// `90-120 mcg`
  String get dailyAmount6 {
    return Intl.message(
      '90-120 mcg',
      name: 'dailyAmount6',
      desc: '',
      args: [],
    );
  }

  /// `90-120 mcg`
  String get dailyAmount7 {
    return Intl.message(
      '90-120 mcg',
      name: 'dailyAmount7',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get Progress {
    return Intl.message(
      'Progress',
      name: 'Progress',
      desc: '',
      args: [],
    );
  }

  /// `Add Your Image Here`
  String get Nutrition_Add_Image {
    return Intl.message(
      'Add Your Image Here',
      name: 'Nutrition_Add_Image',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get Settings_My_Profile {
    return Intl.message(
      'My Profile',
      name: 'Settings_My_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get Settings_Log_Out {
    return Intl.message(
      'Log Out',
      name: 'Settings_Log_Out',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Settings_Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Settings_Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get Settings_Sounds {
    return Intl.message(
      'Sounds',
      name: 'Settings_Sounds',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Settings_Language {
    return Intl.message(
      'Language',
      name: 'Settings_Language',
      desc: '',
      args: [],
    );
  }

  /// `Steps Counter`
  String get Settings_Steps_Counter {
    return Intl.message(
      'Steps Counter',
      name: 'Settings_Steps_Counter',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get Settings_Edit_Profile {
    return Intl.message(
      'Edit Profile',
      name: 'Settings_Edit_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Settings_Edit {
    return Intl.message(
      'Edit',
      name: 'Settings_Edit',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get Settings_Change {
    return Intl.message(
      'Change',
      name: 'Settings_Change',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
