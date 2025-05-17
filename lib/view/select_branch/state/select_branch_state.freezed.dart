// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_branch_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectBranchState {
  AsyncValue<List<BranchModel>> get branchList =>
      throw _privateConstructorUsedError;
  BranchModel? get selectedBranch => throw _privateConstructorUsedError;

  /// Create a copy of SelectBranchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SelectBranchStateCopyWith<SelectBranchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectBranchStateCopyWith<$Res> {
  factory $SelectBranchStateCopyWith(
          SelectBranchState value, $Res Function(SelectBranchState) then) =
      _$SelectBranchStateCopyWithImpl<$Res, SelectBranchState>;
  @useResult
  $Res call(
      {AsyncValue<List<BranchModel>> branchList, BranchModel? selectedBranch});
}

/// @nodoc
class _$SelectBranchStateCopyWithImpl<$Res, $Val extends SelectBranchState>
    implements $SelectBranchStateCopyWith<$Res> {
  _$SelectBranchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SelectBranchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchList = null,
    Object? selectedBranch = freezed,
  }) {
    return _then(_value.copyWith(
      branchList: null == branchList
          ? _value.branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BranchModel>>,
      selectedBranch: freezed == selectedBranch
          ? _value.selectedBranch
          : selectedBranch // ignore: cast_nullable_to_non_nullable
              as BranchModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelectBranchStateImplCopyWith<$Res>
    implements $SelectBranchStateCopyWith<$Res> {
  factory _$$SelectBranchStateImplCopyWith(_$SelectBranchStateImpl value,
          $Res Function(_$SelectBranchStateImpl) then) =
      __$$SelectBranchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {AsyncValue<List<BranchModel>> branchList, BranchModel? selectedBranch});
}

/// @nodoc
class __$$SelectBranchStateImplCopyWithImpl<$Res>
    extends _$SelectBranchStateCopyWithImpl<$Res, _$SelectBranchStateImpl>
    implements _$$SelectBranchStateImplCopyWith<$Res> {
  __$$SelectBranchStateImplCopyWithImpl(_$SelectBranchStateImpl _value,
      $Res Function(_$SelectBranchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SelectBranchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? branchList = null,
    Object? selectedBranch = freezed,
  }) {
    return _then(_$SelectBranchStateImpl(
      branchList: null == branchList
          ? _value.branchList
          : branchList // ignore: cast_nullable_to_non_nullable
              as AsyncValue<List<BranchModel>>,
      selectedBranch: freezed == selectedBranch
          ? _value.selectedBranch
          : selectedBranch // ignore: cast_nullable_to_non_nullable
              as BranchModel?,
    ));
  }
}

/// @nodoc

class _$SelectBranchStateImpl implements _SelectBranchState {
  const _$SelectBranchStateImpl(
      {required this.branchList, required this.selectedBranch});

  @override
  final AsyncValue<List<BranchModel>> branchList;
  @override
  final BranchModel? selectedBranch;

  @override
  String toString() {
    return 'SelectBranchState(branchList: $branchList, selectedBranch: $selectedBranch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectBranchStateImpl &&
            (identical(other.branchList, branchList) ||
                other.branchList == branchList) &&
            (identical(other.selectedBranch, selectedBranch) ||
                other.selectedBranch == selectedBranch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, branchList, selectedBranch);

  /// Create a copy of SelectBranchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectBranchStateImplCopyWith<_$SelectBranchStateImpl> get copyWith =>
      __$$SelectBranchStateImplCopyWithImpl<_$SelectBranchStateImpl>(
          this, _$identity);
}

abstract class _SelectBranchState implements SelectBranchState {
  const factory _SelectBranchState(
      {required final AsyncValue<List<BranchModel>> branchList,
      required final BranchModel? selectedBranch}) = _$SelectBranchStateImpl;

  @override
  AsyncValue<List<BranchModel>> get branchList;
  @override
  BranchModel? get selectedBranch;

  /// Create a copy of SelectBranchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectBranchStateImplCopyWith<_$SelectBranchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
