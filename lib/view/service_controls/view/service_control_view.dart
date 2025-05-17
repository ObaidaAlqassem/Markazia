import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/widgets/custom_appbar.dart';
import 'package:marakzia_task/common/widgets/custom_button.dart';
import 'package:marakzia_task/routes/app_router.dart';
import 'package:marakzia_task/view/service_controls/provider/service_control_provider.dart';
import 'package:marakzia_task/view/service_controls/widgets/service_control_widget.dart';

class ServiceControlView extends ConsumerWidget {
  const ServiceControlView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(serviceControlProvider);
    final notifier = ref.read(serviceControlProvider.notifier);
    return Scaffold(
      appBar: const CustomAppBar(),
      body: provider.servicesList.when(
        data: (servicesControl) {
          return ListView.separated(
            itemBuilder: (_, index) {
              final service = servicesControl[index];
              return ServiceControlWidget(
                serviceModel: service, notifier: notifier,
              );
            },
            separatorBuilder: (_, index) {
              return SizedBox(
                height: 10.h,
              );
            },
            itemCount: servicesControl.length,
          );
        },
        error: (_, index) {
          return const SizedBox();
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: CustomButton(
        buttonText: 'Back',
        onPressed: () =>AppRouter.pop(),
      ),
    );
  }
}
