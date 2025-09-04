import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class InstructionRow extends StatelessWidget {
  final int index;
  final List<TextEditingController> instructions;
  final void Function(int) removeInstruction;

  const InstructionRow({
    required this.index,
    required this.instructions,
    required this.removeInstruction,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.only(top: 8),
            decoration: BoxDecoration(
              color: Color(0xFFFF6B6B),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${index + 1}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: CustomTextField(
              controller: instructions[index],
              hintText: 'Step ${index + 1} instructions...',
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () => removeInstruction(index),
            child: Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(top: 8),
              decoration: BoxDecoration(
                color: Color(0xFFFF4757),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.close, color: Colors.white, size: 16),
            ),
          ),
        ],
      ),
    );
  }
}
