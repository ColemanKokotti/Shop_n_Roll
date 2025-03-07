import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc|Cubit/BuyedCubit/bought_item_cubit.dart';



class BoughtItemButtonWidget extends StatelessWidget {
  const BoughtItemButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme =Theme.of(context);
    return BlocBuilder<BuyedItemCubit, bool>(
      builder: (context, isBought) {
        return IconButton(
          icon: Icon(
            isBought ? Icons.remove_shopping_cart_outlined: Icons.shopping_cart_checkout ,
            color: isBought ? theme.iconTheme.color : theme.iconTheme.color,
          ),
          onPressed: () => context.read<BuyedItemCubit>().toggleItemStatus(),
        );
      },
    );
  }
}
