import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_n_roll/Widgets/CreateItemWidgets/quantity_selector_widget.dart';
import 'package:shop_n_roll/Widgets/CreateItemWidgets/text_field_widget.dart';
import '../../Bloc|Cubit/CreateItemCubit/create_item_cubit.dart';
import 'action_buttons_widget.dart';
import 'icon_selector.dart';


class CreateItemDialog extends StatelessWidget {
  const CreateItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<AddButtonCubit>();
    final state = context.watch<AddButtonCubit>().state;

    return AlertDialog(
      backgroundColor: theme.scaffoldBackgroundColor,
      title: Text(
        'Aggiungi elemento',
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        color: theme.textTheme.labelLarge?.color,
        fontSize: 30,
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFieldWidget(
              controller: cubit.nameController,
              labelText: 'Nome elemento',
              theme: theme,
            ),
            SizedBox(height: 8),
            TextFieldWidget(
              controller: cubit.descriptionController,
              labelText: 'Descrizione elemento',
              theme: theme,
              maxLines: 9,
              minLines: 4,
            ),
            SizedBox(height: 8),
            QuantitySelectorWidget(cubit: cubit, theme: theme),
            SizedBox(height: 8),
            IconSelectorWidget(
              selectedIcon: state.selectedIcon,
              onIconSelect: (newIcon) => cubit.setSelectedIcon(newIcon),
            ),
            SizedBox(height: 8),
            ActionButtonsWidget(cubit: cubit, state: state),
          ],
        ),
      ),
    );
  }
}
