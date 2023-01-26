// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

StoreData _$StoreDataFromJson(Map<String, dynamic> json) {
  return _StoreData.fromJson(json);
}

/// @nodoc
mixin _$StoreData {
  @JsonKey(name: "storeID")
  String get storeID => throw _privateConstructorUsedError;
  @JsonKey(name: "storeName")
  String get storeName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDataCopyWith<StoreData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDataCopyWith<$Res> {
  factory $StoreDataCopyWith(StoreData value, $Res Function(StoreData) then) =
      _$StoreDataCopyWithImpl<$Res, StoreData>;
  @useResult
  $Res call(
      {@JsonKey(name: "storeID") String storeID,
      @JsonKey(name: "storeName") String storeName});
}

/// @nodoc
class _$StoreDataCopyWithImpl<$Res, $Val extends StoreData>
    implements $StoreDataCopyWith<$Res> {
  _$StoreDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeID = null,
    Object? storeName = null,
  }) {
    return _then(_value.copyWith(
      storeID: null == storeID
          ? _value.storeID
          : storeID // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_StoreDataCopyWith<$Res> implements $StoreDataCopyWith<$Res> {
  factory _$$_StoreDataCopyWith(
          _$_StoreData value, $Res Function(_$_StoreData) then) =
      __$$_StoreDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "storeID") String storeID,
      @JsonKey(name: "storeName") String storeName});
}

/// @nodoc
class __$$_StoreDataCopyWithImpl<$Res>
    extends _$StoreDataCopyWithImpl<$Res, _$_StoreData>
    implements _$$_StoreDataCopyWith<$Res> {
  __$$_StoreDataCopyWithImpl(
      _$_StoreData _value, $Res Function(_$_StoreData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeID = null,
    Object? storeName = null,
  }) {
    return _then(_$_StoreData(
      storeID: null == storeID
          ? _value.storeID
          : storeID // ignore: cast_nullable_to_non_nullable
              as String,
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_StoreData implements _StoreData {
  const _$_StoreData(
      {@JsonKey(name: "storeID") required this.storeID,
      @JsonKey(name: "storeName") required this.storeName});

  factory _$_StoreData.fromJson(Map<String, dynamic> json) =>
      _$$_StoreDataFromJson(json);

  @override
  @JsonKey(name: "storeID")
  final String storeID;
  @override
  @JsonKey(name: "storeName")
  final String storeName;

  @override
  String toString() {
    return 'StoreData(storeID: $storeID, storeName: $storeName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StoreData &&
            (identical(other.storeID, storeID) || other.storeID == storeID) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, storeID, storeName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StoreDataCopyWith<_$_StoreData> get copyWith =>
      __$$_StoreDataCopyWithImpl<_$_StoreData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_StoreDataToJson(
      this,
    );
  }
}

abstract class _StoreData implements StoreData {
  const factory _StoreData(
          {@JsonKey(name: "storeID") required final String storeID,
          @JsonKey(name: "storeName") required final String storeName}) =
      _$_StoreData;

  factory _StoreData.fromJson(Map<String, dynamic> json) =
      _$_StoreData.fromJson;

  @override
  @JsonKey(name: "storeID")
  String get storeID;
  @override
  @JsonKey(name: "storeName")
  String get storeName;
  @override
  @JsonKey(ignore: true)
  _$$_StoreDataCopyWith<_$_StoreData> get copyWith =>
      throw _privateConstructorUsedError;
}
