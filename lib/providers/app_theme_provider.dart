import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:projectr/shared/constants.dart';
import 'package:projectr/shared/data/local/storage_service.dart';
import 'package:projectr/shared/domain/providers/shared_preference_service_provider.dart';
import 'package:projectr/shared/enums.dart';
import 'package:projectr/shared/themes/app_theme.dart';

// Riverpod provider
final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeState>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return ThemeNotifier(storageService: storage);
});

class ThemeState {
  final AppThemeMode mode;
  ThemeState({
    required this.mode,
  });

  ThemeData get currentTheme => CURRENT_APP_THEME_MODE == AppThemeMode.light
      ? AppTheme.lightTheme
      : AppTheme.darkTheme;
}

// StateNotifier to manage theme state
class ThemeNotifier extends StateNotifier<ThemeState> {
  final StorageService storageService;
  ThemeNotifier({required this.storageService})
      : super(ThemeState(mode: AppThemeMode.light)) {
    _getCurrentTheme();
  }

  void switchThemeMode(AppThemeMode mode) {
    state = ThemeState(mode: mode);
    CURRENT_APP_THEME_MODE = mode;
    storageService.set(APP_THEME_STORAGE_KEY, state.mode.name);
  }

  void switchModule(AppModule module) {
    state = ThemeState(mode: state.mode);
  }

  void _getCurrentTheme() async {
    final theme = await storageService.get(APP_THEME_STORAGE_KEY);
    if (theme == "" || theme == null) {
      switchThemeMode(AppThemeMode.light);
      storageService.set(APP_THEME_STORAGE_KEY, CURRENT_APP_THEME_MODE.name);
    } else {
      state = ThemeState(
        mode: AppThemeMode.values.byName(theme.toString()),
      );
    }
  }
}
