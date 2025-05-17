import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_setting_state.freezed.dart';

@freezed
class AppSettingState with _$AppSettingState {
  const factory AppSettingState({
    @Default(Locale('en')) Locale currentLanguage,
  }) = _AppSettingState;

  factory AppSettingState.initial() => const AppSettingState();
}
