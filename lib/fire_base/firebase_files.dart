import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planning_app/fire_base/model/myUser.dart';
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

  static CollectionReference<MyUser> getUsersCollection (){
    return FirebaseFirestore.instance.collection(MyUser.collectionName)
        .withConverter(
        fromFirestore: (snapshot, options) => MyUser.fromFireStore(snapshot.data()),
        toFirestore: (myUser,_) => myUser.toFireStore()
    );
  }

  static Future<void> addUserToFireStore (MyUser myUser) {
    return getUsersCollection().doc(myUser.id).set(myUser);
  }

  static Future<MyUser?> readUserFromFireStore (String id) async{
    var querySnapshot = await getUsersCollection().doc(id).get();
    return querySnapshot.data();
  }

  static Future<void> addEventToFireStore(Event event) {
    var collection = getEventCollection();
    var docRef = collection.doc();
    event.id = docRef.id;
    return docRef.set(event);
  }
}
