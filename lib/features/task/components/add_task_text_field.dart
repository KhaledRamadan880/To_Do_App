import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AddTaskTxtField extends StatelessWidget {
  const AddTaskTxtField({
    super.key,
    required this.title,
    required this.hintText,
    this.suffixIcon,
    this.controller,
    this.enabled = false,
    this.validator,
  });

  final TextEditingController? controller;
  final String title;
  final String hintText;
  final Widget? suffixIcon;
  final bool enabled;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! Title
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 8.h),

        //! TextField
        TextFormField(
          readOnly: enabled,
          controller: controller,          
          validator: validator,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(12),
            hintText: hintText,            
            suffixIcon: suffixIcon,                        
            filled: true,
            disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(                    
                    )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(                  
                  ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(                  
                  ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }
}
