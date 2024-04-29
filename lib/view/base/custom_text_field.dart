import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portal_pns_flutter/utill/style.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction inputAction;
  final int maxLines;
  final int minLines;
  final TextCapitalization capitalization;
  final bool isReadonly;
  final bool isEnabled;
  final bool isPassword;
  final bool isIcon;
  final bool isShowSuffixIcon;
  final bool isShowPrefixIcon;
  final IconData? perfixIconData;
  final IconData? suffixIconData;
  final Function()? suffixOnPressed;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    this.hintText = 'Tulis Sesuatu...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.inputType,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines = 1,
    this.capitalization = TextCapitalization.none,
    this.isReadonly = false,
    this.isEnabled = true,
    this.isPassword = false,
    this.isIcon = false,
    this.isShowSuffixIcon = false,
    this.isShowPrefixIcon = false,
    this.perfixIconData,
    this.suffixIconData,
    this.suffixOnPressed,
    this.onTap,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 14.sp),
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      textCapitalization: widget.capitalization,
      cursorColor: Theme.of(context).primaryColor,
      readOnly: widget.isReadonly,
      enabled: widget.isEnabled,
      autofocus: false,
      obscureText: widget.isPassword ? _obscureText : false,
      inputFormatters: widget.inputType == TextInputType.phone
          ? <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp('[0-9+]'))
            ]
          : null,
      // decoration
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
            right: -Adaptive.w(5), top: Adaptive.h(1), bottom: Adaptive.h(1)),
        hintText: widget.hintText,
        errorStyle: poppinsRegular.copyWith(fontSize: 13.sp),
        // add perfix using IconData
        prefixIcon: widget.isShowPrefixIcon
            ? Padding(
                padding:
                    EdgeInsets.only(left: Adaptive.w(4), right: Adaptive.w(3)),
                child: Icon(
                  widget.perfixIconData,
                  size: 16.sp,
                  color: Color(0xffa5a5a5),
                ),
              )
            : Padding(padding: EdgeInsets.symmetric(horizontal: Adaptive.w(2))),
        prefixIconConstraints:
            BoxConstraints(minWidth: Adaptive.w(2), maxHeight: Adaptive.h(8)),
        suffixIcon: widget.isShowSuffixIcon
            ? widget.isPassword
                ? IconButton(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Theme.of(context).hintColor.withOpacity(0.3),
                      size: 16.sp,
                    ),
                    onPressed: _toggle,
                  )
                : widget.isIcon
                    // add suffix using IconData
                    ? IconButton(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onPressed: widget.suffixOnPressed,
                        icon: Icon(
                          widget.suffixIconData,
                          size: 18.sp,
                        ),
                      )
                    : null
            : SizedBox.shrink(),
      ),
      validator: widget.validator,
      onTap: widget.onTap,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
