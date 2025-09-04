import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class IngredientRow extends StatelessWidget {
  final int index;
  final List<Map<String, TextEditingController>> ingredients;
  final void Function(int) removeIngredient;

  const IngredientRow({
    required this.index,
    required this.ingredients,
    required this.removeIngredient,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CustomTextField(
              controller: ingredients[index]['amount']!,
              hintText: 'Amount',
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: CustomTextField(
              controller: ingredients[index]['name']!,
              hintText: 'Ingredient name',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => removeIngredient(index),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Color(0xFFFF4757),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
