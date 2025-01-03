class Event {
  static const String collectionName = 'Event';
  String id;
  String title;
  String description;
  String image;
  String eventName;
  DateTime dateTime;
  String time;
  bool isfavorite;

  Event({
    this.id = '',
    required this.title,
    required this.description,
    required this.image,
    required this.eventName,
    required this.dateTime,
    required this.time,
    this.isfavorite = false
});

  Event.fromFireStore(Map<String, dynamic> data): this (
    image: data['image'] as String,
    dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']) ,
    description: data['description'] as String,
    eventName: data['eventName'] as String,
    time: data['time'],
    title: data['title'] as String,
    id: data['id'] as String,
    isfavorite: data['isFavorite'] as bool,
  );

  Map<String, dynamic> toFireStore(){
    return {
      'id' : id,
      'title' : title,
      'description' : description,
      'eventName' : eventName,
      'image' : image,
      'dateTime' : dateTime.millisecondsSinceEpoch,
      'time' : time,
      'isFavorite' : isfavorite,

    };
  }
}