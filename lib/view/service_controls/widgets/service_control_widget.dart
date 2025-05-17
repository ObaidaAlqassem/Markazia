import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/model/branch_list_model.dart';

class ServiceControlWidget extends StatefulWidget {
  final ServiceModel serviceModel;

  const ServiceControlWidget({
    required this.serviceModel,
    super.key,
  });

  @override
  State<ServiceControlWidget> createState() => _ServiceControlWidgetState();
}

class _ServiceControlWidgetState extends State<ServiceControlWidget> {
  void onUpdateServiceStatus() {
    setState(() {
      widget.serviceModel.isEnabled = !(widget.serviceModel.isEnabled ?? false);
    });
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
          ),
        ),
        Switch(
          value: widget.serviceModel.isEnabled ?? false,
          onChanged: (value) => onUpdateServiceStatus(),
        ),
      ],
    );
  }
}
