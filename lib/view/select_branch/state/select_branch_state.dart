import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/model/branch_list_model.dart';

part 'select_branch_state.freezed.dart';

@freezed
class SelectBranchState with _$SelectBranchState {
  const factory SelectBranchState({
    required AsyncValue<List<BranchModel>> branchList,
    required BranchModel? selectedBranch,
  }) = _SelectBranchState;

  factory SelectBranchState.initial() => const SelectBranchState(
        branchList: AsyncLoading(),
        selectedBranch: null,
      );
}
