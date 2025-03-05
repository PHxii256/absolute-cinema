import 'package:flutter/material.dart';
import 'package:flutter_application/features/search/view/widgets/theater_card.dart';
import 'package:flutter_application/features/search/viewmodel/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../mock/theater_data_mock.dart';

class SearchResults extends ConsumerWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final queryName = ref.watch(queryProvider);

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          Text(
            queryName != "" ? "Showing Results For: $queryName" : "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black38),
          ),
          SizedBox(height: 20),
          queryName != ""
              ? Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [for (int i = 0; i < theatersData.length; i++) TheaterCard(theaterData: theatersData[i])],
                ),
              )
              : Container(),
        ],
      ),
    );
  }
}
