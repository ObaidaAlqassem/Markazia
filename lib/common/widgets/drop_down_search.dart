import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marakzia_task/common/utilities/app_color.dart';

class DropDownSearch<T> extends StatelessWidget {
  final List<T> items;
  final DropdownSearchItemAsString<T> itemAsString;
  final void Function(T)? onChange;
  final String? label;
  final String? hintText;
  final T? selectedItem;
  final bool showSearchBox;

  const DropDownSearch({
    required this.items,
    required this.itemAsString,
    this.label,
    this.hintText,
    this.onChange,
    this.showSearchBox = true,
    this.selectedItem,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
            color: AppColor.whiteColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        DropdownSearch<T>(
          selectedItem: selectedItem,
          items: (filter, infiniteScrollProps) => items,
          decoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(
              color: AppColor.whiteColor,
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              suffixIconColor: AppColor.whiteColor,
              hintText: hintText,
              hintStyle: TextStyle(
                color: AppColor.whiteColor.withAlpha(400),
              ),
            ),
          ),
          compareFn: (value1, value2) => value1 == value2,
          popupProps: PopupProps.menu(
            searchFieldProps: TextFieldProps(
              style: TextStyle(
                color: AppColor.whiteColor,
                // Text color inside the search box
                fontSize: 16.sp,
              ),
            ),
            searchDelay: Duration.zero,
            itemBuilder: (context, item, isSelected, itemBuilder) => ListTile(
              title: Text(
                itemAsString.call(item),
                style: TextStyle(
                  color: AppColor.whiteColor,
                  fontSize: 16.sp,
                ),
              ),
            ),
            scrollbarProps: ScrollbarProps(
              thumbVisibility: true,
              // Show the scrollbar thumb
              thickness: 6,
              // Thickness of scrollbar thumb
              radius: Radius.circular(10),
              // Rounded corners of the thumb
              thumbColor: AppColor.whiteColor,
              // Color of the thumb
              trackColor: AppColor.whiteColor, // Scrollbar track color
            ),
            fit: FlexFit.loose,
            showSearchBox: showSearchBox,
            containerBuilder: (context, popupWidget) {
              return Container(
                decoration: BoxDecoration(
                  color: Theme.of(context)
                      .canvasColor
                      .withAlpha(220), // Uses theme value
                ),
                child: popupWidget,
              );
            },
          ),
          onChanged: (selectedItem) => onChange?.call(selectedItem as T),
          itemAsString: itemAsString,
          validator: (data) {
            if (data == null) {
              return 'This field is required';
            }
            return null;
          },
        ),
      ],
    );
  }
}
