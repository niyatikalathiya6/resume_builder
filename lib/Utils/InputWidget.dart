import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resume_builder/Utils/constants.dart';

class InputWidget extends StatefulWidget {
  InputWidget({
    super.key,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.errorMessage,
    this.message,
    this.label,
    this.placeholderText,
    required this.validator,
    this.textfieldheight,
    this.labelStyle,
    this.cursurColor,
    this.obscureText,
    this.onPrefixTap,
    this.onSuffixTap,
    this.textEditingController,
    this.inputWidgetHeight,
    this.textfieldWidget,
    this.onChanged,
    this.keyboardType,
    this.onTap,
    this.focusNode,
  });

  final TextStyle? labelStyle;
  IconData? prefixIcon, suffixIcon;
  final bool? prefix, suffix, errorMessage, obscureText;
  String? message, label, placeholderText;
  String? Function(String?) validator;
  final double? textfieldheight, inputWidgetHeight;
  final Color? cursurColor;
  final Function()? onPrefixTap, onSuffixTap;
  final TextEditingController? textEditingController;
  final Widget? textfieldWidget;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextInputType? keyboardType;
  final FocusNode? focusNode;

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.inputWidgetHeight ?? 88.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.label != null) ...{
            Container(
              child: Text(
                widget.label.toString(),
                style: widget.labelStyle,
              ),
            ),
            SizedBox(height: 4.h),
          },
          widget.textfieldWidget ??
              Container(
                height: widget.textfieldheight ?? 40.h,
                padding: EdgeInsets.symmetric(vertical: 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.sp),
                    border: Border.all()),
                child: TextFormField(
                  focusNode: widget.focusNode,
                  keyboardType: widget.keyboardType,
                  controller: widget.textEditingController,
                  obscureText: widget.obscureText ?? false,
                  cursorColor: widget.cursurColor ?? Colors.black,
                  textAlignVertical: TextAlignVertical.center,
                  validator: widget.validator,
                  onChanged: widget.onChanged,
                  onTap: widget.onTap,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.w),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.transparent,
                      prefixIcon:
                          widget.prefix == null || widget.prefix == false
                              ? null
                              : IconButton(
                                  // padding: EdgeInsets.zero,
                                  onPressed: widget.onPrefixTap ?? null,
                                  icon: Icon(
                                    widget.prefixIcon ?? Icons.info_outline,
                                    color: Colors.black,
                                  )),
                      suffixIcon:
                          widget.suffix == null || widget.suffix == false
                              ? null
                              : IconButton(
                                  // padding: EdgeInsets.zero,
                                  onPressed: widget.onSuffixTap ?? null,
                                  icon: Icon(
                                    widget.suffixIcon ?? Icons.cancel,
                                    color: Colors.black,
                                  )),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.errorMessage == null ||
                                    widget.errorMessage == false
                                ? Colors.transparent
                                : Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: widget.errorMessage == null ||
                                    widget.errorMessage == false
                                ? AppColors.primaryColor
                                : Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: widget.placeholderText ?? "Placeholder Text",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        letterSpacing: 0.sp,
                        fontWeight: FontWeight.w400,
                        height: 24.h / 14.sp,
                        color: Colors.grey,
                      )),
                ),
              ),
          if (widget.message != null) ...{
            SizedBox(height: 4.h),
            Text(widget.message.toString()),
          }
        ],
      ),
    );
  }
}
