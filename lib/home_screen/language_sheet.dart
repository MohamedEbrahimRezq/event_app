import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.english,style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueAccent
              ),),
              Icon(Icons.check, size: 30,color:  Colors.blueAccent,),
            ],
          ),
          SizedBox(height: height*0.02,),
          Text(AppLocalizations.of(context)!.arabic,style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black
          ),),
        ],
      ),
    );
  }
}
