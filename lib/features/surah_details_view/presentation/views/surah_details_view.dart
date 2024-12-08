import 'package:flutter/material.dart';
import 'package:islamic_app/features/surah_details_view/presentation/views/widgets/surah_details_view_body.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_item.dart';

class SurahDetailsView extends StatelessWidget {
  const SurahDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SurahDetailsViewBody(),
      ),
    );
  }
}
