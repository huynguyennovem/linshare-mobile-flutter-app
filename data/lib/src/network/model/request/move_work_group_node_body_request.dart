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
//

import 'dart:convert';
import 'package:data/src/network/model/account/account_dto.dart';
import 'package:data/src/network/model/converter/datetime_converter.dart';
import 'package:domain/domain.dart';
import 'package:data/data.dart';
import 'package:equatable/equatable.dart';

class MoveWorkGroupNodeBodyRequest with EquatableMixin {

  final WorkGroupNodeId workGroupNodeId;
  final WorkGroupNodeId? parentWorkGroupNodeId;
  final SharedSpaceId sharedSpaceId;
  final WorkGroupNodeType? type;
  final DateTime creationDate;
  final DateTime modificationDate;
  final String? description;
  final String? name;
  final AccountDto? lastAuthor;

  MoveWorkGroupNodeBodyRequest(this.workGroupNodeId, this.parentWorkGroupNodeId, this.sharedSpaceId, this.type,
      this.creationDate, this.modificationDate, this.description, this.name, this.lastAuthor);

  Map<String, dynamic> toJson() => <String, dynamic>{
    jsonEncode('uuid'): jsonEncode(workGroupNodeId.uuid),
    jsonEncode('parent'): jsonEncode(parentWorkGroupNodeId?.uuid),
    jsonEncode('workGroup'): jsonEncode(sharedSpaceId.uuid),
    jsonEncode('type'): jsonEncode(type?.value),
    jsonEncode('creationDate'): const DatetimeConverter().toJson(creationDate),
    jsonEncode('modificationDate'): const DatetimeConverter().toJson(modificationDate),
    jsonEncode('description'): jsonEncode(description),
    jsonEncode('name'): jsonEncode(name),
    jsonEncode('lastAuthor'): jsonEncode(lastAuthor?.toJson()),
  };

  @override
  List<Object?> get props => [
    workGroupNodeId,
    parentWorkGroupNodeId,
    sharedSpaceId,
    type,
    creationDate,
    modificationDate,
    description,
    name,
    lastAuthor
  ];
}

extension MoveWorkGroupNodeRequestExtension on MoveWorkGroupNodeRequest {
  MoveWorkGroupNodeBodyRequest toMoveWorkGroupNodeBodyRequest() => MoveWorkGroupNodeBodyRequest(
      workGroupNodeId,
      parentWorkGroupNodeId,
      sharedSpaceId,
      type,
      creationDate,
      modificationDate,
      description,
      name,
      AccountDto(
          lastAuthor?.name ?? '',
          lastAuthor?.mail ?? '',
          lastAuthor!.accountId,
          lastAuthor?.accountType,
          lastAuthor?.firstName ?? '',
          lastAuthor?.lastName ?? ''));
}
