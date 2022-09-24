import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:design_system/src/foundations/typography.dart';
import 'package:flutter/material.dart';

class LabeledChip extends StatefulWidget {
  const LabeledChip({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final ValueChanged<bool> onTap;

  @override
  State<LabeledChip> createState() => _LabeledChipState();
}

class _LabeledChipState extends State<LabeledChip> {
  bool _isSelected = false;

  void onTapChip() {
    setState(() {
      _isSelected = !_isSelected;
    });
    widget.onTap(_isSelected);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsFoundation>()!;
    final textStyles = theme.extension<AppTypographyFoundation>()!;
    return GestureDetector(
      onTap: onTapChip,
      child: Chip(
        label: Text(
          widget.label,
          style: textStyles.h3.copyWith(
            color: _isSelected ? colors.onQuinary : colors.quinary,
            fontSize: 12,
          ),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSizesFoundation.chipHorizontalPadding,
          vertical: AppSizesFoundation.chipVerticalPadding,
        ),
        backgroundColor: _isSelected ? colors.quinary : colors.surface,
        side: BorderSide(
          color: _isSelected ? Colors.transparent : colors.quinary,
          width: 1,
        ),
      ),
    );
  }
}
