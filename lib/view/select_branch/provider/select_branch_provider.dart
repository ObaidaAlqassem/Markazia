import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/storage/app_storage.dart';
import 'package:marakzia_task/model/branch_list_model.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/routes/routes.dart';
import 'package:marakzia_task/services/api/apt_path.dart';
import 'package:marakzia_task/services/api/http/http_service.dart';
import 'package:marakzia_task/view/select_branch/state/select_branch_state.dart';

final selectBranchProvider =
    NotifierProvider.autoDispose<SelectBranchNotifier, SelectBranchState>(
        SelectBranchNotifier.new);

class SelectBranchNotifier extends AutoDisposeNotifier<SelectBranchState> {
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
    final branchList = await HttpService.instance.get<BaseBranchListModel>(
      url: APIPath.branchList,
      fromJsonMethod: BaseBranchListModel.fromJson,
    );
    if (branchList.isRight()) {
      state = state.copyWith(
        branchList: AsyncData(
          branchList.getRight()?.data ?? [],
        ),
      );
      final branchId = await AppStorage.getData(
            key: SecurePreferencesKeys.branchId,
          ) ;
      if (branchId.isNotEmpty) {
        final branch = state.branchList.value!
            .where(
              (branch) => branch.id.toString() == branchId,
            )
            .firstOrNull;
        if (branch != null) {
          onSelectBranch(
            selectedBranch: branch,
          );
        }
      }
    }
  }

  Future<void> onConfirmSelectedBranch() async {
    if (formKey.currentState!.validate()) {
      await AppStorage.setData(
        key: SecurePreferencesKeys.branchId,
        data: state.selectedBranch?.id.toString(),
      );
      final accessToken = await AppStorage.getData(
        key: SecurePreferencesKeys.accessToken,
      );
      if (accessToken.isEmpty) {
        await AppRouter.pushNamed(Routes.appSettingScreen);
      } else {
        await AppRouter.startNewRoute(Routes.dashBoardView);
      }
    }
  }
}
