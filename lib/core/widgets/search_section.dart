import 'package:flutter/material.dart';
import 'package:mythic_benz/core/widgets/input_field.dart';


class SearchSection extends StatefulWidget {
  const SearchSection({
    super.key,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.controller,
    this.onSubmitted,
  });

  final VoidCallback? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  late TextEditingController controller;
  final focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) controller.dispose();
    focusNode
      ..unfocus()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InputField(
      controller: controller,
      hintText: 'Search your favourite salad ...',
      focusNode: focusNode,
      defaultValidation: false,
      onTap: widget.onTap,
      onSubmitted: widget.onSubmitted,
      readOnly: widget.readOnly,
      prefixIcon: const Icon(Icons.search),
      onTapOutside: (_) => focusNode.unfocus(),
    );
  }
}
