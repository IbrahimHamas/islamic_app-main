import 'package:flutter/material.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/audio_actions.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/audio_line.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_app_bar.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_top_container.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/upcoming_surah.dart';
import 'package:islamic_app/models/surah.dart';

import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_item.dart';

class SurahDetailsViewBody extends StatefulWidget {
  SurahDetailsViewBody({super.key});

  @override
  State<SurahDetailsViewBody> createState() => _SurahDetailsViewBodyState();
}

class _SurahDetailsViewBodyState extends State<SurahDetailsViewBody> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s24,
      ),
      child: Column(
        children: [
          const CustomAppBar(
            title: AppStrings.nowPlaying,
          ),
          const SizedBox(height: AppSize.s40),
          CustomTopContainer(),
          const SizedBox(height: AppSize.s40),
          const AudioLine(),
          const AudioActions(),
          const UpcomingSurah(),
        ],
      ),
    );
  }
}
