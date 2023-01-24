// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cheapest_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CheapestPrice _$CheapestPriceFromJson(Map<String, dynamic> json) {
  return _CheapestPrice.fromJson(json);
}

/// @nodoc
mixin _$CheapestPrice {
  @JsonKey(name: "price")
  String? get cheapestPrice => throw _privateConstructorUsedError;
  @JsonKey(name: "date", fromJson: _timestampToDate)
  DateTime? get cheapestPriceDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheapestPriceCopyWith<CheapestPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheapestPriceCopyWith<$Res> {
  factory $CheapestPriceCopyWith(
          CheapestPrice value, $Res Function(CheapestPrice) then) =
      _$CheapestPriceCopyWithImpl<$Res, CheapestPrice>;
  @useResult
  $Res call(
      {@JsonKey(name: "price")
          String? cheapestPrice,
      @JsonKey(name: "date", fromJson: _timestampToDate)
          DateTime? cheapestPriceDate});
}

/// @nodoc
class _$CheapestPriceCopyWithImpl<$Res, $Val extends CheapestPrice>
    implements $CheapestPriceCopyWith<$Res> {
  _$CheapestPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cheapestPrice = freezed,
    Object? cheapestPriceDate = freezed,
  }) {
    return _then(_value.copyWith(
      cheapestPrice: freezed == cheapestPrice
          ? _value.cheapestPrice
          : cheapestPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      cheapestPriceDate: freezed == cheapestPriceDate
          ? _value.cheapestPriceDate
          : cheapestPriceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CheapestPriceCopyWith<$Res>
    implements $CheapestPriceCopyWith<$Res> {
  factory _$$_CheapestPriceCopyWith(
          _$_CheapestPrice value, $Res Function(_$_CheapestPrice) then) =
      __$$_CheapestPriceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "price")
          String? cheapestPrice,
      @JsonKey(name: "date", fromJson: _timestampToDate)
          DateTime? cheapestPriceDate});
}

/// @nodoc
class __$$_CheapestPriceCopyWithImpl<$Res>
    extends _$CheapestPriceCopyWithImpl<$Res, _$_CheapestPrice>
    implements _$$_CheapestPriceCopyWith<$Res> {
  __$$_CheapestPriceCopyWithImpl(
      _$_CheapestPrice _value, $Res Function(_$_CheapestPrice) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cheapestPrice = freezed,
    Object? cheapestPriceDate = freezed,
  }) {
    return _then(_$_CheapestPrice(
      cheapestPrice: freezed == cheapestPrice
          ? _value.cheapestPrice
          : cheapestPrice // ignore: cast_nullable_to_non_nullable
              as String?,
      cheapestPriceDate: freezed == cheapestPriceDate
          ? _value.cheapestPriceDate
          : cheapestPriceDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_CheapestPrice implements _CheapestPrice {
  const _$_CheapestPrice(
      {@JsonKey(name: "price")
          required this.cheapestPrice,
      @JsonKey(name: "date", fromJson: _timestampToDate)
          required this.cheapestPriceDate});

  factory _$_CheapestPrice.fromJson(Map<String, dynamic> json) =>
      _$$_CheapestPriceFromJson(json);

  @override
  @JsonKey(name: "price")
  final String? cheapestPrice;
  @override
  @JsonKey(name: "date", fromJson: _timestampToDate)
  final DateTime? cheapestPriceDate;

  @override
  String toString() {
    return 'CheapestPrice(cheapestPrice: $cheapestPrice, cheapestPriceDate: $cheapestPriceDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CheapestPrice &&
            (identical(other.cheapestPrice, cheapestPrice) ||
                other.cheapestPrice == cheapestPrice) &&
            (identical(other.cheapestPriceDate, cheapestPriceDate) ||
                other.cheapestPriceDate == cheapestPriceDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, cheapestPrice, cheapestPriceDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CheapestPriceCopyWith<_$_CheapestPrice> get copyWith =>
      __$$_CheapestPriceCopyWithImpl<_$_CheapestPrice>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CheapestPriceToJson(
      this,
    );
  }
}

abstract class _CheapestPrice implements CheapestPrice {
  const factory _CheapestPrice(
      {@JsonKey(name: "price")
          required final String? cheapestPrice,
      @JsonKey(name: "date", fromJson: _timestampToDate)
          required final DateTime? cheapestPriceDate}) = _$_CheapestPrice;

  factory _CheapestPrice.fromJson(Map<String, dynamic> json) =
      _$_CheapestPrice.fromJson;

  @override
  @JsonKey(name: "price")
  String? get cheapestPrice;
  @override
  @JsonKey(name: "date", fromJson: _timestampToDate)
  DateTime? get cheapestPriceDate;
  @override
  @JsonKey(ignore: true)
  _$$_CheapestPriceCopyWith<_$_CheapestPrice> get copyWith =>
      throw _privateConstructorUsedError;
}
