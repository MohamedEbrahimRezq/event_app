import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:event_planning_app/ui/home_screen/tabs/homeTab/event_widget.dart';
import 'package:event_planning_app/ui/home_screen/tabs/homeTab/tab_event_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../app_utls/app_colors.dart';
import '../../../app_utls/app_styles.dart';
import '../../../fire_base/firebase_files.dart';
import '../../../fire_base/model/events.dart';
import '../../../provider/event_list_provider.dart';
import '../../provider/user_provider.dart';
import '../reuseable_widgets/custom_elevated_button.dart';
import '../reuseable_widgets/custom_text_form_feild.dart';
import 'home_screen.dart';

class EditeEventWidget extends StatefulWidget {
  static const String routeName = 'editeEvent';

  @override
  State<EditeEventWidget> createState() => _EditeEventWidgetState();
}

class _EditeEventWidgetState extends State<EditeEventWidget> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final EventWidget args =
        ModalRoute.of(context)?.settings.arguments as EventWidget;
    selectedImage = args.event.image;
    selectedEventName = args.event.eventName;
    selectedDate = args.event.dateTime;
    formatedTime = args.event.time;
    titleController.text = args.event.title;
    descriptionController.text = args.event.description;
    eventListProvider = Provider.of<EventListProvider>(context, listen: false);
    List<String> eventList = [
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
    for (int i = 0; i < eventList.length; i++) {
      if (args.event.eventName == eventList[i]) {
        selectedTab == i;
      }
    }
  }

  /*late EventListProvider eventListProvider;*/
  @override
  /*void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      EventWidget args =
          ModalRoute.of(context)?.settings.arguments as EventWidget;
      selectedImage=args.event.image;
      selectedEventName=args.event.eventName;
      selectedDate = args.event.dateTime;
      formatedTime = args.event.time;
      titleController.text = args.event.title;
      descriptionController.text = args.event.description;

      List<String> eventList = [
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
      for (int i = 0; i < eventList.length; i++) {
        if (args.event.eventName == eventList[i]) {
          selectedTab == i;
        }
      }
    });
  }*/
  int selectedTab = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  String? formatedDate;
  String? formatedTime;
  late String selectedImage;
  late String selectedEventName;
  late EventListProvider eventListProvider;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);
    EventWidget args =
        ModalRoute.of(context)?.settings.arguments as EventWidget;
    EventListProvider eventListProvider =
        Provider.of<EventListProvider>(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> eventList = [
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
    List<String> eventImageList = [
      AssetsManager.sportBg,
      AssetsManager.birthdayBg,
      AssetsManager.meetingBg,
      AssetsManager.gamingBg,
      AssetsManager.eatingBg,
      AssetsManager.holidayBg,
      AssetsManager.exhibitionBg,
      AssetsManager.bookclubBg,
      AssetsManager.workshopBg,
    ];
    selectedImage = eventImageList[selectedTab];
    selectedEventName = eventList[selectedTab];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: AppStyle.primary14bold,
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColorLight),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: height * .25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(selectedImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(top: height * .01, bottom: height * .001),
                  height: height * .05,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: eventList.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            selectedTab = index;
                            setState(() {});
                          },
                          child: TabEventWidget(
                            selectedTab: selectedTab == index ? true : false,
                            tabName: eventList[index],
                            selectedColor: AppColors.primaryColorLight,
                            unSelectedColor: AppColors.bglight,
                          ),
                        );
                      }),
                ),
                Text(
                  AppLocalizations.of(context)!.title,
                  style: AppStyle.black16medium,
                ),
                SizedBox(
                  height: height * .01,
                ),
                CustomTextFormField(
                  controller: titleController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Event Title';
                    }
                    return null;
                  },
                  borderColor: AppColors.gray,
                  preIcon: Icons.edit_note_outlined,
                  hintText: AppLocalizations.of(context)!.title,
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  AppLocalizations.of(context)!.description,
                  style: AppStyle.black16medium,
                ),
                SizedBox(
                  height: height * .015,
                ),
                CustomTextFormField(
                  controller: descriptionController,
                  validator: (text) {
                    if (text == null || text.isEmpty) {
                      return 'Please Enter Event Description';
                    }
                    return null;
                  },
                  borderColor: AppColors.gray,
                  hintText: AppLocalizations.of(context)!.description,
                  numLines: 5,
                ),
                SizedBox(
                  height: height * .015,
                ),
                Row(
                  children: [
                    Icon(Icons.date_range_outlined),
                    SizedBox(
                      width: width * .015,
                    ),
                    Text(
                      AppLocalizations.of(context)!.eventDate,
                      style: AppStyle.black16medium,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        chooseDate();
                      },
                      child: Text(
                        selectedDate == null
                            ? AppLocalizations.of(context)!.chooseDate
                            : DateFormat('dd/MM/yyyy').format(selectedDate!),
                        style: AppStyle.primary14bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .015,
                ),
                Row(
                  children: [
                    Icon(Icons.access_time),
                    SizedBox(
                      width: width * .015,
                    ),
                    Text(
                      AppLocalizations.of(context)!.eventTime,
                      style: AppStyle.black16medium,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        chooseTime();
                      },
                      child: Text(
                        selectedTime == null
                            ? AppLocalizations.of(context)!.chooseTime
                            : formatedTime!,
                        style: AppStyle.primary14bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * .015,
                ),
                Text(
                  AppLocalizations.of(context)!.location,
                  style: AppStyle.black16medium,
                ),
                SizedBox(
                  height: height * .015,
                ),
                CustomElevatedButton(
                  onButtonClicked: () {},
                  preIcon: AssetsManager.locationIcon,
                  buttonColor: AppColors.bglight,
                  buttonName: AppLocalizations.of(context)!.location,
                  textColor: AppColors.blue,
                  borderColor: AppColors.blue,
                  afterIcon: AssetsManager.arrow_icon,
                ),
                SizedBox(
                  height: height * .015,
                ),
                CustomElevatedButton(
                    onButtonClicked: () {
                      eventListProvider.deleteEvent(
                          args.event, userProvider.currentUser!.id);
                      eventListProvider
                          .getAllEvents(userProvider.currentUser!.id);
                      eventListProvider
                          .getFavoriteEvents(userProvider.currentUser!.id);
                      addEventButton();
                    },
                    buttonColor: AppColors.blue,
                    buttonName: AppLocalizations.of(context)!.updateEvent,
                    textColor: AppColors.white,
                    borderColor: AppColors.transparent)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEventButton() {
    EventListProvider eventListProvider =
        Provider.of<EventListProvider>(context);
    if (formKey.currentState?.validate() == true) {
      // todo:firebase logic
      Event event = Event(
          title: titleController.text,
          description: descriptionController.text,
          image: selectedImage,
          eventName: selectedEventName,
          dateTime: selectedDate!,
          time: formatedTime!);
      var userProvider = Provider.of<UserProvider>(context, listen: false);
      FirebaseFiles.addEventToFireStore(event, userProvider.currentUser!.id)
          .timeout(Duration(milliseconds: 500), onTimeout: () {});
      print('Event Added Successfully.');
      eventListProvider.getAllEvents(userProvider.currentUser!.id);
      Navigator.pushReplacementNamed(context, HomeScreen.routeName);
    }
  }

  void chooseDate() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2035, 9, 7, 17, 30));
    selectedDate = chosenDate;
    formatedDate = DateFormat('dd/mm/yyyy').format(selectedDate!);
    setState(() {});
  }

  void chooseTime() async {
    var chosenTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    selectedTime = chosenTime;
    formatedTime = selectedTime!.format(context);
    setState(() {});
  }
}
