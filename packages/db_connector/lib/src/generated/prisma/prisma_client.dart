// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:json_annotation/json_annotation.dart';
import 'package:orm/binary_engine.dart' as _i5;
import 'package:orm/engine_core.dart' as _i3;
import 'package:orm/graphql.dart' as _i2;
import 'package:orm/logger.dart' as _i4;
import 'package:orm/orm.dart' as _i1;
import 'package:orm/orm.dart' show DateTimeJsonConverter;

part 'prisma_client.g.dart';

enum UserScalarFieldEnum implements _i1.PrismaEnum {
  id,
  @JsonValue('first_name')
  firstName(r'first_name'),
  @JsonValue('last_name')
  lastName(r'last_name'),
  email,
  phone,
  password;

  const UserScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum AuthScalarFieldEnum implements _i1.PrismaEnum {
  id,
  @JsonValue('auth_token')
  authToken(r'auth_token');

  const AuthScalarFieldEnum([this.originalName]);

  @override
  final String? originalName;
}

enum SortOrder implements _i1.PrismaEnum {
  asc,
  desc;

  @override
  String? get originalName => null;
}

enum QueryMode implements _i1.PrismaEnum {
  @JsonValue('default')
  $default(r'default'),
  insensitive;

  const QueryMode([this.originalName]);

  @override
  final String? originalName;
}

enum NullsOrder implements _i1.PrismaEnum {
  first,
  last;

  @override
  String? get originalName => null;
}

@_i1.jsonSerializable
class UserWhereInput implements _i1.JsonSerializable {
  const UserWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.auth,
  });

  factory UserWhereInput.fromJson(Map<String, dynamic> json) =>
      _$UserWhereInputFromJson(json);

  final Iterable<UserWhereInput>? AND;

  final Iterable<UserWhereInput>? OR;

  final Iterable<UserWhereInput>? NOT;

  final IntFilter? id;

  @JsonKey(name: r'first_name')
  final StringFilter? firstName;

  @JsonKey(name: r'last_name')
  final StringFilter? lastName;

  final StringFilter? email;

  final StringNullableFilter? phone;

  final StringFilter? password;

  final AuthNullableRelationFilter? auth;

  @override
  Map<String, dynamic> toJson() => _$UserWhereInputToJson(this);
}

@_i1.jsonSerializable
class UserOrderByWithRelationInput implements _i1.JsonSerializable {
  const UserOrderByWithRelationInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.auth,
  });

  factory UserOrderByWithRelationInput.fromJson(Map<String, dynamic> json) =>
      _$UserOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'first_name')
  final SortOrder? firstName;

  @JsonKey(name: r'last_name')
  final SortOrder? lastName;

  final SortOrder? email;

  final SortOrder? phone;

  final SortOrder? password;

  final AuthOrderByWithRelationInput? auth;

  @override
  Map<String, dynamic> toJson() => _$UserOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class UserWhereUniqueInput implements _i1.JsonSerializable {
  const UserWhereUniqueInput({
    this.id,
    this.email,
    this.phone,
    this.AND,
    this.OR,
    this.NOT,
    this.firstName,
    this.lastName,
    this.password,
    this.auth,
  });

  factory UserWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$UserWhereUniqueInputFromJson(json);

  final int? id;

  final String? email;

  final String? phone;

  final Iterable<UserWhereInput>? AND;

  final Iterable<UserWhereInput>? OR;

  final Iterable<UserWhereInput>? NOT;

  @JsonKey(name: r'first_name')
  final StringFilter? firstName;

  @JsonKey(name: r'last_name')
  final StringFilter? lastName;

  final StringFilter? password;

  final AuthNullableRelationFilter? auth;

  @override
  Map<String, dynamic> toJson() => _$UserWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class UserOrderByWithAggregationInput implements _i1.JsonSerializable {
  const UserOrderByWithAggregationInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory UserOrderByWithAggregationInput.fromJson(Map<String, dynamic> json) =>
      _$UserOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'first_name')
  final SortOrder? firstName;

  @JsonKey(name: r'last_name')
  final SortOrder? lastName;

  final SortOrder? email;

  final SortOrder? phone;

  final SortOrder? password;

  @JsonKey(name: r'_count')
  final UserCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final UserAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final UserMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final UserMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final UserSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$UserOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class UserScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const UserScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<UserScalarWhereWithAggregatesInput>? AND;

  final Iterable<UserScalarWhereWithAggregatesInput>? OR;

  final Iterable<UserScalarWhereWithAggregatesInput>? NOT;

  final IntWithAggregatesFilter? id;

  @JsonKey(name: r'first_name')
  final StringWithAggregatesFilter? firstName;

  @JsonKey(name: r'last_name')
  final StringWithAggregatesFilter? lastName;

  final StringWithAggregatesFilter? email;

  final StringNullableWithAggregatesFilter? phone;

  final StringWithAggregatesFilter? password;

  @override
  Map<String, dynamic> toJson() =>
      _$UserScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class AuthWhereInput implements _i1.JsonSerializable {
  const AuthWhereInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.authToken,
    this.user,
  });

  factory AuthWhereInput.fromJson(Map<String, dynamic> json) =>
      _$AuthWhereInputFromJson(json);

  final Iterable<AuthWhereInput>? AND;

  final Iterable<AuthWhereInput>? OR;

  final Iterable<AuthWhereInput>? NOT;

  final IntFilter? id;

  @JsonKey(name: r'auth_token')
  final StringFilter? authToken;

  final UserRelationFilter? user;

  @override
  Map<String, dynamic> toJson() => _$AuthWhereInputToJson(this);
}

@_i1.jsonSerializable
class AuthOrderByWithRelationInput implements _i1.JsonSerializable {
  const AuthOrderByWithRelationInput({
    this.id,
    this.authToken,
    this.user,
  });

  factory AuthOrderByWithRelationInput.fromJson(Map<String, dynamic> json) =>
      _$AuthOrderByWithRelationInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'auth_token')
  final SortOrder? authToken;

  final UserOrderByWithRelationInput? user;

  @override
  Map<String, dynamic> toJson() => _$AuthOrderByWithRelationInputToJson(this);
}

@_i1.jsonSerializable
class AuthWhereUniqueInput implements _i1.JsonSerializable {
  const AuthWhereUniqueInput({
    this.id,
    this.authToken,
    this.AND,
    this.OR,
    this.NOT,
    this.user,
  });

  factory AuthWhereUniqueInput.fromJson(Map<String, dynamic> json) =>
      _$AuthWhereUniqueInputFromJson(json);

  final int? id;

  @JsonKey(name: r'auth_token')
  final String? authToken;

  final Iterable<AuthWhereInput>? AND;

  final Iterable<AuthWhereInput>? OR;

  final Iterable<AuthWhereInput>? NOT;

  final UserRelationFilter? user;

  @override
  Map<String, dynamic> toJson() => _$AuthWhereUniqueInputToJson(this);
}

@_i1.jsonSerializable
class AuthOrderByWithAggregationInput implements _i1.JsonSerializable {
  const AuthOrderByWithAggregationInput({
    this.id,
    this.authToken,
    this.$count,
    this.$avg,
    this.$max,
    this.$min,
    this.$sum,
  });

  factory AuthOrderByWithAggregationInput.fromJson(Map<String, dynamic> json) =>
      _$AuthOrderByWithAggregationInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'auth_token')
  final SortOrder? authToken;

  @JsonKey(name: r'_count')
  final AuthCountOrderByAggregateInput? $count;

  @JsonKey(name: r'_avg')
  final AuthAvgOrderByAggregateInput? $avg;

  @JsonKey(name: r'_max')
  final AuthMaxOrderByAggregateInput? $max;

  @JsonKey(name: r'_min')
  final AuthMinOrderByAggregateInput? $min;

  @JsonKey(name: r'_sum')
  final AuthSumOrderByAggregateInput? $sum;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthOrderByWithAggregationInputToJson(this);
}

@_i1.jsonSerializable
class AuthScalarWhereWithAggregatesInput implements _i1.JsonSerializable {
  const AuthScalarWhereWithAggregatesInput({
    this.AND,
    this.OR,
    this.NOT,
    this.id,
    this.authToken,
  });

  factory AuthScalarWhereWithAggregatesInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthScalarWhereWithAggregatesInputFromJson(json);

  final Iterable<AuthScalarWhereWithAggregatesInput>? AND;

  final Iterable<AuthScalarWhereWithAggregatesInput>? OR;

  final Iterable<AuthScalarWhereWithAggregatesInput>? NOT;

  final IntWithAggregatesFilter? id;

  @JsonKey(name: r'auth_token')
  final StringWithAggregatesFilter? authToken;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthScalarWhereWithAggregatesInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateInput implements _i1.JsonSerializable {
  const UserCreateInput({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
    this.auth,
  });

  factory UserCreateInput.fromJson(Map<String, dynamic> json) =>
      _$UserCreateInputFromJson(json);

  @JsonKey(name: r'first_name')
  final String firstName;

  @JsonKey(name: r'last_name')
  final String lastName;

  final String email;

  final String? phone;

  final String password;

  final AuthCreateNestedOneWithoutUserInput? auth;

  @override
  Map<String, dynamic> toJson() => _$UserCreateInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedCreateInput implements _i1.JsonSerializable {
  const UserUncheckedCreateInput({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
    this.auth,
  });

  factory UserUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUncheckedCreateInputFromJson(json);

  final int? id;

  @JsonKey(name: r'first_name')
  final String firstName;

  @JsonKey(name: r'last_name')
  final String lastName;

  final String email;

  final String? phone;

  final String password;

  final AuthUncheckedCreateNestedOneWithoutUserInput? auth;

  @override
  Map<String, dynamic> toJson() => _$UserUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateInput implements _i1.JsonSerializable {
  const UserUpdateInput({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.auth,
  });

  factory UserUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateInputFromJson(json);

  @JsonKey(name: r'first_name')
  final StringFieldUpdateOperationsInput? firstName;

  @JsonKey(name: r'last_name')
  final StringFieldUpdateOperationsInput? lastName;

  final StringFieldUpdateOperationsInput? email;

  final NullableStringFieldUpdateOperationsInput? phone;

  final StringFieldUpdateOperationsInput? password;

  final AuthUpdateOneWithoutUserNestedInput? auth;

  @override
  Map<String, dynamic> toJson() => _$UserUpdateInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedUpdateInput implements _i1.JsonSerializable {
  const UserUncheckedUpdateInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
    this.auth,
  });

  factory UserUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$UserUncheckedUpdateInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'first_name')
  final StringFieldUpdateOperationsInput? firstName;

  @JsonKey(name: r'last_name')
  final StringFieldUpdateOperationsInput? lastName;

  final StringFieldUpdateOperationsInput? email;

  final NullableStringFieldUpdateOperationsInput? phone;

  final StringFieldUpdateOperationsInput? password;

  final AuthUncheckedUpdateOneWithoutUserNestedInput? auth;

  @override
  Map<String, dynamic> toJson() => _$UserUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateManyInput implements _i1.JsonSerializable {
  const UserCreateManyInput({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
  });

  factory UserCreateManyInput.fromJson(Map<String, dynamic> json) =>
      _$UserCreateManyInputFromJson(json);

  final int? id;

  @JsonKey(name: r'first_name')
  final String firstName;

  @JsonKey(name: r'last_name')
  final String lastName;

  final String email;

  final String? phone;

  final String password;

  @override
  Map<String, dynamic> toJson() => _$UserCreateManyInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateManyMutationInput implements _i1.JsonSerializable {
  const UserUpdateManyMutationInput({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateManyMutationInputFromJson(json);

  @JsonKey(name: r'first_name')
  final StringFieldUpdateOperationsInput? firstName;

  @JsonKey(name: r'last_name')
  final StringFieldUpdateOperationsInput? lastName;

  final StringFieldUpdateOperationsInput? email;

  final NullableStringFieldUpdateOperationsInput? phone;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() => _$UserUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const UserUncheckedUpdateManyInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserUncheckedUpdateManyInput.fromJson(Map<String, dynamic> json) =>
      _$UserUncheckedUpdateManyInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'first_name')
  final StringFieldUpdateOperationsInput? firstName;

  @JsonKey(name: r'last_name')
  final StringFieldUpdateOperationsInput? lastName;

  final StringFieldUpdateOperationsInput? email;

  final NullableStringFieldUpdateOperationsInput? phone;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() => _$UserUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class AuthCreateInput implements _i1.JsonSerializable {
  const AuthCreateInput({
    required this.authToken,
    this.user,
  });

  factory AuthCreateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthCreateInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final String authToken;

  final UserCreateNestedOneWithoutAuthInput? user;

  @override
  Map<String, dynamic> toJson() => _$AuthCreateInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedCreateInput implements _i1.JsonSerializable {
  const AuthUncheckedCreateInput({
    this.id,
    required this.authToken,
  });

  factory AuthUncheckedCreateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUncheckedCreateInputFromJson(json);

  final int? id;

  @JsonKey(name: r'auth_token')
  final String authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthUncheckedCreateInputToJson(this);
}

@_i1.jsonSerializable
class AuthUpdateInput implements _i1.JsonSerializable {
  const AuthUpdateInput({
    this.authToken,
    this.user,
  });

  factory AuthUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUpdateInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final StringFieldUpdateOperationsInput? authToken;

  final UserUpdateOneRequiredWithoutAuthNestedInput? user;

  @override
  Map<String, dynamic> toJson() => _$AuthUpdateInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedUpdateInput implements _i1.JsonSerializable {
  const AuthUncheckedUpdateInput({
    this.id,
    this.authToken,
  });

  factory AuthUncheckedUpdateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUncheckedUpdateInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'auth_token')
  final StringFieldUpdateOperationsInput? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthUncheckedUpdateInputToJson(this);
}

@_i1.jsonSerializable
class AuthCreateManyInput implements _i1.JsonSerializable {
  const AuthCreateManyInput({
    this.id,
    required this.authToken,
  });

  factory AuthCreateManyInput.fromJson(Map<String, dynamic> json) =>
      _$AuthCreateManyInputFromJson(json);

  final int? id;

  @JsonKey(name: r'auth_token')
  final String authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthCreateManyInputToJson(this);
}

@_i1.jsonSerializable
class AuthUpdateManyMutationInput implements _i1.JsonSerializable {
  const AuthUpdateManyMutationInput({this.authToken});

  factory AuthUpdateManyMutationInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUpdateManyMutationInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final StringFieldUpdateOperationsInput? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthUpdateManyMutationInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedUpdateManyInput implements _i1.JsonSerializable {
  const AuthUncheckedUpdateManyInput({
    this.id,
    this.authToken,
  });

  factory AuthUncheckedUpdateManyInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUncheckedUpdateManyInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'auth_token')
  final StringFieldUpdateOperationsInput? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthUncheckedUpdateManyInputToJson(this);
}

@_i1.jsonSerializable
class IntFilter implements _i1.JsonSerializable {
  const IntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory IntFilter.fromJson(Map<String, dynamic> json) =>
      _$IntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$IntFilterToJson(this);
}

@_i1.jsonSerializable
class StringFilter implements _i1.JsonSerializable {
  const StringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
  });

  factory StringFilter.fromJson(Map<String, dynamic> json) =>
      _$StringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final QueryMode? mode;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringFilterToJson(this);
}

@_i1.jsonSerializable
class StringNullableFilter implements _i1.JsonSerializable {
  const StringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
  });

  factory StringNullableFilter.fromJson(Map<String, dynamic> json) =>
      _$StringNullableFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final QueryMode? mode;

  final NestedStringNullableFilter? not;

  @override
  Map<String, dynamic> toJson() => _$StringNullableFilterToJson(this);
}

@_i1.jsonSerializable
class AuthNullableRelationFilter implements _i1.JsonSerializable {
  const AuthNullableRelationFilter({
    this.$is,
    this.isNot,
  });

  factory AuthNullableRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$AuthNullableRelationFilterFromJson(json);

  @JsonKey(name: r'is')
  final AuthWhereInput? $is;

  final AuthWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => _$AuthNullableRelationFilterToJson(this);
}

@_i1.jsonSerializable
class SortOrderInput implements _i1.JsonSerializable {
  const SortOrderInput({
    required this.sort,
    this.nulls,
  });

  factory SortOrderInput.fromJson(Map<String, dynamic> json) =>
      _$SortOrderInputFromJson(json);

  final SortOrder sort;

  final NullsOrder? nulls;

  @override
  Map<String, dynamic> toJson() => _$SortOrderInputToJson(this);
}

@_i1.jsonSerializable
class UserCountOrderByAggregateInput implements _i1.JsonSerializable {
  const UserCountOrderByAggregateInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserCountOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'first_name')
  final SortOrder? firstName;

  @JsonKey(name: r'last_name')
  final SortOrder? lastName;

  final SortOrder? email;

  final SortOrder? phone;

  final SortOrder? password;

  @override
  Map<String, dynamic> toJson() => _$UserCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const UserAvgOrderByAggregateInput({this.id});

  factory UserAvgOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() => _$UserAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const UserMaxOrderByAggregateInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserMaxOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'first_name')
  final SortOrder? firstName;

  @JsonKey(name: r'last_name')
  final SortOrder? lastName;

  final SortOrder? email;

  final SortOrder? phone;

  final SortOrder? password;

  @override
  Map<String, dynamic> toJson() => _$UserMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserMinOrderByAggregateInput implements _i1.JsonSerializable {
  const UserMinOrderByAggregateInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserMinOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'first_name')
  final SortOrder? firstName;

  @JsonKey(name: r'last_name')
  final SortOrder? lastName;

  final SortOrder? email;

  final SortOrder? phone;

  final SortOrder? password;

  @override
  Map<String, dynamic> toJson() => _$UserMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class UserSumOrderByAggregateInput implements _i1.JsonSerializable {
  const UserSumOrderByAggregateInput({this.id});

  factory UserSumOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$UserSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() => _$UserSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class IntWithAggregatesFilter implements _i1.JsonSerializable {
  const IntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory IntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$IntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$IntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringWithAggregatesFilter implements _i1.JsonSerializable {
  const StringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$StringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final QueryMode? mode;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$StringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class StringNullableWithAggregatesFilter implements _i1.JsonSerializable {
  const StringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.mode,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory StringNullableWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$StringNullableWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final QueryMode? mode;

  final NestedStringNullableWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntNullableFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringNullableFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$StringNullableWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class UserRelationFilter implements _i1.JsonSerializable {
  const UserRelationFilter({
    this.$is,
    this.isNot,
  });

  factory UserRelationFilter.fromJson(Map<String, dynamic> json) =>
      _$UserRelationFilterFromJson(json);

  @JsonKey(name: r'is')
  final UserWhereInput? $is;

  final UserWhereInput? isNot;

  @override
  Map<String, dynamic> toJson() => _$UserRelationFilterToJson(this);
}

@_i1.jsonSerializable
class AuthCountOrderByAggregateInput implements _i1.JsonSerializable {
  const AuthCountOrderByAggregateInput({
    this.id,
    this.authToken,
  });

  factory AuthCountOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthCountOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'auth_token')
  final SortOrder? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthCountOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class AuthAvgOrderByAggregateInput implements _i1.JsonSerializable {
  const AuthAvgOrderByAggregateInput({this.id});

  factory AuthAvgOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthAvgOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() => _$AuthAvgOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class AuthMaxOrderByAggregateInput implements _i1.JsonSerializable {
  const AuthMaxOrderByAggregateInput({
    this.id,
    this.authToken,
  });

  factory AuthMaxOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthMaxOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'auth_token')
  final SortOrder? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthMaxOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class AuthMinOrderByAggregateInput implements _i1.JsonSerializable {
  const AuthMinOrderByAggregateInput({
    this.id,
    this.authToken,
  });

  factory AuthMinOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthMinOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @JsonKey(name: r'auth_token')
  final SortOrder? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthMinOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class AuthSumOrderByAggregateInput implements _i1.JsonSerializable {
  const AuthSumOrderByAggregateInput({this.id});

  factory AuthSumOrderByAggregateInput.fromJson(Map<String, dynamic> json) =>
      _$AuthSumOrderByAggregateInputFromJson(json);

  final SortOrder? id;

  @override
  Map<String, dynamic> toJson() => _$AuthSumOrderByAggregateInputToJson(this);
}

@_i1.jsonSerializable
class AuthCreateNestedOneWithoutUserInput implements _i1.JsonSerializable {
  const AuthCreateNestedOneWithoutUserInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory AuthCreateNestedOneWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthCreateNestedOneWithoutUserInputFromJson(json);

  final AuthCreateWithoutUserInput? create;

  final AuthCreateOrConnectWithoutUserInput? connectOrCreate;

  final AuthWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthCreateNestedOneWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedCreateNestedOneWithoutUserInput
    implements _i1.JsonSerializable {
  const AuthUncheckedCreateNestedOneWithoutUserInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory AuthUncheckedCreateNestedOneWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUncheckedCreateNestedOneWithoutUserInputFromJson(json);

  final AuthCreateWithoutUserInput? create;

  final AuthCreateOrConnectWithoutUserInput? connectOrCreate;

  final AuthWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthUncheckedCreateNestedOneWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class StringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const StringFieldUpdateOperationsInput({this.set});

  factory StringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$StringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$StringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class NullableStringFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const NullableStringFieldUpdateOperationsInput({this.set});

  factory NullableStringFieldUpdateOperationsInput.fromJson(
          Map<String, dynamic> json) =>
      _$NullableStringFieldUpdateOperationsInputFromJson(json);

  final String? set;

  @override
  Map<String, dynamic> toJson() =>
      _$NullableStringFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class AuthUpdateOneWithoutUserNestedInput implements _i1.JsonSerializable {
  const AuthUpdateOneWithoutUserNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
  });

  factory AuthUpdateOneWithoutUserNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUpdateOneWithoutUserNestedInputFromJson(json);

  final AuthCreateWithoutUserInput? create;

  final AuthCreateOrConnectWithoutUserInput? connectOrCreate;

  final AuthUpsertWithoutUserInput? upsert;

  final AuthWhereInput? disconnect;

  final AuthWhereInput? delete;

  final AuthWhereUniqueInput? connect;

  final AuthUpdateToOneWithWhereWithoutUserInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthUpdateOneWithoutUserNestedInputToJson(this);
}

@_i1.jsonSerializable
class IntFieldUpdateOperationsInput implements _i1.JsonSerializable {
  const IntFieldUpdateOperationsInput({
    this.set,
    this.increment,
    this.decrement,
    this.multiply,
    this.divide,
  });

  factory IntFieldUpdateOperationsInput.fromJson(Map<String, dynamic> json) =>
      _$IntFieldUpdateOperationsInputFromJson(json);

  final int? set;

  final int? increment;

  final int? decrement;

  final int? multiply;

  final int? divide;

  @override
  Map<String, dynamic> toJson() => _$IntFieldUpdateOperationsInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedUpdateOneWithoutUserNestedInput
    implements _i1.JsonSerializable {
  const AuthUncheckedUpdateOneWithoutUserNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.disconnect,
    this.delete,
    this.connect,
    this.update,
  });

  factory AuthUncheckedUpdateOneWithoutUserNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUncheckedUpdateOneWithoutUserNestedInputFromJson(json);

  final AuthCreateWithoutUserInput? create;

  final AuthCreateOrConnectWithoutUserInput? connectOrCreate;

  final AuthUpsertWithoutUserInput? upsert;

  final AuthWhereInput? disconnect;

  final AuthWhereInput? delete;

  final AuthWhereUniqueInput? connect;

  final AuthUpdateToOneWithWhereWithoutUserInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthUncheckedUpdateOneWithoutUserNestedInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateNestedOneWithoutAuthInput implements _i1.JsonSerializable {
  const UserCreateNestedOneWithoutAuthInput({
    this.create,
    this.connectOrCreate,
    this.connect,
  });

  factory UserCreateNestedOneWithoutAuthInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserCreateNestedOneWithoutAuthInputFromJson(json);

  final UserCreateWithoutAuthInput? create;

  final UserCreateOrConnectWithoutAuthInput? connectOrCreate;

  final UserWhereUniqueInput? connect;

  @override
  Map<String, dynamic> toJson() =>
      _$UserCreateNestedOneWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateOneRequiredWithoutAuthNestedInput
    implements _i1.JsonSerializable {
  const UserUpdateOneRequiredWithoutAuthNestedInput({
    this.create,
    this.connectOrCreate,
    this.upsert,
    this.connect,
    this.update,
  });

  factory UserUpdateOneRequiredWithoutAuthNestedInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUpdateOneRequiredWithoutAuthNestedInputFromJson(json);

  final UserCreateWithoutAuthInput? create;

  final UserCreateOrConnectWithoutAuthInput? connectOrCreate;

  final UserUpsertWithoutAuthInput? upsert;

  final UserWhereUniqueInput? connect;

  final UserUpdateToOneWithWhereWithoutAuthInput? update;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUpdateOneRequiredWithoutAuthNestedInputToJson(this);
}

@_i1.jsonSerializable
class NestedIntFilter implements _i1.JsonSerializable {
  const NestedIntFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringFilter implements _i1.JsonSerializable {
  const NestedStringFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringNullableFilter implements _i1.JsonSerializable {
  const NestedStringNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
  });

  factory NestedStringNullableFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedStringNullableFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringNullableFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedStringNullableFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedIntWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
    this.$count,
    this.$avg,
    this.$sum,
    this.$min,
    this.$max,
  });

  factory NestedIntWithAggregatesFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntWithAggregatesFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_avg')
  final NestedFloatFilter? $avg;

  @JsonKey(name: r'_sum')
  final NestedIntFilter? $sum;

  @JsonKey(name: r'_min')
  final NestedIntFilter? $min;

  @JsonKey(name: r'_max')
  final NestedIntFilter? $max;

  @override
  Map<String, dynamic> toJson() => _$NestedIntWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedFloatFilter implements _i1.JsonSerializable {
  const NestedFloatFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedFloatFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedFloatFilterFromJson(json);

  final double? equals;

  @JsonKey(name: r'in')
  final Iterable<double>? $in;

  final Iterable<double>? notIn;

  final double? lt;

  final double? lte;

  final double? gt;

  final double? gte;

  final NestedFloatFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedFloatFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedStringNullableWithAggregatesFilter implements _i1.JsonSerializable {
  const NestedStringNullableWithAggregatesFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.contains,
    this.startsWith,
    this.endsWith,
    this.not,
    this.$count,
    this.$min,
    this.$max,
  });

  factory NestedStringNullableWithAggregatesFilter.fromJson(
          Map<String, dynamic> json) =>
      _$NestedStringNullableWithAggregatesFilterFromJson(json);

  final String? equals;

  @JsonKey(name: r'in')
  final Iterable<String>? $in;

  final Iterable<String>? notIn;

  final String? lt;

  final String? lte;

  final String? gt;

  final String? gte;

  final String? contains;

  final String? startsWith;

  final String? endsWith;

  final NestedStringNullableWithAggregatesFilter? not;

  @JsonKey(name: r'_count')
  final NestedIntNullableFilter? $count;

  @JsonKey(name: r'_min')
  final NestedStringNullableFilter? $min;

  @JsonKey(name: r'_max')
  final NestedStringNullableFilter? $max;

  @override
  Map<String, dynamic> toJson() =>
      _$NestedStringNullableWithAggregatesFilterToJson(this);
}

@_i1.jsonSerializable
class NestedIntNullableFilter implements _i1.JsonSerializable {
  const NestedIntNullableFilter({
    this.equals,
    this.$in,
    this.notIn,
    this.lt,
    this.lte,
    this.gt,
    this.gte,
    this.not,
  });

  factory NestedIntNullableFilter.fromJson(Map<String, dynamic> json) =>
      _$NestedIntNullableFilterFromJson(json);

  final int? equals;

  @JsonKey(name: r'in')
  final Iterable<int>? $in;

  final Iterable<int>? notIn;

  final int? lt;

  final int? lte;

  final int? gt;

  final int? gte;

  final NestedIntNullableFilter? not;

  @override
  Map<String, dynamic> toJson() => _$NestedIntNullableFilterToJson(this);
}

@_i1.jsonSerializable
class AuthCreateWithoutUserInput implements _i1.JsonSerializable {
  const AuthCreateWithoutUserInput({required this.authToken});

  factory AuthCreateWithoutUserInput.fromJson(Map<String, dynamic> json) =>
      _$AuthCreateWithoutUserInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final String authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthCreateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedCreateWithoutUserInput implements _i1.JsonSerializable {
  const AuthUncheckedCreateWithoutUserInput({required this.authToken});

  factory AuthUncheckedCreateWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUncheckedCreateWithoutUserInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final String authToken;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthUncheckedCreateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthCreateOrConnectWithoutUserInput implements _i1.JsonSerializable {
  const AuthCreateOrConnectWithoutUserInput({
    required this.where,
    required this.create,
  });

  factory AuthCreateOrConnectWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthCreateOrConnectWithoutUserInputFromJson(json);

  final AuthWhereUniqueInput where;

  final AuthCreateWithoutUserInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthCreateOrConnectWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthUpsertWithoutUserInput implements _i1.JsonSerializable {
  const AuthUpsertWithoutUserInput({
    required this.update,
    required this.create,
    this.where,
  });

  factory AuthUpsertWithoutUserInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUpsertWithoutUserInputFromJson(json);

  final AuthUpdateWithoutUserInput update;

  final AuthCreateWithoutUserInput create;

  final AuthWhereInput? where;

  @override
  Map<String, dynamic> toJson() => _$AuthUpsertWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthUpdateToOneWithWhereWithoutUserInput implements _i1.JsonSerializable {
  const AuthUpdateToOneWithWhereWithoutUserInput({
    this.where,
    required this.data,
  });

  factory AuthUpdateToOneWithWhereWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUpdateToOneWithWhereWithoutUserInputFromJson(json);

  final AuthWhereInput? where;

  final AuthUpdateWithoutUserInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthUpdateToOneWithWhereWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthUpdateWithoutUserInput implements _i1.JsonSerializable {
  const AuthUpdateWithoutUserInput({this.authToken});

  factory AuthUpdateWithoutUserInput.fromJson(Map<String, dynamic> json) =>
      _$AuthUpdateWithoutUserInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final StringFieldUpdateOperationsInput? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthUpdateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class AuthUncheckedUpdateWithoutUserInput implements _i1.JsonSerializable {
  const AuthUncheckedUpdateWithoutUserInput({this.authToken});

  factory AuthUncheckedUpdateWithoutUserInput.fromJson(
          Map<String, dynamic> json) =>
      _$AuthUncheckedUpdateWithoutUserInputFromJson(json);

  @JsonKey(name: r'auth_token')
  final StringFieldUpdateOperationsInput? authToken;

  @override
  Map<String, dynamic> toJson() =>
      _$AuthUncheckedUpdateWithoutUserInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateWithoutAuthInput implements _i1.JsonSerializable {
  const UserCreateWithoutAuthInput({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
  });

  factory UserCreateWithoutAuthInput.fromJson(Map<String, dynamic> json) =>
      _$UserCreateWithoutAuthInputFromJson(json);

  @JsonKey(name: r'first_name')
  final String firstName;

  @JsonKey(name: r'last_name')
  final String lastName;

  final String email;

  final String? phone;

  final String password;

  @override
  Map<String, dynamic> toJson() => _$UserCreateWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedCreateWithoutAuthInput implements _i1.JsonSerializable {
  const UserUncheckedCreateWithoutAuthInput({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
  });

  factory UserUncheckedCreateWithoutAuthInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUncheckedCreateWithoutAuthInputFromJson(json);

  final int? id;

  @JsonKey(name: r'first_name')
  final String firstName;

  @JsonKey(name: r'last_name')
  final String lastName;

  final String email;

  final String? phone;

  final String password;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUncheckedCreateWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserCreateOrConnectWithoutAuthInput implements _i1.JsonSerializable {
  const UserCreateOrConnectWithoutAuthInput({
    required this.where,
    required this.create,
  });

  factory UserCreateOrConnectWithoutAuthInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserCreateOrConnectWithoutAuthInputFromJson(json);

  final UserWhereUniqueInput where;

  final UserCreateWithoutAuthInput create;

  @override
  Map<String, dynamic> toJson() =>
      _$UserCreateOrConnectWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserUpsertWithoutAuthInput implements _i1.JsonSerializable {
  const UserUpsertWithoutAuthInput({
    required this.update,
    required this.create,
    this.where,
  });

  factory UserUpsertWithoutAuthInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpsertWithoutAuthInputFromJson(json);

  final UserUpdateWithoutAuthInput update;

  final UserCreateWithoutAuthInput create;

  final UserWhereInput? where;

  @override
  Map<String, dynamic> toJson() => _$UserUpsertWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateToOneWithWhereWithoutAuthInput implements _i1.JsonSerializable {
  const UserUpdateToOneWithWhereWithoutAuthInput({
    this.where,
    required this.data,
  });

  factory UserUpdateToOneWithWhereWithoutAuthInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUpdateToOneWithWhereWithoutAuthInputFromJson(json);

  final UserWhereInput? where;

  final UserUpdateWithoutAuthInput data;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUpdateToOneWithWhereWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserUpdateWithoutAuthInput implements _i1.JsonSerializable {
  const UserUpdateWithoutAuthInput({
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserUpdateWithoutAuthInput.fromJson(Map<String, dynamic> json) =>
      _$UserUpdateWithoutAuthInputFromJson(json);

  @JsonKey(name: r'first_name')
  final StringFieldUpdateOperationsInput? firstName;

  @JsonKey(name: r'last_name')
  final StringFieldUpdateOperationsInput? lastName;

  final StringFieldUpdateOperationsInput? email;

  final NullableStringFieldUpdateOperationsInput? phone;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() => _$UserUpdateWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class UserUncheckedUpdateWithoutAuthInput implements _i1.JsonSerializable {
  const UserUncheckedUpdateWithoutAuthInput({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserUncheckedUpdateWithoutAuthInput.fromJson(
          Map<String, dynamic> json) =>
      _$UserUncheckedUpdateWithoutAuthInputFromJson(json);

  final IntFieldUpdateOperationsInput? id;

  @JsonKey(name: r'first_name')
  final StringFieldUpdateOperationsInput? firstName;

  @JsonKey(name: r'last_name')
  final StringFieldUpdateOperationsInput? lastName;

  final StringFieldUpdateOperationsInput? email;

  final NullableStringFieldUpdateOperationsInput? phone;

  final StringFieldUpdateOperationsInput? password;

  @override
  Map<String, dynamic> toJson() =>
      _$UserUncheckedUpdateWithoutAuthInputToJson(this);
}

@_i1.jsonSerializable
class User implements _i1.JsonSerializable {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.phone,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  final int id;

  @JsonKey(name: r'first_name')
  final String firstName;

  @JsonKey(name: r'last_name')
  final String lastName;

  final String email;

  final String? phone;

  final String password;

  @override
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@_i1.jsonSerializable
class Auth implements _i1.JsonSerializable {
  const Auth({
    required this.id,
    required this.authToken,
  });

  factory Auth.fromJson(Map<String, dynamic> json) => _$AuthFromJson(json);

  final int id;

  @JsonKey(name: r'auth_token')
  final String authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthToJson(this);
}

class UserFluent<T> extends _i1.PrismaFluent<T> {
  const UserFluent(
    super.original,
    super.$query,
  );

  AuthFluent<Auth?> auth({AuthWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'auth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'auth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Auth.fromJson(json.cast<String, dynamic>()) : null);
    return AuthFluent<Auth?>(
      future,
      query,
    );
  }
}

class AuthFluent<T> extends _i1.PrismaFluent<T> {
  const AuthFluent(
    super.original,
    super.$query,
  );

  UserFluent<User> user() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'user',
          fields: fields,
        )
      ]),
      key: r'user',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }
}

extension UserModelDelegateExtension on _i1.ModelDelegate<User> {
  UserFluent<User?> findUnique({required UserWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  UserFluent<User> findUniqueOrThrow({required UserWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueUserOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueUserOrThrow',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  UserFluent<User?> findFirst({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  UserFluent<User> findFirstOrThrow({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstUserOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstUserOrThrow',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  Future<Iterable<User>> findMany({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<UserScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyUser',
    );
    final fields = UserScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyUser) => findManyUser
        .map((Map findManyUser) => User.fromJson(findManyUser.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  UserFluent<User> create({required UserCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> createMany({
    required Iterable<UserCreateManyInput> data,
    bool? skipDuplicates,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'skipDuplicates',
        skipDuplicates,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createManyUser',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map createManyUser) =>
        AffectedRowsOutput.fromJson(createManyUser.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  UserFluent<User?> update({
    required UserUpdateInput data,
    required UserWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required UserUpdateManyMutationInput data,
    UserWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyUser',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyUser) =>
        AffectedRowsOutput.fromJson(updateManyUser.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  UserFluent<User> upsert({
    required UserWhereUniqueInput where,
    required UserCreateInput create,
    required UserUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? User.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: User)'));
    return UserFluent<User>(
      future,
      query,
    );
  }

  UserFluent<User?> delete({required UserWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneUser',
    );
    final future = query(UserScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? User.fromJson(json.cast<String, dynamic>()) : null);
    return UserFluent<User?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({UserWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyUser',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyUser) =>
        AffectedRowsOutput.fromJson(deleteManyUser.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateUser aggregate({
    UserWhereInput? where,
    Iterable<UserOrderByWithRelationInput>? orderBy,
    UserWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateUser',
    );
    return AggregateUser(query);
  }

  Future<Iterable<UserGroupByOutputType>> groupBy({
    UserWhereInput? where,
    Iterable<UserOrderByWithAggregationInput>? orderBy,
    required Iterable<UserScalarFieldEnum> by,
    UserScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByUser',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByUser',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByUser) => groupByUser.map((Map groupByUser) =>
        UserGroupByOutputType.fromJson(groupByUser.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

extension AuthModelDelegateExtension on _i1.ModelDelegate<Auth> {
  AuthFluent<Auth?> findUnique({required AuthWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueAuth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Auth.fromJson(json.cast<String, dynamic>()) : null);
    return AuthFluent<Auth?>(
      future,
      query,
    );
  }

  AuthFluent<Auth> findUniqueOrThrow({required AuthWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findUniqueAuthOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findUniqueAuthOrThrow',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Auth.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Auth)'));
    return AuthFluent<Auth>(
      future,
      query,
    );
  }

  AuthFluent<Auth?> findFirst({
    AuthWhereInput? where,
    Iterable<AuthOrderByWithRelationInput>? orderBy,
    AuthWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<AuthScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstAuth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Auth.fromJson(json.cast<String, dynamic>()) : null);
    return AuthFluent<Auth?>(
      future,
      query,
    );
  }

  AuthFluent<Auth> findFirstOrThrow({
    AuthWhereInput? where,
    Iterable<AuthOrderByWithRelationInput>? orderBy,
    AuthWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<AuthScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findFirstAuthOrThrow',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findFirstAuthOrThrow',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Auth.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Auth)'));
    return AuthFluent<Auth>(
      future,
      query,
    );
  }

  Future<Iterable<Auth>> findMany({
    AuthWhereInput? where,
    Iterable<AuthOrderByWithRelationInput>? orderBy,
    AuthWhereUniqueInput? cursor,
    int? take,
    int? skip,
    Iterable<AuthScalarFieldEnum>? distinct,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
      _i2.GraphQLArg(
        r'distinct',
        distinct,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'findManyAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'findManyAuth',
    );
    final fields = AuthScalarFieldEnum.values.toGraphQLFields();
    compiler(Iterable<Map> findManyAuth) => findManyAuth
        .map((Map findManyAuth) => Auth.fromJson(findManyAuth.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }

  AuthFluent<Auth> create({required AuthCreateInput data}) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createOneAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createOneAuth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Auth.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Auth)'));
    return AuthFluent<Auth>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> createMany({
    required Iterable<AuthCreateManyInput> data,
    bool? skipDuplicates,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'skipDuplicates',
        skipDuplicates,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'createManyAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'createManyAuth',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map createManyAuth) =>
        AffectedRowsOutput.fromJson(createManyAuth.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AuthFluent<Auth?> update({
    required AuthUpdateInput data,
    required AuthWhereUniqueInput where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateOneAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateOneAuth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Auth.fromJson(json.cast<String, dynamic>()) : null);
    return AuthFluent<Auth?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> updateMany({
    required AuthUpdateManyMutationInput data,
    AuthWhereInput? where,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'data',
        data,
      ),
      _i2.GraphQLArg(
        r'where',
        where,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'updateManyAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'updateManyAuth',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map updateManyAuth) =>
        AffectedRowsOutput.fromJson(updateManyAuth.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AuthFluent<Auth> upsert({
    required AuthWhereUniqueInput where,
    required AuthCreateInput create,
    required AuthUpdateInput update,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'create',
        create,
      ),
      _i2.GraphQLArg(
        r'update',
        update,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'upsertOneAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'upsertOneAuth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) => json is Map
            ? Auth.fromJson(json.cast<String, dynamic>())
            : throw Exception(
                'Not found OutputTypeRefType.string(value: Auth)'));
    return AuthFluent<Auth>(
      future,
      query,
    );
  }

  AuthFluent<Auth?> delete({required AuthWhereUniqueInput where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteOneAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteOneAuth',
    );
    final future = query(AuthScalarFieldEnum.values.toGraphQLFields()).then(
        (json) =>
            json is Map ? Auth.fromJson(json.cast<String, dynamic>()) : null);
    return AuthFluent<Auth?>(
      future,
      query,
    );
  }

  Future<AffectedRowsOutput> deleteMany({AuthWhereInput? where}) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      )
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $mutation([
        _i2.GraphQLField(
          r'deleteManyAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'deleteManyAuth',
    );
    final fields = const ['count'].map((e) => _i2.GraphQLField(e));
    compiler(Map deleteManyAuth) =>
        AffectedRowsOutput.fromJson(deleteManyAuth.cast());
    return query(fields).then((json) => json is Map
        ? compiler(json)
        : throw Exception('Unable to parse response'));
  }

  AggregateAuth aggregate({
    AuthWhereInput? where,
    Iterable<AuthOrderByWithRelationInput>? orderBy,
    AuthWhereUniqueInput? cursor,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'cursor',
        cursor,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'aggregateAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'aggregateAuth',
    );
    return AggregateAuth(query);
  }

  Future<Iterable<AuthGroupByOutputType>> groupBy({
    AuthWhereInput? where,
    Iterable<AuthOrderByWithAggregationInput>? orderBy,
    required Iterable<AuthScalarFieldEnum> by,
    AuthScalarWhereWithAggregatesInput? having,
    int? take,
    int? skip,
  }) {
    final args = [
      _i2.GraphQLArg(
        r'where',
        where,
      ),
      _i2.GraphQLArg(
        r'orderBy',
        orderBy,
      ),
      _i2.GraphQLArg(
        r'by',
        by,
      ),
      _i2.GraphQLArg(
        r'having',
        having,
      ),
      _i2.GraphQLArg(
        r'take',
        take,
      ),
      _i2.GraphQLArg(
        r'skip',
        skip,
      ),
    ];
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'groupByAuth',
          fields: fields,
          args: args,
        )
      ]),
      key: r'groupByAuth',
    );
    final fields = by.map((e) => _i2.GraphQLField(e.originalName ?? e.name));
    compiler(Iterable<Map> groupByAuth) => groupByAuth.map((Map groupByAuth) =>
        AuthGroupByOutputType.fromJson(groupByAuth.cast()));
    return query(fields).then((json) => json is Iterable
        ? compiler(json.cast())
        : throw Exception('Unable to parse response'));
  }
}

@_i1.jsonSerializable
class UserGroupByOutputType implements _i1.JsonSerializable {
  const UserGroupByOutputType({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.password,
  });

  factory UserGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$UserGroupByOutputTypeFromJson(json);

  final int? id;

  @JsonKey(name: r'first_name')
  final String? firstName;

  @JsonKey(name: r'last_name')
  final String? lastName;

  final String? email;

  final String? phone;

  final String? password;

  @override
  Map<String, dynamic> toJson() => _$UserGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class AuthGroupByOutputType implements _i1.JsonSerializable {
  const AuthGroupByOutputType({
    this.id,
    this.authToken,
  });

  factory AuthGroupByOutputType.fromJson(Map<String, dynamic> json) =>
      _$AuthGroupByOutputTypeFromJson(json);

  final int? id;

  @JsonKey(name: r'auth_token')
  final String? authToken;

  @override
  Map<String, dynamic> toJson() => _$AuthGroupByOutputTypeToJson(this);
}

@_i1.jsonSerializable
class AffectedRowsOutput implements _i1.JsonSerializable {
  const AffectedRowsOutput({this.count});

  factory AffectedRowsOutput.fromJson(Map<String, dynamic> json) =>
      _$AffectedRowsOutputFromJson(json);

  final int? count;

  @override
  Map<String, dynamic> toJson() => _$AffectedRowsOutputToJson(this);
}

class AggregateUser {
  const AggregateUser(this.$query);

  final _i1.PrismaFluentQuery $query;

  UserCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return UserCountAggregateOutputType(query);
  }

  UserAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return UserAvgAggregateOutputType(query);
  }

  UserSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return UserSumAggregateOutputType(query);
  }

  UserMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return UserMinAggregateOutputType(query);
  }

  UserMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return UserMaxAggregateOutputType(query);
  }
}

class AggregateAuth {
  const AggregateAuth(this.$query);

  final _i1.PrismaFluentQuery $query;

  AuthCountAggregateOutputType $count() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_count',
          fields: fields,
        )
      ]),
      key: r'_count',
    );
    return AuthCountAggregateOutputType(query);
  }

  AuthAvgAggregateOutputType $avg() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_avg',
          fields: fields,
        )
      ]),
      key: r'_avg',
    );
    return AuthAvgAggregateOutputType(query);
  }

  AuthSumAggregateOutputType $sum() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_sum',
          fields: fields,
        )
      ]),
      key: r'_sum',
    );
    return AuthSumAggregateOutputType(query);
  }

  AuthMinAggregateOutputType $min() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_min',
          fields: fields,
        )
      ]),
      key: r'_min',
    );
    return AuthMinAggregateOutputType(query);
  }

  AuthMaxAggregateOutputType $max() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_max',
          fields: fields,
        )
      ]),
      key: r'_max',
    );
    return AuthMaxAggregateOutputType(query);
  }
}

class UserCountAggregateOutputType {
  const UserCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> firstName() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'first_name',
          fields: fields,
        )
      ]),
      key: r'first_name',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> lastName() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'last_name',
          fields: fields,
        )
      ]),
      key: r'last_name',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> email() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'email',
          fields: fields,
        )
      ]),
      key: r'email',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> phone() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'phone',
          fields: fields,
        )
      ]),
      key: r'phone',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> password() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'password',
          fields: fields,
        )
      ]),
      key: r'password',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class UserAvgAggregateOutputType {
  const UserAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class UserSumAggregateOutputType {
  const UserSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class UserMinAggregateOutputType {
  const UserMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> firstName() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'first_name',
          fields: fields,
        )
      ]),
      key: r'first_name',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> lastName() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'last_name',
          fields: fields,
        )
      ]),
      key: r'last_name',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> email() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'email',
          fields: fields,
        )
      ]),
      key: r'email',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> phone() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'phone',
          fields: fields,
        )
      ]),
      key: r'phone',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> password() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'password',
          fields: fields,
        )
      ]),
      key: r'password',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class UserMaxAggregateOutputType {
  const UserMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> firstName() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'first_name',
          fields: fields,
        )
      ]),
      key: r'first_name',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> lastName() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'last_name',
          fields: fields,
        )
      ]),
      key: r'last_name',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> email() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'email',
          fields: fields,
        )
      ]),
      key: r'email',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> phone() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'phone',
          fields: fields,
        )
      ]),
      key: r'phone',
    );
    return query(const []).then((value) => (value as String?));
  }

  Future<String?> password() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'password',
          fields: fields,
        )
      ]),
      key: r'password',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class AuthCountAggregateOutputType {
  const AuthCountAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> authToken() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'auth_token',
          fields: fields,
        )
      ]),
      key: r'auth_token',
    );
    return query(const []).then((value) => (value as int));
  }

  Future<int> $all() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'_all',
          fields: fields,
        )
      ]),
      key: r'_all',
    );
    return query(const []).then((value) => (value as int));
  }
}

class AuthAvgAggregateOutputType {
  const AuthAvgAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<double?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as double?));
  }
}

class AuthSumAggregateOutputType {
  const AuthSumAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }
}

class AuthMinAggregateOutputType {
  const AuthMinAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> authToken() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'auth_token',
          fields: fields,
        )
      ]),
      key: r'auth_token',
    );
    return query(const []).then((value) => (value as String?));
  }
}

class AuthMaxAggregateOutputType {
  const AuthMaxAggregateOutputType(this.$query);

  final _i1.PrismaFluentQuery $query;

  Future<int?> id() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'id',
          fields: fields,
        )
      ]),
      key: r'id',
    );
    return query(const []).then((value) => (value as int?));
  }

  Future<String?> authToken() {
    final query = _i1.PrismaFluent.queryBuilder(
      query: (fields) => $query([
        _i2.GraphQLField(
          r'auth_token',
          fields: fields,
        )
      ]),
      key: r'auth_token',
    );
    return query(const []).then((value) => (value as String?));
  }
}

@JsonSerializable(
  createFactory: false,
  createToJson: true,
  includeIfNull: false,
)
class Datasources implements _i1.JsonSerializable {
  const Datasources({this.db});

  final String? db;

  @override
  Map<String, dynamic> toJson() => _$DatasourcesToJson(this);
}

class PrismaClient extends _i1.BasePrismaClient<PrismaClient> {
  PrismaClient._internal(
    _i3.Engine engine, {
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  })  : _engine = engine,
        _headers = headers,
        _transaction = transaction,
        super(
          engine,
          headers: headers,
          transaction: transaction,
        );

  factory PrismaClient({
    Datasources? datasources,
    Iterable<_i4.Event>? stdout,
    Iterable<_i4.Event>? event,
  }) {
    final logger = _i4.Logger(
      stdout: stdout,
      event: event,
    );
    final engine = _i5.BinaryEngine(
      logger: logger,
      schema:
          r'Ly8gVGhpcyBpcyB5b3VyIFByaXNtYSBzY2hlbWEgZmlsZSwKLy8gbGVhcm4gbW9yZSBhYm91dCBpdCBpbiB0aGUgZG9jczogaHR0cHM6Ly9wcmlzLmx5L2QvcHJpc21hLXNjaGVtYQoKLy8gTG9va2luZyBmb3Igd2F5cyB0byBzcGVlZCB1cCB5b3VyIHF1ZXJpZXMsIG9yIHNjYWxlIGVhc2lseSB3aXRoIHlvdXIgc2VydmVybGVzcyBvciBlZGdlIGZ1bmN0aW9ucz8KLy8gVHJ5IFByaXNtYSBBY2NlbGVyYXRlOiBodHRwczovL3ByaXMubHkvY2xpL2FjY2VsZXJhdGUtaW5pdAoKZ2VuZXJhdG9yIGNsaWVudCB7CiAgcHJvdmlkZXIgPSAiZGFydCBydW4gb3JtIgp9CgpkYXRhc291cmNlIGRiIHsKICBwcm92aWRlciA9ICJwb3N0Z3Jlc3FsIgogIHVybCAgICAgID0gZW52KCJEQVRBQkFTRV9VUkwiKQp9Cgptb2RlbCBVc2VyIHsKICBpZCAgICAgICAgICAgICAgSW50ICAgICAgQGlkIEBkZWZhdWx0KGF1dG9pbmNyZW1lbnQoKSkKICBmaXJzdF9uYW1lICAgICAgU3RyaW5nCiAgbGFzdF9uYW1lICAgICAgIFN0cmluZwogIGVtYWlsICAgICAgICAgICBTdHJpbmcgICBAdW5pcXVlCiAgcGhvbmUgICAgICAgICAgIFN0cmluZz8gIEB1bmlxdWUKICBwYXNzd29yZCAgICAgICAgU3RyaW5nCiAgYXV0aCAgICAgICAgICAgIEF1dGg/CiAgCiAgQEBtYXAoInVzZXJzIikKfQoKbW9kZWwgQXV0aHsKICBpZCAgICAgICAgICAgICAgSW50ICAgICBAaWQgQGRlZmF1bHQoYXV0b2luY3JlbWVudCgpKQogIHVzZXIgICAgICAgICAgICBVc2VyICAgIEByZWxhdGlvbihmaWVsZHM6IFtpZF0sIHJlZmVyZW5jZXM6IFtpZF0pCiAgYXV0aF90b2tlbiAgICAgIFN0cmluZyAgQHVuaXF1ZQoKICBAQG1hcCgiYXV0aCIpCn0=',
      datasources: datasources?.toJson().cast() ?? const {},
      executable:
          r'/home/elliotalderson/Desktop/Dart Development/ftodo/packages/db_connector/node_modules/prisma/query-engine-debian-openssl-3.0.x',
    );
    return PrismaClient._internal(engine);
  }

  final _i3.Engine _engine;

  final _i3.QueryEngineRequestHeaders? _headers;

  final _i3.TransactionInfo? _transaction;

  @override
  PrismaClient copyWith({
    _i3.QueryEngineRequestHeaders? headers,
    _i3.TransactionInfo? transaction,
  }) =>
      PrismaClient._internal(
        _engine,
        headers: headers ?? _headers,
        transaction: transaction ?? _transaction,
      );

  _i1.ModelDelegate<User> get user => _i1.ModelDelegate<User>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );

  _i1.ModelDelegate<Auth> get auth => _i1.ModelDelegate<Auth>(
        _engine,
        headers: _headers,
        transaction: _transaction,
      );
}
