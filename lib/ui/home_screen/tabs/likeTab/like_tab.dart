import 'package:event_planning_app/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../app_utls/app_colors.dart';
import '../../../../app_utls/app_styles.dart';
import '../../../../provider/event_list_provider.dart';
import '../../../reuseable_widgets/custom_text_form_feild.dart';
import '../homeTab/event_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class LikeTab extends StatelessWidget {
  const LikeTab({super.key});

  @override
  Widget build(BuildContext context) {
   var eventListProvider = Provider.of<EventListProvider>(context);
   var userProvider = Provider.of<UserProvider>(context);
   if(eventListProvider.filteredFavoriteEventList.isEmpty){
     eventListProvider.getFavoriteEvents(userProvider.currentUser!.id);
   }
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: height * .07,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: CustomTextFormField(
                borderColor: AppColors.primaryColorLight,
                preIcon: Icons.search_outlined,
                hintText: AppLocalizations.of(context)!.search,
              ),
            ),
            Expanded(
              child: eventListProvider.filteredFavoriteEventList.isEmpty
                  ? Center(
                child: Text(
                  'No Favorite Event Added Yet.',
                  style: AppStyle.black16medium,
                ),
              )
                  : ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: eventListProvider.filteredFavoriteEventList.length,
                  itemBuilder:
                      (context, index) {
                    return EventWidget(event: eventListProvider.filteredFavoriteEventList[index],
                    );
                  }
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
