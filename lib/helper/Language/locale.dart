import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'languages/arabic.dart';
import 'languages/english.dart';

String? langa;

class AppLocalizations {
  final Locale locale;
  String lang;
  AppLocalizations(this.locale,this.lang);


  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
  };

  String? get enterMobileNumber {
    return _localizedValues[locale.languageCode]!['enterMobileNumber'];
  }

  String? get register {
    return _localizedValues[locale.languageCode]!['register'];
  }

  String? get searchLocation {
    return _localizedValues[locale.languageCode]!['searchLocation'];
  }

  String? get enterCode {
    return _localizedValues[locale.languageCode]!['enterCode'];
  }
  String? get wishList {
    return _localizedValues[locale.languageCode]!['wishList'];
  }
  String? get categories {
    return _localizedValues[locale.languageCode]!['categories'];
  }
  String? get orContinueWith {
    return _localizedValues[locale.languageCode]!['orContinueWith'];
  }
  String? get images {
    return _localizedValues[locale.languageCode]!['images'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }
  String? get password {
    return _localizedValues[locale.languageCode]!['password'];
  }
  String? get confirmPassword {
    return _localizedValues[locale.languageCode]!['confirmPassword'];
  }
  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get backToSignIn {
    return _localizedValues[locale.languageCode]!['backToSignIn'];
  }

  String? get phoneCode {
    return _localizedValues[locale.languageCode]!['phoneCode'];
  }

  String? get enterVerificationCodeWeveSent {
    return _localizedValues[locale.languageCode]!
        ['enterVerificationCodeWeveSent'];
  }

  String? get enterVerificationCode {
    return _localizedValues[locale.languageCode]!['enterVerificationCode'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get enter6digit {
    return _localizedValues[locale.languageCode]!['enter6digit'];
  }

  String? get inLessThanAmin {
    return _localizedValues[locale.languageCode]!['inLessThanAmin'];
  }

  String? get getStarted {
    return _localizedValues[locale.languageCode]!['getStarted'];
  }

  String? get enterFullName {
    return _localizedValues[locale.languageCode]!['enterFullName'];
  }

  String? get enterEmailAddress {
    return _localizedValues[locale.languageCode]!['enterEmailAddress'];
  }

  String? get wellSendCode {
    return _localizedValues[locale.languageCode]!['wellSendCode'];
  }

  String? get signInNow {
    return _localizedValues[lang]!['signInNow'];
  }
  String? get signUpNow {
    return _localizedValues[locale.languageCode]!['signUpNow'];
  }

  String? get candidPhotographer {
    return _localizedValues[locale.languageCode]!['candidPhotographer'];
  }

  String? get choreographer {
    return _localizedValues[locale.languageCode]!['choreographer'];
  }

  String? get brideWear {
    return _localizedValues[locale.languageCode]!['brideWear'];
  }

  String? get venDorsIn {
    return _localizedValues[locale.languageCode]!['venDorsIn'];
  }

  String? get venue {
    return _localizedValues[locale.languageCode]!['venue'];
  }

  String? get lawnsBanquets {
    return _localizedValues[locale.languageCode]!['lawnsBanquets'];
  }

  String? get lawns {
    return _localizedValues[locale.languageCode]!['lawns'];
  }

  String? get banquetHalls {
    return _localizedValues[locale.languageCode]!['banquetHalls'];
  }

  String? get farmhouse {
    return _localizedValues[locale.languageCode]!['farmhouse'];
  }

  String? get resort {
    return _localizedValues[locale.languageCode]!['resort'];
  }

  String? get destinationWedding {
    return _localizedValues[locale.languageCode]!['destinationWedding'];
  }

  String? get premiumHotels {
    return _localizedValues[locale.languageCode]!['premiumHotels'];
  }

  String? get viewAllVenues {
    return _localizedValues[locale.languageCode]!['viewAllVenues'];
  }

  String? get photographer {
    return _localizedValues[locale.languageCode]!['photographer'];
  }

  String? get photoCinemato {
    return _localizedValues[locale.languageCode]!['photoCinemato'];
  }

  String? get makeup {
    return _localizedValues[locale.languageCode]!['makeup'];
  }

  String? get bridalHair {
    return _localizedValues[locale.languageCode]!['bridalHair'];
  }

  String? get decor {
    return _localizedValues[locale.languageCode]!['decor'];
  }

  String? get decoratorsWeddingPlanner {
    return _localizedValues[locale.languageCode]!['decoratorsWeddingPlanner'];
  }

  String? get catering {
    return _localizedValues[locale.languageCode]!['catering'];
  }

  String? get cateringCakeBar {
    return _localizedValues[locale.languageCode]!['cateringCakeBar'];
  }

  String? get nearYou {
    return _localizedValues[locale.languageCode]!['nearYou'];
  }
  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get vendors {
    return _localizedValues[locale.languageCode]!['vendors'];
  }

  String? get ideas {
    return _localizedValues[locale.languageCode]!['ideas'];
  }

  String? get shop {
    return _localizedValues[locale.languageCode]!['shop'];
  }

  String? get planning {
    return _localizedValues[locale.languageCode]!['planning'];
  }

  String? get musicDance {
    return _localizedValues[locale.languageCode]!['musicDance'];
  }

  String? get djMusic {
    return _localizedValues[locale.languageCode]!['djMusic'];
  }

  String? get invitationGift {
    return _localizedValues[locale.languageCode]!['invitationGift'];
  }

  String? get invitationCard {
    return _localizedValues[locale.languageCode]!['invitationCard'];
  }

  String? get diningArea {
    return _localizedValues[locale.languageCode]!['diningArea'];
  }

  String? get all {
    return _localizedValues[locale.languageCode]!['all'];
  }

  String? get preWedding {
    return _localizedValues[locale.languageCode]!['preWedding'];
  }

  String? get daysAgo {
    return _localizedValues[locale.languageCode]!['daysAgo'];
  }

  String? get similarPhotos {
    return _localizedValues[locale.languageCode]!['similarPhotos'];
  }

  String? get hey {
    return _localizedValues[locale.languageCode]!['hey'];
  }
  String? get afterName {
    return _localizedValues[locale.languageCode]!['afterName'];
  }

  String? get groomWear {
    return _localizedValues[locale.languageCode]!['groomWear'];
  }

  String? get jewellery {
    return _localizedValues[locale.languageCode]!['jewellery'];
  }

  String? get weddingShopping {
    return _localizedValues[locale.languageCode]!['weddingShopping'];
  }

  String? get itemsSaved {
    return _localizedValues[locale.languageCode]!['itemsSaved'];
  }

  String? get viewSavedItems {
    return _localizedValues[locale.languageCode]!['viewSavedItems'];
  }

  String? get sellerNearyou {
    return _localizedValues[locale.languageCode]!['sellerNearyou'];
  }

  String? get longWhiteWedding {
    return _localizedValues[locale.languageCode]!['longWhiteWedding'];
  }

  String? get whiteWeddingGown {
    return _localizedValues[locale.languageCode]!['whiteWeddingGown'];
  }

  String? get viewMore {
    return _localizedValues[locale.languageCode]!['viewMore'];
  }

  String? get weddingChecklist {
    return _localizedValues[locale.languageCode]!['weddingChecklist'];
  }

  String? get taskDone {
    return _localizedValues[locale.languageCode]!['taskDone'];
  }

  String? get viewAllChecklist {
    return _localizedValues[locale.languageCode]!['viewAllChecklist'];
  }

  String? get venueNearYou {
    return _localizedValues[locale.languageCode]!['venueNearYou'];
  }

  String? get onwards {
    return _localizedValues[locale.languageCode]!['onwards'];
  }

  String? get portfolio {
    return _localizedValues[locale.languageCode]!['portfolio'];
  }

  String? get mainHall {
    return _localizedValues[locale.languageCode]!['mainHall'];
  }

  String? get garden {
    return _localizedValues[locale.languageCode]!['garden'];
  }

  String? get conferenceHall {
    return _localizedValues[locale.languageCode]!['conferenceHall'];
  }

  String? get inbox {
    return _localizedValues[locale.languageCode]!['inbox'];
  }

  String? get helloSir {
    return _localizedValues[locale.languageCode]!['helloSir'];
  }

  String? get noWorries {
    return _localizedValues[locale.languageCode]!['noWorries'];
  }

  String? get yesAllTheGuests {
    return _localizedValues[locale.languageCode]!['yesAllTheGuests'];
  }

  String? get heyThankYou {
    return _localizedValues[locale.languageCode]!['heyThankYou'];
  }

  String? get thatWillBe {
    return _localizedValues[locale.languageCode]!['thatWillBe'];
  }

  String? get noItWillNot {
    return _localizedValues[locale.languageCode]!['noItWillNot'];
  }

  String? get sendMessage {
    return _localizedValues[locale.languageCode]!['sendMessage'];
  }
  String? get buyNow {
    return _localizedValues[locale.languageCode]!['buyNow'];
  }

  String? get letUsKnow {
    return _localizedValues[locale.languageCode]!['letUsKnow'];
  }

  String? get myFunctionTypeIs {
    return _localizedValues[locale.languageCode]!['myFunctionTypeIs'];
  }

  String? get chooseFunctionType {
    return _localizedValues[locale.languageCode]!['chooseFunctionType'];
  }

  String? get functionDateIs {
    return _localizedValues[locale.languageCode]!['functionDateIs'];
  }

  String? get numberOfGuests {
    return _localizedValues[locale.languageCode]!['numberOfGuests'];
  }

  String? get enterNumberOfGuests {
    return _localizedValues[locale.languageCode]!['enterNumberOfGuests'];
  }

  String? get startaMessage {
    return _localizedValues[locale.languageCode]!['startaMessage'];
  }

  String? get hiCentralWednue {
    return _localizedValues[locale.languageCode]!['hiCentralWednue'];
  }

  String? get helloSir1 {
    return _localizedValues[locale.languageCode]!['helloSir1'];
  }

  String? get letMeKnow {
    return _localizedValues[locale.languageCode]!['letMeKnow'];
  }

  String? get writeyourMessage {
    return _localizedValues[locale.languageCode]!['writeyourMessage'];
  }

  String? get reviews {
    return _localizedValues[locale.languageCode]!['reviews'];
  }

  String? get sheerLongSleeves {
    return _localizedValues[locale.languageCode]!['sheerLongSleeves'];
  }

  String? get offShoulderStraps {
    return _localizedValues[locale.languageCode]!['offShoulderStraps'];
  }

  String? get subtleSweetheart {
    return _localizedValues[locale.languageCode]!['subtleSweetheart'];
  }

  String? get days {
    return _localizedValues[locale.languageCode]!['days'];
  }

  String? get hrs {
    return _localizedValues[locale.languageCode]!['hrs'];
  }

  String? get mins {
    return _localizedValues[locale.languageCode]!['mins'];
  }

  String? get secs {
    return _localizedValues[locale.languageCode]!['secs'];
  }

  String? get vendorShortlist {
    return _localizedValues[locale.languageCode]!['vendorShortlist'];
  }

  String? get savedIdeas {
    return _localizedValues[locale.languageCode]!['savedIdeas'];
  }

  String? get savedShopping {
    return _localizedValues[locale.languageCode]!['savedShopping'];
  }

  String? get changePicture {
    return _localizedValues[locale.languageCode]!['changePicture'];
  }

  String? get removePicture {
    return _localizedValues[locale.languageCode]!['removePicture'];
  }

  String? get groomName {
    return _localizedValues[locale.languageCode]!['groomName'];
  }

  String? get brideName {
    return _localizedValues[locale.languageCode]!['brideName'];
  }

  String? get dateOfWedding {
    return _localizedValues[locale.languageCode]!['dateOfWedding'];
  }

  String? get enterGroomName {
    return _localizedValues[locale.languageCode]!['enterGroomName'];
  }

  String? get enterBrideName {
    return _localizedValues[locale.languageCode]!['enterBrideName'];
  }

  String? get selectDateOfWedding {
    return _localizedValues[locale.languageCode]!['selectDateOfWedding'];
  }

  String? get save {
    return _localizedValues[locale.languageCode]!['save'];
  }

  String? get myChecklist {
    return _localizedValues[locale.languageCode]!['myChecklist'];
  }

  String? get primaryTask {
    return _localizedValues[locale.languageCode]!['primaryTask'];
  }

  String? get searchAndShortlist {
    return _localizedValues[locale.languageCode]!['searchAndShortlist'];
  }

  String? get viewVenueOptions {
    return _localizedValues[locale.languageCode]!['viewVenueOptions'];
  }

  String? get saveDecorIdeas {
    return _localizedValues[locale.languageCode]!['saveDecorIdeas'];
  }

  String? get viewDecorIdeas {
    return _localizedValues[locale.languageCode]!['viewDecorIdeas'];
  }

  String? get checkoutCaterers {
    return _localizedValues[locale.languageCode]!['checkoutCaterers'];
  }

  String? get viewCaterers {
    return _localizedValues[locale.languageCode]!['viewCaterers'];
  }

  String? get shortlistDecorVendors {
    return _localizedValues[locale.languageCode]!['shortlistDecorVendors'];
  }

  String? get viewDecorVendors {
    return _localizedValues[locale.languageCode]!['viewDecorVendors'];
  }

  String? get secondaryTask {
    return _localizedValues[locale.languageCode]!['secondaryTask'];
  }

  String? get finalizeMakeupArtist {
    return _localizedValues[locale.languageCode]!['finalizeMakeupArtist'];
  }

  String? get hireDecorator {
    return _localizedValues[locale.languageCode]!['hireDecorator'];
  }

  String? get viewShortlistItems {
    return _localizedValues[locale.languageCode]!['viewShortlistItems'];
  }

  String? get checkoutJewellery {
    return _localizedValues[locale.languageCode]!['checkoutJewellery'];
  }

  String? get viewJewelleryDesignIdeas {
    return _localizedValues[locale.languageCode]!['viewJewelleryDesignIdeas'];
  }

  String? get searchBookDj {
    return _localizedValues[locale.languageCode]!['searchBookDj'];
  }

  String? get viewDjnearYou {
    return _localizedValues[locale.languageCode]!['viewDjnearYou'];
  }

  String? get finalTasks {
    return _localizedValues[locale.languageCode]!['finalTasks'];
  }

  String? get bookACake {
    return _localizedValues[locale.languageCode]!['bookACake'];
  }

  String? get shortlisted {
    return _localizedValues[locale.languageCode]!['shortlisted'];
  }

  String? get finalized {
    return _localizedValues[locale.languageCode]!['finalized'];
  }

  String? get finalize {
    return _localizedValues[locale.languageCode]!['finalize'];
  }

  String? get chat {
    return _localizedValues[locale.languageCode]!['chat'];
  }

  String? get call {
    return _localizedValues[locale.languageCode]!['call'];
  }

  String? get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'];
  }

  String? get allYourConvo {
    return _localizedValues[locale.languageCode]!['allYourConvo'];
  }

  String? get savedAndShortlists {
    return _localizedValues[locale.languageCode]!['savedAndShortlists'];
  }

  String? get viewAllSaved {
    return _localizedValues[locale.languageCode]!['viewAllSaved'];
  }

  String? get aboutUs {
    return _localizedValues[locale.languageCode]!['aboutUs'];
  }

  String? get whoWeAre1 {
    return _localizedValues[locale.languageCode]!['whoWeAre1'];
  }

  String? get support {
    return _localizedValues[locale.languageCode]!['support'];
  }

  String? get connectUsfor {
    return _localizedValues[locale.languageCode]!['connectUsfor'];
  }

  String? get privacyPolicy {
    return _localizedValues[locale.languageCode]!['privacyPolicy'];
  }

  String? get knowOurPolicy {
    return _localizedValues[locale.languageCode]!['knowOurPolicy'];
  }

  String? get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'];
  }

  String? get setYourPreferred {
    return _localizedValues[locale.languageCode]!['setYourPreferred'];
  }

  String? get faq {
    return _localizedValues[locale.languageCode]!['faq'];
  }

  String? get getYourQuestions {
    return _localizedValues[locale.languageCode]!['getYourQuestions'];
  }

  String? get everythingAboutyou {
    return _localizedValues[locale.languageCode]!['everythingAboutyou'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }
  String? get login {
    return _localizedValues[locale.languageCode]!['login'];
  }
  String? get singUp {
    return _localizedValues[locale.languageCode]!['SingUp'];
  }
  String? get howWeWork {
    return _localizedValues[locale.languageCode]!['howWeWork'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get whoWeAre {
    return _localizedValues[locale.languageCode]!['whoWeAre'];
  }

  String? get howWeStarted {
    return _localizedValues[locale.languageCode]!['howWeStarted'];
  }

  String? get language {
    return _localizedValues[locale.languageCode]!['language'];
  }

  String? get preferredLanguage {
    return _localizedValues[locale.languageCode]!['preferredLanguage'];
  }

  String? get selectPreferredLanguage {
    return _localizedValues[locale.languageCode]!['selectPreferredLanguage'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get getYourAnswers {
    return _localizedValues[locale.languageCode]!['getYourAnswers'];
  }

  String? get sun {
    return _localizedValues[locale.languageCode]!['sun'];
  }

  String? get mon {
    return _localizedValues[locale.languageCode]!['mon'];
  }

  String? get tue {
    return _localizedValues[locale.languageCode]!['tue'];
  }

  String? get wed {
    return _localizedValues[locale.languageCode]!['wed'];
  }

  String? get thr {
    return _localizedValues[locale.languageCode]!['thr'];
  }

  String? get fri {
    return _localizedValues[locale.languageCode]!['fri'];
  }

  String? get sat {
    return _localizedValues[locale.languageCode]!['sat'];
  }

  String? get june {
    return _localizedValues[locale.languageCode]!['june'];
  }

  String? get am {
    return _localizedValues[locale.languageCode]!['am'];
  }

  String? get pm {
    return _localizedValues[locale.languageCode]!['pm'];
  }

  String? get howToShop {
    return _localizedValues[locale.languageCode]!['howToShop'];
  }

  String? get howToShortlist {
    return _localizedValues[locale.languageCode]!['howToShortlist'];
  }

  String? get howToChat {
    return _localizedValues[locale.languageCode]!['howToChat'];
  }

  String? get howToChangeLanguage {
    return _localizedValues[locale.languageCode]!['howToChangeLanguage'];
  }

  String? get viewInMap {
    return _localizedValues[locale.languageCode]!['viewInMap'];
  }

  String? get share {
    return _localizedValues[locale.languageCode]!['share'];
  }

  String? get areaAvailable {
    return _localizedValues[locale.languageCode]!['areaAvailable'];
  }

  String? get about {
    return _localizedValues[locale.languageCode]!['about'];
  }

  String? get readMore {
    return _localizedValues[locale.languageCode]!['readMore'];
  }

  String? get addReview {
    return _localizedValues[locale.languageCode]!['addReview'];
  }

  String? get similarVenues {
    return _localizedValues[locale.languageCode]!['similarVenues'];
  }

  String? get sellerDetails {
    return _localizedValues[locale.languageCode]!['sellerDetails'];
  }
  String? get venues {
    return _localizedValues[locale.languageCode]!['venues'];
  }

  String? get lorem {
    return _localizedValues[locale.languageCode]!['lorem'];
  }

  String? get seating {
    return _localizedValues[locale.languageCode]!['seating'];
  }

  String? get viewAll {
    return _localizedValues[locale.languageCode]!['viewAll'];
  }

  String? get photos {
    return _localizedValues[locale.languageCode]!['photos'];
  }

  String? get selectFunctionDate {
    return _localizedValues[locale.languageCode]!['selectFunctionDate'];
  }

  String? get heySamanthaChat {
    return _localizedValues[locale.languageCode]!['heySamanthaChat'];
  }

  String? get assessories {
    return _localizedValues[locale.languageCode]!['assessories'];
  }

  String? get account {
    return _localizedValues[locale.languageCode]!['account'];
  }

  String? get connectUs {
    return _localizedValues[locale.languageCode]!['connectUs'];
  }

  String? get callUs {
    return _localizedValues[locale.languageCode]!['callUs'];
  }

  String? get mailUs {
    return _localizedValues[locale.languageCode]!['mailUs'];
  }

  String? get writeUs {
    return _localizedValues[locale.languageCode]!['writeUs'];
  }

  String? get letUs {
    return _localizedValues[locale.languageCode]!['letUs'];
  }

  String? get phoneNumberEmail {
    return _localizedValues[locale.languageCode]!['phoneNumberEmail'];
  }

  String? get addContactInfo {
    return _localizedValues[locale.languageCode]!['addContactInfo'];
  }

  String? get addIssue {
    return _localizedValues[locale.languageCode]!['addIssue'];
  }

  String? get writeMessage {
    return _localizedValues[locale.languageCode]!['writeMessage'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale,langa??'en'));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
