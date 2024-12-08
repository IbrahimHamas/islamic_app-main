// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:islamic_app/api/surah_api.dart';
import 'package:islamic_app/bloc/surah_bloc.dart';
import 'package:islamic_app/core/utils/color_manager.dart';
import 'package:islamic_app/core/utils/styles_manager.dart';
import 'package:islamic_app/core/utils/values_manager.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_view.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/custom_top_container.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/surah_details_view_body.dart';
import 'package:islamic_app/models/surah.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../surah_provider.dart';

class SurahListItem extends StatelessWidget {
  SurahListItem({super.key});


  @override
  Widget build(BuildContext context) {
    final surahProvider = Provider.of<SurahProvider>(context);
    return BlocBuilder<SurahBloc, SurahState>(builder: (context, state) {
      if (state is SurahLoading) {
        return Center(child: const CircularProgressIndicator());
      } else if (state is SurahLoaded) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.surahs.length,
            itemBuilder: (context, i) {
           Surah surahSender = state.surahs[i];

              return Container(
                color: ColorManager.white,
                margin: const EdgeInsets.only(bottom: AppMargin.m8),
                child: ListTile(
                  onTap: (){
                    surahProvider.setSurah(surahSender);
                    GoRouter.of(context).push(
                      AppRouter.kSurahDetailsView,
                    );
                  },
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: ColorManager.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        '${surahSender.index}',
                        style: getRegularStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s20),
                      ),
                    ),
                  ),
                  title: Text(
                    surahSender.title,
                    style: getBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  subtitle: Text(
                    surahSender.place,
                    style: getMediumStyle(
                      color: ColorManager.darkGrey,
                      fontSize: FontSize.s14,
                    ),
                  ),
                  trailing: Text(
                    surahSender.titleAr,
                    style: getBoldStyle(
                      color: ColorManager.grey,
                      fontSize: FontSize.s18,
                    ),
                  ),
                ),
              );
            });
      } else if (state is SurahError) {
        return Center(
          child: Text(state.message),
        );
      } else {
        return Container();
      }
    });
  }
}
