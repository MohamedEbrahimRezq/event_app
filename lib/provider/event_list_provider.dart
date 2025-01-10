import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../fire_base/firebase_files.dart';
import '../fire_base/model/events.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  int selectedTab = 0;
  bool isFavorite = false;
  List<Event> addedEventList = [];
  List<Event> filteredEventList = [];
  List<Event> filteredFavoriteEventList = [];
  List<String> eventList = [];

  void getEventNameList(BuildContext context) {
    eventList = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.sport,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.work_shop,
    ];
  }

  void getAllEvents() async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseFiles.getEventCollection()
            .orderBy('dateTime', descending: false)
            .get();
    addedEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filteredEventList = addedEventList;
    notifyListeners();
  }

  void getFilteredEvents() async {
    getEventNameList;
    QuerySnapshot<Event> querySnapshot =
        await FirebaseFiles.getEventCollection()
            .orderBy('dateTime', descending: false)
            .get();
    addedEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filteredEventList = addedEventList.where((event) {
      return event.eventName == eventList[selectedTab];
    }).toList();
    // todo : sort
    notifyListeners();
  }

  void changeSelectedTab(int newSelectedTab) {
    selectedTab = newSelectedTab;
    if (selectedTab == 0) {
      getAllEvents();
    } else {
      getFilteredEvents();
    }
  }

  void updateFavoriteEvents(Event event) async {
    FirebaseFiles.getEventCollection()
        .doc(event.id)
        .update({'isFavorite': !event.isfavorite}).timeout(
            Duration(milliseconds: 500), onTimeout: () {
      print('Event added to Favorite');
    });
    selectedTab == 0 ? getAllEvents() : getFilteredEvents();
    getFavoriteEvents();
    notifyListeners();
  }


  void getFavoriteEvents() async {
    var querySnapshot = await FirebaseFiles.getEventCollection()
        .orderBy('dateTime', descending: false)
        .where('isFavorite', isEqualTo: true)
        .get();
    filteredFavoriteEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  void deleteEvent(Event event){
    FirebaseFiles.getEventCollection()
        .doc(event.id)
        .delete()
        .then((value) => print("Event Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));

    notifyListeners();


  }

  void updateEventData(Event event) async {
    FirebaseFiles.getEventCollection()
        .doc(event.id)
        .update({
      'title' : event.title,
      'description' : event.description,
      'eventName' : event.eventName,
      'image' : event.image,
      'dateTime' : event.dateTime.millisecondsSinceEpoch,
      'time' : event.time,
      'isFavorite' : !event.isfavorite,
    }).timeout(
        Duration(milliseconds: 500), onTimeout: () {
      print('Event added to Favorite');
    });
    notifyListeners();
  }




}
