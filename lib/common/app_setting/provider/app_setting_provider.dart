import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marakzia_task/common/app_setting/state/app_setting_state.dart';
import 'package:marakzia_task/helpers/current_localization.dart';

final appSettingProvider =
    NotifierProvider.autoDispose<AppSettingNotifier, AppSettingState>(
        AppSettingNotifier.new);

class AppSettingNotifier extends AutoDisposeNotifier<AppSettingState> {
  @override
  AppSettingState build() {
    state = AppSettingState.initial();
    return state;
  }

  void setLocale({
    required String language,
  }) {
    final local = Locale(language);
    if (!L10n.supportedLocales.contains(local)) return;
    state = state.copyWith(currentLanguage: local);
  }

  void clearLocale() {
    state = state.copyWith(
      currentLanguage: const Locale('en'),
    );
  }
}

// Helper class to list supported locales
class L10n {
  static const supportedLocales = [
    Locale('en'),
    Locale('ar'),
  ];
}
