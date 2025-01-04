import 'package:event_planning_app/app_utls/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../app_utls/app_colors.dart';
import '../../../app_utls/app_styles.dart';
import '../../../fire_base/firebase_files.dart';
import '../../../fire_base/model/events.dart';
import '../../../provider/event_list_provider.dart';
import '../../reuseable_widgets/custom_elevated_button.dart';
import '../../reuseable_widgets/custom_text_form_feild.dart';
import '../tabs/homeTab/tab_event_widget.dart';

class CreateEvent extends StatefulWidget {
  static const String routeName = 'createEvent';

  const CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  int selectedTab = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  String? formatedDate;
  String? formatedTime;
  String selectedImage = '';
  String selectedEventName = '';
  late EventListProvider eventListProvider;

  @override
  Widget build(BuildContext context) {
    eventListProvider = Provider.of<EventListProvider>(context);
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
                CustomElevatedButton(
                    onButtonClicked: () {
                      addEventButton();
                    },
                    buttonColor: AppColors.blue,
                    buttonName: AppLocalizations.of(context)!.add_event,
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
    if (formKey.currentState?.validate() == true) {
      // todo:firebase logic
      Event event = Event(
          title: titleController.text,
          description: descriptionController.text,
          image: selectedImage,
          eventName: selectedEventName,
          dateTime: selectedDate!,
          time: formatedTime!);
      FirebaseFiles.addEventToFireStore(event)
          .timeout(Duration(milliseconds: 500), onTimeout: () {});
      print('Event Added Successfully.');
      eventListProvider.getAllEvents();
      Navigator.pop(context);
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
