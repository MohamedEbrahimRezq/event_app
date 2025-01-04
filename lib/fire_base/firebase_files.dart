import 'package:cloud_firestore/cloud_firestore.dart';
import 'model/events.dart';

class FirebaseFiles {
  static CollectionReference<Event> getEventCollection() {
    return FirebaseFirestore.instance
        .collection(Event.collectionName)
        .withConverter<Event>(
            fromFirestore: (snapshot, option) =>
                Event.fromFireStore(snapshot.data()!),
            toFirestore: (event, _) => event.toFireStore());
  }

  static Future<void> addEventToFireStore(Event event) {
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }
}
