import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/api/surah_api.dart';
import 'package:islamic_app/bloc/surah_bloc.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/font_manager.dart';
import 'package:islamic_app/core/utils/strings_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/core/utils/values_manager.dart';
import 'package:islamic_app/models/surah.dart';
import 'package:islamic_app/surah_provider.dart';
import 'package:provider/provider.dart';

class UpcomingSurah extends StatelessWidget {
  const UpcomingSurah({super.key});

  @override
  Widget build(BuildContext context) {
    final choicedSurah = Provider.of<SurahProvider>(context).selectedSurah;

    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.upcomingSurah,
                style: getBoldStyle(
                    fontSize: FontSize.s20, color: ColorManager.black),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 4, // Adjust this based on your needs
                itemBuilder: (context, i) {
                  return upcomingSurah(surahName: choicedSurah!.titleAr);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding upcomingSurah({required String surahName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              color: ColorManager.lightBlueGreen,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_right,
              color: ColorManager.white,
              size: 30,
            ),
          ),
          Text(
            surahName,
            style: getSemiBoldStyle(fontSize: FontSize.s20),
          ),
        ],
      ),
    );
  }
}
