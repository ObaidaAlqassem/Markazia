// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'service_control_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ServiceControlState {
  AsyncValue<List<ServiceModel>> get servicesList =>
      throw _privateConstructorUsedError;

  /// Create a copy of ServiceControlState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ServiceControlStateCopyWith<ServiceControlState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServiceControlStateCopyWith<$Res> {
  factory $ServiceControlStateCopyWith(
          ServiceControlState value, $Res Function(ServiceControlState) then) =
      _$ServiceControlStateCopyWithImpl<$Res, ServiceControlState>;
  @useResult
  $Res call({AsyncValue<List<ServiceModel>> servicesList});
}

/// @nodoc
class _$ServiceControlStateCopyWithImpl<$Res, $Val extends ServiceControlState>
    implements $ServiceControlStateCopyWith<$Res> {
  _$ServiceControlStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ServiceControlState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesList = null,
  }) {
    return _then(_value.copyWith(
      servicesList: null == servicesList
          ? _value.servicesList
          : servicesList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ServiceModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ServiceControlStateImplCopyWith<$Res>
    implements $ServiceControlStateCopyWith<$Res> {
  factory _$$ServiceControlStateImplCopyWith(_$ServiceControlStateImpl value,
          $Res Function(_$ServiceControlStateImpl) then) =
      __$$ServiceControlStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AsyncValue<List<ServiceModel>> servicesList});
}

/// @nodoc
class __$$ServiceControlStateImplCopyWithImpl<$Res>
    extends _$ServiceControlStateCopyWithImpl<$Res, _$ServiceControlStateImpl>
    implements _$$ServiceControlStateImplCopyWith<$Res> {
  __$$ServiceControlStateImplCopyWithImpl(_$ServiceControlStateImpl _value,
      $Res Function(_$ServiceControlStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ServiceControlState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? servicesList = null,
  }) {
    return _then(_$ServiceControlStateImpl(
      servicesList: null == servicesList
          ? _value.servicesList
          : servicesList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<ServiceModel>>,
    ));
  }
}

/// @nodoc

class _$ServiceControlStateImpl implements _ServiceControlState {
  const _$ServiceControlStateImpl({required this.servicesList});

  @override
  final AsyncValue<List<ServiceModel>> servicesList;

  @override
  String toString() {
    return 'ServiceControlState(servicesList: $servicesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServiceControlStateImpl &&
            (identical(other.servicesList, servicesList) ||
                other.servicesList == servicesList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, servicesList);

  /// Create a copy of ServiceControlState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServiceControlStateImplCopyWith<_$ServiceControlStateImpl> get copyWith =>
      __$$ServiceControlStateImplCopyWithImpl<_$ServiceControlStateImpl>(
          this, _$identity);
}

abstract class _ServiceControlState implements ServiceControlState {
  const factory _ServiceControlState(
          {required final AsyncValue<List<ServiceModel>> servicesList}) =
      _$ServiceControlStateImpl;

  @override
  AsyncValue<List<ServiceModel>> get servicesList;

  /// Create a copy of ServiceControlState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServiceControlStateImplCopyWith<_$ServiceControlStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
