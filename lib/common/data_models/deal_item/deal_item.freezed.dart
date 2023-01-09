// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DealItem _$DealItemFromJson(Map<String, dynamic> json) {
  return _DealItem.fromJson(json);
}

/// @nodoc
mixin _$DealItem {
  String get dealID => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get salePrice => throw _privateConstructorUsedError;
  String get normalPrice => throw _privateConstructorUsedError;
  String get dealRating => throw _privateConstructorUsedError;
  String get thumb => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DealItemCopyWith<DealItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealItemCopyWith<$Res> {
  factory $DealItemCopyWith(DealItem value, $Res Function(DealItem) then) =
      _$DealItemCopyWithImpl<$Res, DealItem>;
  @useResult
  $Res call(
      {String dealID,
      String title,
      String salePrice,
      String normalPrice,
      String dealRating,
      String thumb});
}

/// @nodoc
class _$DealItemCopyWithImpl<$Res, $Val extends DealItem>
    implements $DealItemCopyWith<$Res> {
  _$DealItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealID = null,
    Object? title = null,
    Object? salePrice = null,
    Object? normalPrice = null,
    Object? dealRating = null,
    Object? thumb = null,
  }) {
    return _then(_value.copyWith(
      dealID: null == dealID
          ? _value.dealID
          : dealID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String,
      normalPrice: null == normalPrice
          ? _value.normalPrice
          : normalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      dealRating: null == dealRating
          ? _value.dealRating
          : dealRating // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DealItemCopyWith<$Res> implements $DealItemCopyWith<$Res> {
  factory _$$_DealItemCopyWith(
          _$_DealItem value, $Res Function(_$_DealItem) then) =
      __$$_DealItemCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String dealID,
      String title,
      String salePrice,
      String normalPrice,
      String dealRating,
      String thumb});
}

/// @nodoc
class __$$_DealItemCopyWithImpl<$Res>
    extends _$DealItemCopyWithImpl<$Res, _$_DealItem>
    implements _$$_DealItemCopyWith<$Res> {
  __$$_DealItemCopyWithImpl(
      _$_DealItem _value, $Res Function(_$_DealItem) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dealID = null,
    Object? title = null,
    Object? salePrice = null,
    Object? normalPrice = null,
    Object? dealRating = null,
    Object? thumb = null,
  }) {
    return _then(_$_DealItem(
      dealID: null == dealID
          ? _value.dealID
          : dealID // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      salePrice: null == salePrice
          ? _value.salePrice
          : salePrice // ignore: cast_nullable_to_non_nullable
              as String,
      normalPrice: null == normalPrice
          ? _value.normalPrice
          : normalPrice // ignore: cast_nullable_to_non_nullable
              as String,
      dealRating: null == dealRating
          ? _value.dealRating
          : dealRating // ignore: cast_nullable_to_non_nullable
              as String,
      thumb: null == thumb
          ? _value.thumb
          : thumb // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DealItem implements _DealItem {
  const _$_DealItem(
      {required this.dealID,
      required this.title,
      required this.salePrice,
      required this.normalPrice,
      required this.dealRating,
      required this.thumb});

  factory _$_DealItem.fromJson(Map<String, dynamic> json) =>
      _$$_DealItemFromJson(json);

  @override
  final String dealID;
  @override
  final String title;
  @override
  final String salePrice;
  @override
  final String normalPrice;
  @override
  final String dealRating;
  @override
  final String thumb;

  @override
  String toString() {
    return 'DealItem(dealID: $dealID, title: $title, salePrice: $salePrice, normalPrice: $normalPrice, dealRating: $dealRating, thumb: $thumb)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealItem &&
            (identical(other.dealID, dealID) || other.dealID == dealID) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.salePrice, salePrice) ||
                other.salePrice == salePrice) &&
            (identical(other.normalPrice, normalPrice) ||
                other.normalPrice == normalPrice) &&
            (identical(other.dealRating, dealRating) ||
                other.dealRating == dealRating) &&
            (identical(other.thumb, thumb) || other.thumb == thumb));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, dealID, title, salePrice, normalPrice, dealRating, thumb);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DealItemCopyWith<_$_DealItem> get copyWith =>
      __$$_DealItemCopyWithImpl<_$_DealItem>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DealItemToJson(
      this,
    );
  }
}

abstract class _DealItem implements DealItem {
  const factory _DealItem(
      {required final String dealID,
      required final String title,
      required final String salePrice,
      required final String normalPrice,
      required final String dealRating,
      required final String thumb}) = _$_DealItem;

  factory _DealItem.fromJson(Map<String, dynamic> json) = _$_DealItem.fromJson;

  @override
  String get dealID;
  @override
  String get title;
  @override
  String get salePrice;
  @override
  String get normalPrice;
  @override
  String get dealRating;
  @override
  String get thumb;
  @override
  @JsonKey(ignore: true)
  _$$_DealItemCopyWith<_$_DealItem> get copyWith =>
      throw _privateConstructorUsedError;
}
