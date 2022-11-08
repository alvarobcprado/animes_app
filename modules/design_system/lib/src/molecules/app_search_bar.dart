import 'package:design_system/src/foundations/colors.dart';
import 'package:design_system/src/foundations/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSearchBar extends StatefulWidget {
  const AppSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.errorText,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final ValueSetter<String>? onSubmitted;
  final String hintText;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late bool _hasClearButton;

  @override
  void initState() {
    super.initState();
    _hasClearButton = widget.controller.text.isNotEmpty;

    widget.controller.addListener(cleanSearchListener);
  }

  @override
  void dispose() {
    widget.controller.removeListener(cleanSearchListener);
    super.dispose();
  }

  void cleanSearchListener() {
    if (widget.controller.text.isNotEmpty && !_hasClearButton) {
      setState(() {
        _hasClearButton = true;
      });
    } else if (widget.controller.text.isEmpty && _hasClearButton) {
      setState(() {
        _hasClearButton = false;
      });
    }
  }

  void _onClearField() {
    widget.controller.clear();
    widget.onChanged?.call('');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.extension<AppColorsFoundation>()!;
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      inputFormatters: widget.inputFormatters,
      onEditingComplete: widget.onSubmitted != null
          ? () => widget.onSubmitted!(widget.controller.text)
          : null,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: widget.hintText,
        errorText: widget.errorText,
        prefixIcon: GestureDetector(
          onTap: () => widget.onSubmitted?.call(widget.controller.text),
          child: Icon(
            Icons.search,
            color: colors.primary,
          ),
        ),
        suffixIcon: _hasClearButton
            ? GestureDetector(
                onTap: _onClearField,
                child: Icon(
                  Icons.clear,
                  color: colors.primary,
                ),
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizesFoundation.baseSpace * 4,
          ),
          borderSide: BorderSide(
            color: colors.primary,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            AppSizesFoundation.baseSpace * 4,
          ),
          borderSide: BorderSide(
            color: colors.primary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
