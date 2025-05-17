import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/model/branch_list_model.dart';

part 'service_control_state.freezed.dart';

@freezed
class ServiceControlState with _$ServiceControlState {
  const factory ServiceControlState({
    required AsyncValue<List<ServiceModel>> servicesList,
  }) = _ServiceControlState;

  factory ServiceControlState.initial() => const ServiceControlState(
        servicesList: AsyncLoading(),
      );
}
