import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:islamic_app/features/home/presentation/views/widgets/surah_list_item.dart';
import 'package:islamic_app/models/surah.dart';
import 'package:islamic_app/surah_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_router.dart';

class SurahListView extends StatelessWidget {

  SurahListView({super.key});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return SurahListItem();
      },
    );
  }
}
