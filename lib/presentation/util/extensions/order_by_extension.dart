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
// <http://www.linshare.org/licenses/LinShare-License_AfferoGPL-v3.pdf>
// for more details.
// This program is distributed in the hope that it will be useful, but WITHOUT ANY
// WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
// FOR A PARTICULAR PURPOSE. See the GNU Affero General Public License for
// more details.
// You should have received a copy of the GNU Affero General Public License and its
// applicable Additional Terms for LinShare along with this program. If not, see
// <http://www.gnu.org/licenses/> for the GNU Affero General Public License version
//  3 and <http://www.linshare.org/licenses/LinShare-License_AfferoGPL-v3.pdf> for
//  the Additional Terms applicable to LinShare software.
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:linshare_flutter_app/presentation/localizations/app_localizations.dart';

extension OrderByExtension on OrderBy {

  String getName(BuildContext context) {
    switch(this) {
      case OrderBy.modificationDate:
        return AppLocalizations.of(context).modification_date;
      case OrderBy.creationDate:
        return AppLocalizations.of(context).creation_date;
      case OrderBy.fileSize:
        return AppLocalizations.of(context).size;
      case OrderBy.name:
        return AppLocalizations.of(context).name;
      case OrderBy.shared:
        return AppLocalizations.of(context).shared;
      case OrderBy.sender:
        return AppLocalizations.of(context).sender;
      case OrderBy.expirationDate:
        return AppLocalizations.of(context).expiration_date;
      case OrderBy.activationDate:
        return AppLocalizations.of(context).activation_date;
      case OrderBy.status:
        return AppLocalizations.of(context).status;
      case OrderBy.type:
        return AppLocalizations.of(context).type;
      default:
        return '';
    }
  }
}