import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/utilities/app_assets.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';
import 'package:marakzia_task/common/widgets/custom_appbar.dart';
import 'package:marakzia_task/common/widgets/custom_button.dart';
import 'package:marakzia_task/common/widgets/drop_down_search.dart';
import 'package:marakzia_task/model/branch_list_model.dart';
import 'package:marakzia_task/view/select_branch/provider/select_branch_provider.dart';

class SelectBranchView extends ConsumerWidget {
  const SelectBranchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(selectBranchProvider);
    final notifier = ref.read(selectBranchProvider.notifier);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const CustomAppBar(),
      body: !provider.branchList.isLoading
          ? Form(
              key: notifier.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Center(
                  child: DropDownSearch<BranchModel>(
                    items: provider.branchList.value ?? [],
                    itemAsString: (branch) => branch.branchNameEn ?? '',
                    label: 'Please choose the branch',
                    onChange: (branch) => notifier.onSelectBranch(
                      selectedBranch: branch,
                    ),
                    hintText: 'Select Branch',
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: CustomButton(
        onPressed: () => notifier.onConfirmSelectedBranch(),
        buttonText: 'Confirm',
      ),
    );
  }
}
