import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/dialog/app_dialog.dart';
import 'package:marakzia_task/common/messages/app_messages.dart';
import 'package:marakzia_task/common/storage/app_storage.dart';
import 'package:marakzia_task/model/branch_list_model.dart';
import 'package:marakzia_task/model/branch_model.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/services/api/apt_path.dart';
import 'package:marakzia_task/services/api/http/http_service.dart';
import 'package:marakzia_task/view/service_controls/state/service_control_state.dart';

final serviceControlProvider =
    NotifierProvider.autoDispose<ServiceControlNotifier, ServiceControlState>(
        ServiceControlNotifier.new);

class ServiceControlNotifier extends AutoDisposeNotifier<ServiceControlState> {
  @override
  ServiceControlState build() {
    getServiceList();
    return ServiceControlState.initial();
  }

  Future<void> getServiceList() async {
    final branchId = await AppStorage.getData(
      key: SecurePreferencesKeys.branchId,
    );
    final branchList = await HttpService.instance.get<BaseBranchModel>(
      url: '${APIPath.serviceDetails}?branchId=$branchId',
      fromJsonMethod: BaseBranchModel.fromJson,
    );
    if (branchList.isRight()) {
      state = state.copyWith(
        servicesList: AsyncData(
          branchList.getRight()?.data?.services ?? [],
        ),
      );
    }
  }

  Future<void> onUpdateService({
    required ServiceModel service,
    required BuildContext context,
  }) async {
    await AppDialog.onLoading(context: context);
    final branchId = await AppStorage.getData(
      key: SecurePreferencesKeys.branchId,
    );
    final branchList = await HttpService.instance.put<BaseBranchModel>(
      url: APIPath.updateService,
      body: {
        'branchId': branchId,
        "serviceId": service.id,
        "isEnabled": service.isEnabled,
      },
      fromJsonMethod: BaseBranchModel.fromJson,
    );
    AppRouter.pop();
    if (branchList.isLeft()) {
     AppMessages.alertMessage(message: 'Something wrong');
    }
  }
}
