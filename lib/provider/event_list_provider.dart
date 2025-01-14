import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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

  void getAllEvents(String uId) async {
    QuerySnapshot<Event> querySnapshot =
        await FirebaseFiles.getEventCollection(uId)
            .orderBy('dateTime', descending: false)
            .get();
    addedEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filteredEventList = addedEventList;
    notifyListeners();
  }

  void getFilteredEvents(String uId) async {
    getEventNameList;
    QuerySnapshot<Event> querySnapshot =
        await FirebaseFiles.getEventCollection(uId)
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

  void changeSelectedTab(int newSelectedTab, String uId) {
    selectedTab = newSelectedTab;
    if (selectedTab == 0) {
      getAllEvents(uId);
    } else {
      getFilteredEvents(uId);
    }
  }

  void updateFavoriteEvents(Event event,String uId) async {
    FirebaseFiles.getEventCollection(uId)
        .doc(event.id)
        .update({'isFavorite': !event.isfavorite}).timeout(
            Duration(milliseconds: 500), onTimeout: () {
      print('Event added to Favorite');
    });
    selectedTab == 0 ? getAllEvents(uId) : getFilteredEvents(uId);
    getFavoriteEvents(uId);
    notifyListeners();
  }

  void getFavoriteEvents(String uId) async {
    var querySnapshot = await FirebaseFiles.getEventCollection(uId)
        .orderBy('dateTime', descending: false)
        .where('isFavorite', isEqualTo: true)
        .get();
    filteredFavoriteEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
  }

  void deleteEvent(Event event, String uId){
    FirebaseFiles.getEventCollection(uId)
        .doc(event.id)
        .delete()
        .then((value) => print("Event Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));

    notifyListeners();


  }

  void updateEventData(Event event,String uId) async {
    FirebaseFiles.getEventCollection(uId)
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
