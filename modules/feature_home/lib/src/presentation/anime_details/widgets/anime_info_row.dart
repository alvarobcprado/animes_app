import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AnimeInfoRow extends StatelessWidget {
  const AnimeInfoRow({super.key, required this.title, required this.info});

  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: title.isNotEmpty,
      child: RegularRow(
        title: title,
        subtitle: info,
        isLineRestricted: false,
      ),
    );
  }
}
