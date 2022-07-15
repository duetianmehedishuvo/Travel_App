import 'package:demo/utilites/colors.dart';
import 'package:demo/utilites/text.styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType? inputType;
  final TextInputAction? inputAction;
  final Color? fillColor;
  final Color? textColor;
  final int? maxLines;
  final bool? isPassword;
  final bool? isCountryPicker;
  final bool? isShowBorder;
  final bool? isIcon;
  final bool? isShowSuffixIcon;
  final bool? isShowSuffixWidget;
  final Widget? suffixWidget;
  final bool? isShowPrefixIcon;
  final VoidCallback? onTap;
  final VoidCallback? onChanged;
  final VoidCallback? onSuffixTap;
  final String? suffixIconUrl;
  final String? prefixIconUrl;
  final bool? isSearch;
  final VoidCallback? onSubmit;
  final bool? isEnabled;
  final double? hintFontSize;
  final TextCapitalization? capitalization;
  final double? horizontalSize;
  final double? verticalSize;
  final double? borderRadius;
  final bool? autoFocus;
  final bool? isSaveAutoFillData;
  final String autoFillHints;

  const CustomTextField(
      {this.hintText = 'Write something...',
      this.controller,
      this.focusNode,
      this.nextFocus,
      this.isEnabled = true,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.hintFontSize = 13,
      this.onSuffixTap,
      this.fillColor,
        this.textColor,
      this.onSubmit,
      this.onChanged,
      this.capitalization = TextCapitalization.none,
      this.isCountryPicker = false,
      this.isShowBorder = false,
      this.isShowSuffixIcon = false,
      this.isShowPrefixIcon = false,
      this.onTap,
      this.isIcon = false,
      this.isPassword = false,
      this.suffixIconUrl,
      this.isShowSuffixWidget = false,
      this.suffixWidget,
      this.prefixIconUrl = '',
      this.autoFillHints = AutofillHints.name,
      this.isSearch = false,
      this.autoFocus = false,
      this.isSaveAutoFillData = false,
      this.horizontalSize = 22,
      this.verticalSize = 10,
      this.borderRadius = 20,
      Key? key})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: widget.fillColor ??  Color(0xffF7F7F7).withOpacity(0.4),
        boxShadow: [BoxShadow(color: kPrimaryColor.withOpacity(.1), offset: const Offset(0, 0), blurRadius: 20, spreadRadius: 3)],
        borderRadius: BorderRadius.circular(widget.borderRadius!),
      ),
      child: TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        focusNode: widget.focusNode,
        onEditingComplete: () {
          if (widget.isSaveAutoFillData!) TextInput.finishAutofillContext();
        },
        autofillHints: ['${widget.autoFillHints}'],
        style: headline4.copyWith(fontSize: 16, color:widget.textColor?? kBlackColor),
        textInputAction: widget.inputAction,
        keyboardType: widget.inputType,
        cursorColor: kPrimaryColor,
        textCapitalization: widget.capitalization!,
        enabled: widget.isEnabled,
        autofocus: widget.autoFocus!,
        //onChanged: widget.isSearch ? widget.languageProvider.searchLanguage : null,
        obscureText: widget.isPassword! ? _obscureText : false,
        inputFormatters: widget.inputType == TextInputType.phone ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp('[0-9+]'))] : null,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: widget.verticalSize!, horizontal: widget.horizontalSize!),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
              borderSide:
                  BorderSide(color: widget.isShowBorder! ? CupertinoColors.systemGrey : Colors.transparent, width: widget.isShowBorder! ? 1 : 0)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
              borderSide:
                  BorderSide(color: widget.isShowBorder! ? CupertinoColors.systemGrey : Colors.transparent, width: widget.isShowBorder! ? 1 : 0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
              borderSide:
                  BorderSide(color: widget.isShowBorder! ? CupertinoColors.systemGrey : Colors.transparent, width: widget.isShowBorder! ? 1 : 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(widget.borderRadius!),
              borderSide:
                  BorderSide(color: widget.isShowBorder! ? CupertinoColors.systemGrey : Colors.transparent, width: widget.isShowBorder! ? 1 : 1)),
          isDense: true,
          hintText: widget.hintText,
          fillColor: widget.fillColor ??  Color(0xffF7F7F7).withOpacity(0.4),
          hintStyle: input.copyWith(fontSize: widget.hintFontSize, color: widget.textColor??greyColor),
          filled: true,
          prefixIcon: widget.isShowPrefixIcon!
              ? Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: Image.asset(widget.prefixIconUrl!),
                )
              : null,
          prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
          suffixIcon: widget.isShowSuffixIcon! && !widget.isShowSuffixWidget!
              ? widget.isPassword!
                  ? IconButton(
                      icon: Icon(!_obscureText ? Icons.visibility_off : Icons.visibility, color: greyColor, size: 23), onPressed: _toggle)
                  : widget.isIcon!
                      ? IconButton(
                          onPressed: widget.onSuffixTap,
                          icon: Image.asset(widget.suffixIconUrl!, width: 15, height: 15, color: Theme.of(context).textTheme.bodyText1!.color),
                        )
                      : null
              : widget.isShowSuffixWidget!
                  ? widget.suffixWidget
                  : null,
        ),
        onSubmitted: (String? text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus) : widget.onSubmit!(),
        onChanged: (String? value) {
          if (widget.isSearch!) widget.onChanged!();
        },
      ),
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
