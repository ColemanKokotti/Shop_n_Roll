import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc|Cubit/CreateItemCubit/create_item_cubit.dart';
import 'create_item_dialog.dart';


class CreateItemButton extends StatelessWidget {
  const CreateItemButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FloatingActionButton(
      backgroundColor: theme.cardColor,
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext dialogContext) {
            return BlocProvider.value(
              value: context.read<AddButtonCubit>(),
              child: CreateItemDialog(),
            );
          },
        );
      },
      child: Icon(
        Icons.add_circle,
        color: theme.iconTheme.color,
      ),
    );
  }
}
