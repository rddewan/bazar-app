// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'brand_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BrandState {
  AsyncValue<List<BrandModel>> get brands => throw _privateConstructorUsedError;
  List<BrandModel> get brandList => throw _privateConstructorUsedError;
  String? get errorMsg => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BrandStateCopyWith<BrandState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BrandStateCopyWith<$Res> {
  factory $BrandStateCopyWith(
          BrandState value, $Res Function(BrandState) then) =
      _$BrandStateCopyWithImpl<$Res>;
  $Res call(
      {AsyncValue<List<BrandModel>> brands,
      List<BrandModel> brandList,
      String? errorMsg});
}

/// @nodoc
class _$BrandStateCopyWithImpl<$Res> implements $BrandStateCopyWith<$Res> {
  _$BrandStateCopyWithImpl(this._value, this._then);

  final BrandState _value;
  // ignore: unused_field
  final $Res Function(BrandState) _then;

  @override
  $Res call({
    Object? brands = freezed,
    Object? brandList = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_value.copyWith(
      brands: brands == freezed
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BrandModel>>,
      brandList: brandList == freezed
          ? _value.brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_BrandStateCopyWith<$Res>
    implements $BrandStateCopyWith<$Res> {
  factory _$$_BrandStateCopyWith(
          _$_BrandState value, $Res Function(_$_BrandState) then) =
      __$$_BrandStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {AsyncValue<List<BrandModel>> brands,
      List<BrandModel> brandList,
      String? errorMsg});
}

/// @nodoc
class __$$_BrandStateCopyWithImpl<$Res> extends _$BrandStateCopyWithImpl<$Res>
    implements _$$_BrandStateCopyWith<$Res> {
  __$$_BrandStateCopyWithImpl(
      _$_BrandState _value, $Res Function(_$_BrandState) _then)
      : super(_value, (v) => _then(v as _$_BrandState));

  @override
  _$_BrandState get _value => super._value as _$_BrandState;

  @override
  $Res call({
    Object? brands = freezed,
    Object? brandList = freezed,
    Object? errorMsg = freezed,
  }) {
    return _then(_$_BrandState(
      brands: brands == freezed
          ? _value.brands
          : brands // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BrandModel>>,
      brandList: brandList == freezed
          ? _value._brandList
          : brandList // ignore: cast_nullable_to_non_nullable
              as List<BrandModel>,
      errorMsg: errorMsg == freezed
          ? _value.errorMsg
          : errorMsg // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_BrandState implements _BrandState {
  const _$_BrandState(
      {this.brands = const AsyncValue.loading(),
      final List<BrandModel> brandList = const [],
      this.errorMsg})
      : _brandList = brandList;

  @override
  @JsonKey()
  final AsyncValue<List<BrandModel>> brands;
  final List<BrandModel> _brandList;
  @override
  @JsonKey()
  List<BrandModel> get brandList {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_brandList);
  }

  @override
  final String? errorMsg;

  @override
  String toString() {
    return 'BrandState(brands: $brands, brandList: $brandList, errorMsg: $errorMsg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BrandState &&
            const DeepCollectionEquality().equals(other.brands, brands) &&
            const DeepCollectionEquality()
                .equals(other._brandList, _brandList) &&
            const DeepCollectionEquality().equals(other.errorMsg, errorMsg));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(brands),
      const DeepCollectionEquality().hash(_brandList),
      const DeepCollectionEquality().hash(errorMsg));

  @JsonKey(ignore: true)
  @override
  _$$_BrandStateCopyWith<_$_BrandState> get copyWith =>
      __$$_BrandStateCopyWithImpl<_$_BrandState>(this, _$identity);
}

abstract class _BrandState implements BrandState {
  const factory _BrandState(
      {final AsyncValue<List<BrandModel>> brands,
      final List<BrandModel> brandList,
      final String? errorMsg}) = _$_BrandState;

  @override
  AsyncValue<List<BrandModel>> get brands;
  @override
  List<BrandModel> get brandList;
  @override
  String? get errorMsg;
  @override
  @JsonKey(ignore: true)
  _$$_BrandStateCopyWith<_$_BrandState> get copyWith =>
      throw _privateConstructorUsedError;
}
