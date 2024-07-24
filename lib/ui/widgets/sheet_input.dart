import 'package:flutter/material.dart';

class SheetInput extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final String hintText;
  final VoidCallback? onClearTap;

  const SheetInput({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.hintText,
    this.onClearTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      width: double.infinity,
      height: 46.0,
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.5,
          color: Theme.of(context).dividerColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).cardColor,
      ),
      child: TextField(
          controller: textEditingController,
          focusNode: focusNode,
          enableSuggestions: false,
          autocorrect: false,
          keyboardAppearance: Brightness.light,
          keyboardType: TextInputType.text,
          cursorColor: Theme.of(context).primaryColor,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.sentences,
          style: Theme.of(context).textTheme.labelSmall,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(bottom: 4.0),
            counterText: '',
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).iconTheme.color?.withOpacity(0.5)),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          onEditingComplete: () => FocusScope.of(context).unfocus()),
    );
  }
}
