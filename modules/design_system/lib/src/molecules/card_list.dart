import 'package:design_system/design_system.dart';
import 'package:design_system/src/atoms/labeled_card.dart';
import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  const CardList({
    Key? key,
    required this.firstTitle,
    required this.secondTitle,
    required this.thirdTitle,
    required this.fourthTitle,
    required this.firstSubtitles,
    required this.secondSubtitles,
    required this.thirdSubtitles,
    required this.fourthSubtitles,
    required this.imageUrl,
    required this.onTap,
    required this.listLength,
  }) : super(key: key);
  final String firstTitle;
  final String secondTitle;
  final String thirdTitle;
  final String fourthTitle;
  final List<String> firstSubtitles;
  final List<String> secondSubtitles;
  final List<String> thirdSubtitles;
  final List<String> fourthSubtitles;
  final List<String> imageUrl;
  final VoidCallback onTap;
  final int listLength;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listLength,
        itemBuilder: (context, index) {
          return LabeledCard(
              firstTitle: firstTitle,
              secondTitle: secondTitle,
              thirdTitle: thirdTitle,
              fourthTitle: fourthTitle,
              firstSubtitle: firstSubtitles[index],
              secondSubtitle: secondSubtitles[index],
              thirdSubtitle: thirdSubtitles[index],
              fourthSubtitle: fourthSubtitles[index],
              imageUrl: imageUrl[index],
              onTap: onTap);
        });
  }
}
