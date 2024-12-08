import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islamic_app/bloc/surah_bloc.dart';
import 'package:islamic_app/models/surah.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_item.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/font_manager.dart';
import '../../../../../core/utils/strings_manager.dart';
import '../../../../../core/utils/styles_manager.dart';
import '../../../../../core/utils/values_manager.dart';
import '../../../../../surah_provider.dart';

class CustomTopContainer extends StatelessWidget {
  CustomTopContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedSurah = Provider.of<SurahProvider>(context).selectedSurah;
    return Stack(
      children: [
        Container(
          height: AppSize.s150,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s20),
            color: ColorManager.lightBlueGreen,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<SurahBloc, SurahState>(builder: (context, state) {
                if (state is SurahLoading) {
                  return Center(child: const CircularProgressIndicator());
                } else if (state is SurahLoaded) {
                  return Text(
                    selectedSurah?.title ?? " ",
                    style: getMediumStyle(
                        color: ColorManager.white, fontSize: FontSize.s26),
                  );
                } else if (state is SurahError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else {
                  return Container();
                }
              }),
              const SizedBox(
                height: AppSize.s4,
              ),
              Text(
                '${AppStrings.totalAya} :${selectedSurah?.count ?? 0}',
                style: getMediumStyle(
                    color: ColorManager.white, fontSize: FontSize.s16),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
