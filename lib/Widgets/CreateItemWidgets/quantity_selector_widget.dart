import 'package:flutter/material.dart';

import '../../Bloc|Cubit/CreateItemCubit/create_item_cubit.dart';

class QuantitySelectorWidget extends StatelessWidget {
  final AddButtonCubit cubit;
  final ThemeData theme;

  const QuantitySelectorWidget({super.key,
    required this.cubit,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Quantità:',
          style: TextStyle(
            color: theme.textTheme.labelLarge?.color,
            fontSize: 16,
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: theme.textTheme.labelLarge?.backgroundColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: theme.iconTheme.color,
                  ),
                  onPressed: () => cubit.decreaseQuantity(),
                ),
                Expanded(
                  child: TextField(
                    controller: cubit.quantityController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    style: TextStyle(
                      color: theme.textTheme.labelLarge?.color,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    onChanged: (value) {
                      if (int.tryParse(value) == null) {
                        cubit.quantityController.text = '1';
                        cubit.quantityController.selection = TextSelection.fromPosition(
                          TextPosition(offset: cubit.quantityController.text.length),
                        );
                      }
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: theme.iconTheme.color,
                  ),
                  onPressed: () => cubit.increaseQuantity(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
