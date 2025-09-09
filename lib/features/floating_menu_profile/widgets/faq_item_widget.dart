import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_colors.dart';

class FAQItem {
  final String question;
  final String answer;

  FAQItem({
    required this.question,
    required this.answer,
  });
}

class FAQItemWidget extends StatefulWidget {
  final FAQItem faqItem;

  const FAQItemWidget({
    super.key,
    required this.faqItem,
  });

  @override
  State<FAQItemWidget> createState() => _FAQItemWidgetState();
}

class _FAQItemWidgetState extends State<FAQItemWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  late AnimationController _controller;
  late Animation<double> _iconRotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _iconRotation = Tween<double>(begin: 0, end: 0.25).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  void _toggleExpand() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _toggleExpand,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.faqItem.question,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 16.w),
                RotationTransition(
                  turns: _iconRotation,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 14.sp,
                    color: AppColors.redPinkMain,
                  ),
                ),
              ],
            ),
          ),
        ),

        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          crossFadeState: _isExpanded
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
          firstChild: Container(
            width: double.infinity,
            padding: EdgeInsets.only(bottom: 16.h, right: 30.w),
            child: Text(
              widget.faqItem.answer,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w300,
                color: Colors.white70,
                height: 1.4,
              ),
            ),
          ),
          secondChild: const SizedBox.shrink(),
        ),

        if (!_isExpanded)
          Divider(
            color: Colors.grey.withOpacity(0.2),
            thickness: 0.5,
          ),
      ],
    );
  }
}