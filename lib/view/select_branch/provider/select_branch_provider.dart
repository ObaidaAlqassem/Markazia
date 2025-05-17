import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/model/branch_model.dart';
import 'package:marakzia_task/services/api/apt_path.dart';
import 'package:marakzia_task/services/api/http/http_service.dart';
import 'package:marakzia_task/view/select_branch/state/select_branch_state.dart';

final selectBranchProvider =
    NotifierProvider<SelectBranchNotifier, SelectBranchState>(
        SelectBranchNotifier.new);

class SelectBranchNotifier extends Notifier<SelectBranchState> {
  @override
  SelectBranchState build() {
    getBranchList();
    return SelectBranchState.initial();
  }

  final formKey = GlobalKey<FormState>();

  void onSelectBranch({
    required BranchModel selectedBranch,
  }) {
    state = state.copyWith(
      selectedBranch: selectedBranch,
    );
  }

  Future<void> getBranchList() async {
    final branchList = await HttpService.instance.get<BaseBranchModel>(
      url: APIPath.branchList,
      fromJsonMethod: BaseBranchModel.fromJson,
    );
    if (branchList.isRight()) {
      state = state.copyWith(
        branchList: AsyncData(
          branchList.getRight()?.data ?? [],
        ),
      );
    }
  }

  void onClickSignIn() {
    if (formKey.currentState!.validate()) {

    }
  }
}
