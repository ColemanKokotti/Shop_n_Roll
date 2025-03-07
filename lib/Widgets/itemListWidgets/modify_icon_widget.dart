import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc|Cubit/ModifyIconCubit/icon_selector_cubit.dart';
import '../../Data/data_items.dart';


class ModifyIconWidget extends StatelessWidget {
  final String selectedIcon;
  final String documentId;
  final Function(String) onIconSelect;

  const ModifyIconWidget({super.key, 
    required this.selectedIcon,
    required this.documentId,
    required this.onIconSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconSelectorCubit = context.read<IconSelectorCubit>();

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: iconNames.length,
      itemBuilder: (context, index) {
        final String name = iconNames[index];
        final Widget iconWidget = getWidgetFromString(name, size: 30, color: theme.iconTheme.color);
        final bool isSelected = selectedIcon == name;

        return GestureDetector(
          onTap: () {
            iconSelectorCubit.updateIcon(name);
            onIconSelect(name);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? theme.secondaryHeaderColor : Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: iconWidget,
          ),
        );
      },
    );
  }
}
