import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../fire_base/firebase_files.dart';
import '../fire_base/model/events.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EventListProvider extends ChangeNotifier {
  int selectedTab = 0;
  List<Event> addedEventList = [];
  List<Event> filteredEventList = [];
  List<String> eventList = [];

  void getEventNameList(BuildContext context){

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
        await FirebaseFiles.getEventCollection().get();
    addedEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filteredEventList = addedEventList;
    notifyListeners();
  }

  void getFilteredEvents() async {
    getEventNameList;
    QuerySnapshot<Event> querySnapshot =
        await FirebaseFiles.getEventCollection().get();
    addedEventList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();
    filteredEventList = addedEventList.where((event) {
      return event.eventName == eventList[selectedTab];
    }).toList();
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
}
