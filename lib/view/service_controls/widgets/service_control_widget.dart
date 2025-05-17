import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/model/branch_list_model.dart';
import 'package:marakzia_task/view/service_controls/provider/service_control_provider.dart';

class ServiceControlWidget extends StatefulWidget {
  final ServiceModel serviceModel;
  final ServiceControlNotifier notifier;

  const ServiceControlWidget({
    required this.serviceModel,
    required this.notifier,
    super.key,
  });

  @override
  State<ServiceControlWidget> createState() => _ServiceControlWidgetState();
}

class _ServiceControlWidgetState extends State<ServiceControlWidget> {
  void onUpdateServiceStatus({
    required BuildContext context,
  }) {
    setState(() {
      widget.serviceModel.isEnabled = !(widget.serviceModel.isEnabled ?? false);
    });
    widget.notifier.onUpdateService(
      service: widget.serviceModel,
      context: context,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.settings,
          color: AppColor.whiteColor,
        ),
        SizedBox(
          width: 10.w,
        ),
        Expanded(
          child: Text(
            widget.serviceModel.nameEn ?? '',
            style: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 18.sp,
            ),
          ),
        ),
        Switch(
          value: widget.serviceModel.isEnabled ?? false,
          activeColor: AppColor.greenColor,
          onChanged: (value) => onUpdateServiceStatus(
            context: context,
          ),
        ),
      ],
    );
  }
}
