import 'package:design_system/src/models/labeled_card/labeled_card_text.dart';

class LabeledCardItem {
  LabeledCardItem({
    required this.labels,
    required this.imageUrl,
  });
  final List<LabeledCardText> labels;
  final String imageUrl;
}
