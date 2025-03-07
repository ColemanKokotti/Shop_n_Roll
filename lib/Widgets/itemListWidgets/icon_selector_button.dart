import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc|Cubit/ModifyIconCubit/icon_selector_cubit.dart';
import '../../Bloc|Cubit/ModifyIconCubit/icon_selector_state.dart';
import '../../Data/data_items.dart';
import 'modify_icon_widget.dart';

class IconSelectorButton extends StatelessWidget {
  final String currentIconName;
  final String documentId;
  final Function(String) onIconChanged;

  const IconSelectorButton({
    super.key,
    required this.currentIconName,
    required this.documentId,
    required this.onIconChanged,
  });

  void _showIconSelector(BuildContext context, IconSelectorCubit cubit) {
    final theme = Theme.of(context);

    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return BlocProvider.value(
          value: cubit,
          child: BlocBuilder<IconSelectorCubit, IconSelectorState>(
            builder: (context, state) {
              return AlertDialog(
                backgroundColor: theme.cardColor,
                title: Text(
                  'Seleziona un\'icona per la modifica',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.textTheme.labelLarge?.color,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                content: SizedBox(
                  width: 300,
                  height: 150,
                  child: ModifyIconWidget(
                    selectedIcon: state.currentIconName,
                    documentId: documentId,
                    onIconSelect: (newIcon) {},
                  ),
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Annulla', style: TextStyle(fontSize: 15)),
                      ),
                      TextButton(
                        onPressed: () {
                          onIconChanged(state.currentIconName);
                          Navigator.of(context).pop();
                        },
                        child: Text('Conferma', style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocProvider(
      create: (context) => IconSelectorCubit(
        initialIconName: currentIconName,
        documentId: documentId,
      ),
      child: BlocBuilder<IconSelectorCubit, IconSelectorState>(
        builder: (context, state) {
          final cubit = context.read<IconSelectorCubit>();
          return IconButton(
            icon: getWidgetFromString(state.currentIconName, color: theme.iconTheme.color),
            onPressed: () => _showIconSelector(context, cubit),
          );
        },
      ),
    );
  }
}
