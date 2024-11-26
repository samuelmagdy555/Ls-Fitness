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

  /// `Steps Counter`
  String get Steps_Counter {
    return Intl.message(
      'Steps Counter',
      name: 'Steps_Counter',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Steps_Counter_Error {
    return Intl.message(
      'Error',
      name: 'Steps_Counter_Error',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get Steps_Counter_Steps {
    return Intl.message(
      'Step',
      name: 'Steps_Counter_Steps',
      desc: '',
      args: [],
    );
  }

  /// `Target : `
  String get Steps_Counter_Target {
    return Intl.message(
      'Target : ',
      name: 'Steps_Counter_Target',
      desc: '',
      args: [],
    );
  }

  /// `Add Target Steps`
  String get Steps_Counter_Set_Target {
    return Intl.message(
      'Add Target Steps',
      name: 'Steps_Counter_Set_Target',
      desc: '',
      args: [],
    );
  }

  /// `Set`
  String get Steps_Counter_Set {
    return Intl.message(
      'Set',
      name: 'Steps_Counter_Set',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Profile {
    return Intl.message(
      'Phone',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Profile_Email {
    return Intl.message(
      'Email',
      name: 'Profile_Email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Profile_Gender {
    return Intl.message(
      'Gender',
      name: 'Profile_Gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Profile_Age {
    return Intl.message(
      'Age',
      name: 'Profile_Age',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get Profile_Length {
    return Intl.message(
      'Length',
      name: 'Profile_Length',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get Profile_Weight {
    return Intl.message(
      'Weight',
      name: 'Profile_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Target Weight`
  String get Profile_Target_Weight {
    return Intl.message(
      'Target Weight',
      name: 'Profile_Target_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Profile_Edit {
    return Intl.message(
      'Edit',
      name: 'Profile_Edit',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Profile_Logout {
    return Intl.message(
      'Logout',
      name: 'Profile_Logout',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get Change_Password {
    return Intl.message(
      'Change Password',
      name: 'Change_Password',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get Change_Password_Old {
    return Intl.message(
      'Old Password',
      name: 'Change_Password_Old',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get Change_Password_New {
    return Intl.message(
      'New Password',
      name: 'Change_Password_New',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get Change_Password_Confirm {
    return Intl.message(
      'Confirm Password',
      name: 'Change_Password_Confirm',
      desc: '',
      args: [],
    );
  }

  /// `Old Password Incorrect`
  String get Change_Password_Error {
    return Intl.message(
      'Old Password Incorrect',
      name: 'Change_Password_Error',
      desc: '',
      args: [],
    );
  }

  /// `Change Password Successfully`
  String get Change_Password_Success {
    return Intl.message(
      'Change Password Successfully',
      name: 'Change_Password_Success',
      desc: '',
      args: [],
    );
  }

  /// `Update Successful`
  String get Change_Password_Success_Message {
    return Intl.message(
      'Update Successful',
      name: 'Change_Password_Success_Message',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get Change_Password_Required {
    return Intl.message(
      'Required',
      name: 'Change_Password_Required',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Change_Password_Submit {
    return Intl.message(
      'Submit',
      name: 'Change_Password_Submit',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get Edit_Profile {
    return Intl.message(
      'Edit Profile',
      name: 'Edit_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Change Photo Profile`
  String get Edit_Profile_Photo {
    return Intl.message(
      'Change Photo Profile',
      name: 'Edit_Profile_Photo',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get Edit_Profile_Username {
    return Intl.message(
      'Username',
      name: 'Edit_Profile_Username',
      desc: '',
      args: [],
    );
  }

  /// `Phone`
  String get Edit_Profile_Phone {
    return Intl.message(
      'Phone',
      name: 'Edit_Profile_Phone',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get Edit_Profile_Email {
    return Intl.message(
      'Email',
      name: 'Edit_Profile_Email',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Edit_Profile_Gender {
    return Intl.message(
      'Gender',
      name: 'Edit_Profile_Gender',
      desc: '',
      args: [],
    );
  }

  /// `Age`
  String get Edit_Profile_Age {
    return Intl.message(
      'Age',
      name: 'Edit_Profile_Age',
      desc: '',
      args: [],
    );
  }

  /// `Length`
  String get Edit_Profile_Length {
    return Intl.message(
      'Length',
      name: 'Edit_Profile_Length',
      desc: '',
      args: [],
    );
  }

  /// `Weight`
  String get Edit_Profile_Weight {
    return Intl.message(
      'Weight',
      name: 'Edit_Profile_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Target Weight`
  String get Edit_Profile_Target_Weight {
    return Intl.message(
      'Target Weight',
      name: 'Edit_Profile_Target_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get Edit_Profile_Edit {
    return Intl.message(
      'Edit',
      name: 'Edit_Profile_Edit',
      desc: '',
      args: [],
    );
  }

  /// `Save Profile`
  String get Edit_Profile_Save_Profile {
    return Intl.message(
      'Save Profile',
      name: 'Edit_Profile_Save_Profile',
      desc: '',
      args: [],
    );
  }

  /// `Sounds`
  String get Sounds {
    return Intl.message(
      'Sounds',
      name: 'Sounds',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `Change`
  String get Change {
    return Intl.message(
      'Change',
      name: 'Change',
      desc: '',
      args: [],
    );
  }

  /// `Warmup`
  String get Person_Warmup {
    return Intl.message(
      'Warmup',
      name: 'Person_Warmup',
      desc: '',
      args: [],
    );
  }

  /// `Neck`
  String get Person_Neck {
    return Intl.message(
      'Neck',
      name: 'Person_Neck',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get Person_Chest {
    return Intl.message(
      'Chest',
      name: 'Person_Chest',
      desc: '',
      args: [],
    );
  }

  /// `Triceps`
  String get Person_Triceps {
    return Intl.message(
      'Triceps',
      name: 'Person_Triceps',
      desc: '',
      args: [],
    );
  }

  /// `Biceps`
  String get Person_Biceps {
    return Intl.message(
      'Biceps',
      name: 'Person_Biceps',
      desc: '',
      args: [],
    );
  }

  /// `Cardio`
  String get Person_Cardio {
    return Intl.message(
      'Cardio',
      name: 'Person_Cardio',
      desc: '',
      args: [],
    );
  }

  /// `Calves`
  String get Person_Calves {
    return Intl.message(
      'Calves',
      name: 'Person_Calves',
      desc: '',
      args: [],
    );
  }

  /// `Legs`
  String get Person_Legs {
    return Intl.message(
      'Legs',
      name: 'Person_Legs',
      desc: '',
      args: [],
    );
  }

  /// `Traps`
  String get Person_Traps {
    return Intl.message(
      'Traps',
      name: 'Person_Traps',
      desc: '',
      args: [],
    );
  }

  /// `Forearms`
  String get Person_Forearms {
    return Intl.message(
      'Forearms',
      name: 'Person_Forearms',
      desc: '',
      args: [],
    );
  }

  /// `Lats`
  String get Person_Lats {
    return Intl.message(
      'Lats',
      name: 'Person_Lats',
      desc: '',
      args: [],
    );
  }

  /// `Abs`
  String get Person_Abs {
    return Intl.message(
      'Abs',
      name: 'Person_Abs',
      desc: '',
      args: [],
    );
  }

  /// `Lower Back`
  String get Person_LowerBack {
    return Intl.message(
      'Lower Back',
      name: 'Person_LowerBack',
      desc: '',
      args: [],
    );
  }

  /// `Shoulder`
  String get Person_Shoulder {
    return Intl.message(
      'Shoulder',
      name: 'Person_Shoulder',
      desc: '',
      args: [],
    );
  }

  /// `Hamstrings`
  String get Person_Hamstrings {
    return Intl.message(
      'Hamstrings',
      name: 'Person_Hamstrings',
      desc: '',
      args: [],
    );
  }

  /// `Glutes`
  String get Person_Glutes {
    return Intl.message(
      'Glutes',
      name: 'Person_Glutes',
      desc: '',
      args: [],
    );
  }

  /// `Quads`
  String get Person_Quads {
    return Intl.message(
      'Quads',
      name: 'Person_Quads',
      desc: '',
      args: [],
    );
  }

  /// `Adductors`
  String get Person_Adductors {
    return Intl.message(
      'Adductors',
      name: 'Person_Adductors',
      desc: '',
      args: [],
    );
  }

  /// `Flip`
  String get Person_Flip {
    return Intl.message(
      'Flip',
      name: 'Person_Flip',
      desc: '',
      args: [],
    );
  }

  /// `Goals`
  String get Goals {
    return Intl.message(
      'Goals',
      name: 'Goals',
      desc: '',
      args: [],
    );
  }

  /// `Body Data`
  String get AgeSelection_Body_Data {
    return Intl.message(
      'Body Data',
      name: 'AgeSelection_Body_Data',
      desc: '',
      args: [],
    );
  }

  /// `Your age`
  String get AgeSelection_Age {
    return Intl.message(
      'Your age',
      name: 'AgeSelection_Age',
      desc: '',
      args: [],
    );
  }

  /// `years old`
  String get AgeSelection_Years_Old {
    return Intl.message(
      'years old',
      name: 'AgeSelection_Years_Old',
      desc: '',
      args: [],
    );
  }

  /// `Age information helps us more accurately\nassess your metabolic level`
  String get AgeSelection_Age_Information {
    return Intl.message(
      'Age information helps us more accurately\nassess your metabolic level',
      name: 'AgeSelection_Age_Information',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: <15% \nYou need to increase your nutrient intake and maintain muscle mass through exercise`
  String get CurrentBody1 {
    return Intl.message(
      'Your Estimated Body Fat: <15% \nYou need to increase your nutrient intake and maintain muscle mass through exercise',
      name: 'CurrentBody1',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: 15-20%\nYou are at a normal body fat level! Try the personalized plan for you to keep your body active`
  String get CurrentBody2 {
    return Intl.message(
      'Your Estimated Body Fat: 15-20%\nYou are at a normal body fat level! Try the personalized plan for you to keep your body active',
      name: 'CurrentBody2',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: 21-30%\nYour body fat percentage is slightly higher and you need to exercise properly to get back to a healthy level`
  String get CurrentBody3 {
    return Intl.message(
      'Your Estimated Body Fat: 21-30%\nYour body fat percentage is slightly higher and you need to exercise properly to get back to a healthy level',
      name: 'CurrentBody3',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: 31-40%\nThe current body fate rate is a bit high so lets start exercising to burn fat`
  String get CurrentBody4 {
    return Intl.message(
      'Your Estimated Body Fat: 31-40%\nThe current body fate rate is a bit high so lets start exercising to burn fat',
      name: 'CurrentBody4',
      desc: '',
      args: [],
    );
  }

  /// `Your Estimated Body Fat: >40%\nHigh body fat percentage may lead to health problems.Focus on fitness and diet!`
  String get CurrentBody5 {
    return Intl.message(
      'Your Estimated Body Fat: >40%\nHigh body fat percentage may lead to health problems.Focus on fitness and diet!',
      name: 'CurrentBody5',
      desc: '',
      args: [],
    );
  }

  /// `Body Data`
  String get CurrentBody_Body_Data {
    return Intl.message(
      'Body Data',
      name: 'CurrentBody_Body_Data',
      desc: '',
      args: [],
    );
  }

  /// `What’s your current body shape`
  String get CurrentBody_Shape {
    return Intl.message(
      'What’s your current body shape',
      name: 'CurrentBody_Shape',
      desc: '',
      args: [],
    );
  }

  /// `Do you follow any of \n  these diets`
  String get Diets_Question {
    return Intl.message(
      'Do you follow any of \n  these diets',
      name: 'Diets_Question',
      desc: '',
      args: [],
    );
  }

  /// `No Dietary Restrictions`
  String get Diets_Restrictions {
    return Intl.message(
      'No Dietary Restrictions',
      name: 'Diets_Restrictions',
      desc: '',
      args: [],
    );
  }

  /// `Vegetation`
  String get Diets_Vegetation {
    return Intl.message(
      'Vegetation',
      name: 'Diets_Vegetation',
      desc: '',
      args: [],
    );
  }

  /// `Vegan`
  String get Diets_Vegan {
    return Intl.message(
      'Vegan',
      name: 'Diets_Vegan',
      desc: '',
      args: [],
    );
  }

  /// `Keto`
  String get Diets_Keto {
    return Intl.message(
      'Keto',
      name: 'Diets_Keto',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get Diets_Other {
    return Intl.message(
      'Other',
      name: 'Diets_Other',
      desc: '',
      args: [],
    );
  }

  /// `thanks for your time`
  String get End {
    return Intl.message(
      'thanks for your time',
      name: 'End',
      desc: '',
      args: [],
    );
  }

  /// `Do you experience any of \n    the following issues`
  String get Experience_Question {
    return Intl.message(
      'Do you experience any of \n    the following issues',
      name: 'Experience_Question',
      desc: '',
      args: [],
    );
  }

  /// `Prolonged sitting`
  String get Experience_Prolonged {
    return Intl.message(
      'Prolonged sitting',
      name: 'Experience_Prolonged',
      desc: '',
      args: [],
    );
  }

  /// `Poor Sleep Quality`
  String get Experience_Poor_Sleep_Quality {
    return Intl.message(
      'Poor Sleep Quality',
      name: 'Experience_Poor_Sleep_Quality',
      desc: '',
      args: [],
    );
  }

  /// `Dietary issues`
  String get Experience_Dietary_issues {
    return Intl.message(
      'Dietary issues',
      name: 'Experience_Dietary_issues',
      desc: '',
      args: [],
    );
  }

  /// `None, Iam healthy! `
  String get Experience_None_Iam_healthy {
    return Intl.message(
      'None, Iam healthy! ',
      name: 'Experience_None_Iam_healthy',
      desc: '',
      args: [],
    );
  }

  /// `What’s your main goal?`
  String get Main_Goal {
    return Intl.message(
      'What’s your main goal?',
      name: 'Main_Goal',
      desc: '',
      args: [],
    );
  }

  /// `We’ll tailor the best blend of strength and cardio training to align with your goal?`
  String get Goal_Best_Strategy {
    return Intl.message(
      'We’ll tailor the best blend of strength and cardio training to align with your goal?',
      name: 'Goal_Best_Strategy',
      desc: '',
      args: [],
    );
  }

  /// `Lose Weight`
  String get Goal_Lose_Weight {
    return Intl.message(
      'Lose Weight',
      name: 'Goal_Lose_Weight',
      desc: '',
      args: [],
    );
  }

  /// `Build Muscle`
  String get Goal_Build_Muscle {
    return Intl.message(
      'Build Muscle',
      name: 'Goal_Build_Muscle',
      desc: '',
      args: [],
    );
  }

  /// `Keep Fit`
  String get Goal_Keep_Fit {
    return Intl.message(
      'Keep Fit',
      name: 'Goal_Keep_Fit',
      desc: '',
      args: [],
    );
  }

  /// `What fitness equipment can you use?`
  String get what_fitness_equipment {
    return Intl.message(
      'What fitness equipment can you use?',
      name: 'what_fitness_equipment',
      desc: '',
      args: [],
    );
  }

  /// `No equipment`
  String get no_equipment {
    return Intl.message(
      'No equipment',
      name: 'no_equipment',
      desc: '',
      args: [],
    );
  }

  /// `Portable equipment`
  String get portable_equipment {
    return Intl.message(
      'Portable equipment',
      name: 'portable_equipment',
      desc: '',
      args: [],
    );
  }

  /// `Gym equipment`
  String get gym_equipment {
    return Intl.message(
      'Gym equipment',
      name: 'gym_equipment',
      desc: '',
      args: [],
    );
  }

  /// `What is your gender?`
  String get what_is_your_gender {
    return Intl.message(
      'What is your gender?',
      name: 'what_is_your_gender',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Body Data`
  String get body_data {
    return Intl.message(
      'Body Data',
      name: 'body_data',
      desc: '',
      args: [],
    );
  }

  /// `Your height`
  String get your_height {
    return Intl.message(
      'Your height',
      name: 'your_height',
      desc: '',
      args: [],
    );
  }

  /// `Height information helps us calculate your BMI more accurately`
  String get height_info {
    return Intl.message(
      'Height information helps us calculate your BMI more accurately',
      name: 'height_info',
      desc: '',
      args: [],
    );
  }

  /// `FT`
  String get ft {
    return Intl.message(
      'FT',
      name: 'ft',
      desc: '',
      args: [],
    );
  }

  /// `CM`
  String get cm {
    return Intl.message(
      'CM',
      name: 'cm',
      desc: '',
      args: [],
    );
  }

  /// `Have you suffered any injuries recently?`
  String get recent_injuries_question {
    return Intl.message(
      'Have you suffered any injuries recently?',
      name: 'recent_injuries_question',
      desc: '',
      args: [],
    );
  }

  /// `None. I am healthy`
  String get none_healthy {
    return Intl.message(
      'None. I am healthy',
      name: 'none_healthy',
      desc: '',
      args: [],
    );
  }

  /// `Shoulder`
  String get shoulder {
    return Intl.message(
      'Shoulder',
      name: 'shoulder',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Waist`
  String get waist {
    return Intl.message(
      'Waist',
      name: 'waist',
      desc: '',
      args: [],
    );
  }

  /// `Wrist`
  String get wrist {
    return Intl.message(
      'Wrist',
      name: 'wrist',
      desc: '',
      args: [],
    );
  }

  /// `Knee`
  String get knee {
    return Intl.message(
      'Knee',
      name: 'knee',
      desc: '',
      args: [],
    );
  }

  /// `Leg`
  String get leg {
    return Intl.message(
      'Leg',
      name: 'leg',
      desc: '',
      args: [],
    );
  }

  /// `Ankle`
  String get ankle {
    return Intl.message(
      'Ankle',
      name: 'ankle',
      desc: '',
      args: [],
    );
  }

  /// `How would you rate your fitness level?`
  String get fitness_level_question {
    return Intl.message(
      'How would you rate your fitness level?',
      name: 'fitness_level_question',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advanced`
  String get advanced {
    return Intl.message(
      'Advanced',
      name: 'advanced',
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
