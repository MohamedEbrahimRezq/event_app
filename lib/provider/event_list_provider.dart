import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../fire_base/firebase_files.dart';
import '../fire_base/model/events.dart';

class EventListProvider extends ChangeNotifier {
  int selectedTab = 0;
  List<Event> addedEventList = [];
  List<Event> filteredEventList = [];
  List<String> eventList = [
    'All',
    'Sport',
    'Birthday',
    'Meeting',
    'Gaming',
    'Eating',
    'Holiday',
    'Exhibition',
    'Book Club',
    'Work Shop',
  ];

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
