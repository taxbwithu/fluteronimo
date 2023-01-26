// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deal_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DealDetails _$DealDetailsFromJson(Map<String, dynamic> json) {
  return _DealDetails.fromJson(json);
}

/// @nodoc
mixin _$DealDetails {
  @JsonKey(name: "gameInfo")
  GameInfo get gameInfo => throw _privateConstructorUsedError;
  @JsonKey(name: "cheapestPrice")
  CheapestPrice get cheapestPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DealDetailsCopyWith<DealDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DealDetailsCopyWith<$Res> {
  factory $DealDetailsCopyWith(
          DealDetails value, $Res Function(DealDetails) then) =
      _$DealDetailsCopyWithImpl<$Res, DealDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: "gameInfo") GameInfo gameInfo,
      @JsonKey(name: "cheapestPrice") CheapestPrice cheapestPrice});

  $GameInfoCopyWith<$Res> get gameInfo;
  $CheapestPriceCopyWith<$Res> get cheapestPrice;
}

/// @nodoc
class _$DealDetailsCopyWithImpl<$Res, $Val extends DealDetails>
    implements $DealDetailsCopyWith<$Res> {
  _$DealDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameInfo = null,
    Object? cheapestPrice = null,
  }) {
    return _then(_value.copyWith(
      gameInfo: null == gameInfo
          ? _value.gameInfo
          : gameInfo // ignore: cast_nullable_to_non_nullable
              as GameInfo,
      cheapestPrice: null == cheapestPrice
          ? _value.cheapestPrice
          : cheapestPrice // ignore: cast_nullable_to_non_nullable
              as CheapestPrice,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GameInfoCopyWith<$Res> get gameInfo {
    return $GameInfoCopyWith<$Res>(_value.gameInfo, (value) {
      return _then(_value.copyWith(gameInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CheapestPriceCopyWith<$Res> get cheapestPrice {
    return $CheapestPriceCopyWith<$Res>(_value.cheapestPrice, (value) {
      return _then(_value.copyWith(cheapestPrice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_DealDetailsCopyWith<$Res>
    implements $DealDetailsCopyWith<$Res> {
  factory _$$_DealDetailsCopyWith(
          _$_DealDetails value, $Res Function(_$_DealDetails) then) =
      __$$_DealDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "gameInfo") GameInfo gameInfo,
      @JsonKey(name: "cheapestPrice") CheapestPrice cheapestPrice});

  @override
  $GameInfoCopyWith<$Res> get gameInfo;
  @override
  $CheapestPriceCopyWith<$Res> get cheapestPrice;
}

/// @nodoc
class __$$_DealDetailsCopyWithImpl<$Res>
    extends _$DealDetailsCopyWithImpl<$Res, _$_DealDetails>
    implements _$$_DealDetailsCopyWith<$Res> {
  __$$_DealDetailsCopyWithImpl(
      _$_DealDetails _value, $Res Function(_$_DealDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameInfo = null,
    Object? cheapestPrice = null,
  }) {
    return _then(_$_DealDetails(
      gameInfo: null == gameInfo
          ? _value.gameInfo
          : gameInfo // ignore: cast_nullable_to_non_nullable
              as GameInfo,
      cheapestPrice: null == cheapestPrice
          ? _value.cheapestPrice
          : cheapestPrice // ignore: cast_nullable_to_non_nullable
              as CheapestPrice,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$_DealDetails implements _DealDetails {
  const _$_DealDetails(
      {@JsonKey(name: "gameInfo") required this.gameInfo,
      @JsonKey(name: "cheapestPrice") required this.cheapestPrice});

  factory _$_DealDetails.fromJson(Map<String, dynamic> json) =>
      _$$_DealDetailsFromJson(json);

  @override
  @JsonKey(name: "gameInfo")
  final GameInfo gameInfo;
  @override
  @JsonKey(name: "cheapestPrice")
  final CheapestPrice cheapestPrice;

  @override
  String toString() {
    return 'DealDetails(gameInfo: $gameInfo, cheapestPrice: $cheapestPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DealDetails &&
            (identical(other.gameInfo, gameInfo) ||
                other.gameInfo == gameInfo) &&
            (identical(other.cheapestPrice, cheapestPrice) ||
                other.cheapestPrice == cheapestPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, gameInfo, cheapestPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DealDetailsCopyWith<_$_DealDetails> get copyWith =>
      __$$_DealDetailsCopyWithImpl<_$_DealDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DealDetailsToJson(
      this,
    );
  }
}

abstract class _DealDetails implements DealDetails {
  const factory _DealDetails(
      {@JsonKey(name: "gameInfo")
          required final GameInfo gameInfo,
      @JsonKey(name: "cheapestPrice")
          required final CheapestPrice cheapestPrice}) = _$_DealDetails;

  factory _DealDetails.fromJson(Map<String, dynamic> json) =
      _$_DealDetails.fromJson;

  @override
  @JsonKey(name: "gameInfo")
  GameInfo get gameInfo;
  @override
  @JsonKey(name: "cheapestPrice")
  CheapestPrice get cheapestPrice;
  @override
  @JsonKey(ignore: true)
  _$$_DealDetailsCopyWith<_$_DealDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
