// LinShare is an open source filesharing software, part of the LinPKI software
// suite, developed by Linagora.
//
// Copyright (C) 2020 LINAGORA
//
// This program is free software: you can redistribute it and/or modify it under the
// terms of the GNU Affero General Public License as published by the Free Software
// Foundation, either version 3 of the License, or (at your option) any later version,
// provided you comply with the Additional Terms applicable for LinShare software by
// Linagora pursuant to Section 7 of the GNU Affero General Public License,
// subsections (b), (c), and (e), pursuant to which you must notably (i) retain the
// display in the interface of the “LinShare™” trademark/logo, the "Libre & Free" mention,
// the words “You are using the Free and Open Source version of LinShare™, powered by
// Linagora © 2009–2020. Contribute to Linshare R&D by subscribing to an Enterprise
// offer!”. You must also retain the latter notice in all asynchronous messages such as
// e-mails sent with the Program, (ii) retain all hypertext links between LinShare and
// http://www.linshare.org, between linagora.com and Linagora, and (iii) refrain from
// infringing Linagora intellectual property rights over its trademarks and commercial
// brands. Other Additional Terms apply, see
// <http://www.linshare.org/licenses/LinShare-License_AfferoGPL-v3.pdf
//
// for more details.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
// more details.
// You should have received a copy of the GNU Affero General Public License and its
// applicable Additional Terms for LinShare along with this program. If not, see
// <http://www.gnu.org/licenses
// for the GNU Affero General Public License version
//
// 3 and <http://www.linshare.org/licenses/LinShare-License_AfferoGPL-v3.pdf
// for
//
// the Additional Terms applicable to LinShare software.


import 'package:flutter/material.dart';
import 'package:linshare_flutter_app/presentation/util/extensions/color_extension.dart';

abstract class InputDecorationBuilder {
  String? _prefixText;
  String? _labelText;
  TextStyle? _labelStyle;
  String? _hintText;
  TextStyle? _hintStyle;
  EdgeInsets? _contentPadding;
  OutlineInputBorder? _enabledBorder;

  InputDecorationBuilder prefixText(String prefixText) {
    _prefixText = prefixText;
    return this;
  }

  InputDecorationBuilder labelText(String labelText) {
    _labelText = labelText;
    return this;
  }

  InputDecorationBuilder labelStyle(TextStyle labelStyle) {
    _labelStyle = labelStyle;
    return this;
  }

  InputDecorationBuilder hintText(String hintText) {
    _hintText = hintText;
    return this;
  }

  InputDecorationBuilder hintStyle(TextStyle hintStyle) {
    _hintStyle = hintStyle;
    return this;
  }

  InputDecorationBuilder contentPadding(EdgeInsets contentPadding) {
    _contentPadding = contentPadding;
    return this;
  }

  InputDecorationBuilder enabledBorder(OutlineInputBorder enabledBorder) {
    _enabledBorder = enabledBorder;
    return this;
  }

  InputDecoration build() {
    return InputDecoration(
        prefixText: _prefixText,
        labelText: _labelText,
        labelStyle: _labelStyle,
        contentPadding: _contentPadding,
        enabledBorder: _enabledBorder
    );
  }
}

class LoginInputDecorationBuilder extends InputDecorationBuilder {

  @override
  InputDecoration build() {
    return InputDecoration(
        enabledBorder: _enabledBorder ?? OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(width: 1, color: Colors.white)),
        focusedBorder: _enabledBorder ?? OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(width: 2, color: AppColor.loginTextFieldFocusedBorder)),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            borderSide: BorderSide(
                width: 1, color: AppColor.loginTextFieldErrorBorder)),
        prefixText: _prefixText,
        labelText: _labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelStyle: _labelStyle ?? TextStyle(color: AppColor.loginTextFieldLabelColor, fontSize: 16),
        hintText: _hintText,
        hintStyle: _hintStyle ?? TextStyle(color: AppColor.loginTextFieldHintColor, fontSize: 16),
        contentPadding: _contentPadding ?? EdgeInsets.all(10),
        filled: true,
        fillColor: Colors.white);
  }
}