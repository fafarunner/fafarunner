import 'package:flutter/material.dart';

import 'package:get/get.dart' hide Translations;
import 'package:hotkey_manager/hotkey_manager.dart';
import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:theme/theme.dart';

import '../controllers/settings_controller.dart';
import '../extensions/extensions.dart';
import '../util/dialogs.dart';
import '../util/navigator_util.dart';
import '../widgets/section_item.dart';

/// Settings
class SettingsModal extends StatelessWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final height = MediaQuery.sizeOf(context).height;

    final controller = Get.find<SettingsController>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              t.tray.settings,
              style: TextStyle(
                color: isDark ? Colors.white : FRColors.primaryTextColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.43,
              ),
            ),
            IconButton(
              style: ButtonStyle(
                padding: WidgetStateProperty.all(
                  const EdgeInsets.all(8),
                ),
                minimumSize: WidgetStateProperty.all(Size.zero),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                elevation: WidgetStateProperty.all(0),
              ),
              onPressed: NavigatorUtil.pop,
              icon: Icon(
                Icons.close,
                color: isDark
                    ? FRColors.primaryTextColor
                    : FRColors.secondaryTextColor,
                size: 16,
              )
                  .nestedPadding(padding: const EdgeInsets.all(2))
                  .nestedDecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: isDark
                          ? FRColors.placeholderTextColor
                          : FRColors.primaryGrayColor,
                    ),
                  ),
            ),
          ],
        )
            .nestedPadding(
              padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            )
            .nestedDecoratedBox(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: FRColors.borderColor, width: 0.5),
                ),
              ),
            ),
        Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 10,
          children: [
            Obx(() {
              final themeMode = controller.themeMode.value;
              final attackKey = controller.attackKey.value;
              final fireKey = controller.fireKey.value;
              printDebugLog('themeMode: $themeMode');

              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MineSectionGroup(
                    title: t.settings.shortcutsTitle,
                    description: t.settings.shortcutsDescription,
                    descriptionColor: FRColors.warnTextColor,
                    items: [
                      MineSectionModel(
                        title: t.settings.shortcuts.attack,
                        showIcon: false,
                        trailing: TextButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                            ),
                            overlayColor: WidgetStateProperty.all(
                              FRColors.primaryBackgroundColor
                                  .withValues(alpha: 0.3),
                            ),
                            surfaceTintColor: WidgetStateProperty.all(
                              FRColors.primaryBackgroundColor
                                  .withValues(alpha: 0.5),
                            ),
                            minimumSize: WidgetStateProperty.all(Size.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () => Dialogs.showHotkeyDialog(
                            attackKey,
                            onHotKeyRecorded: controller.setAttackHotkey,
                          ),
                          child: HotKeyVirtualView(hotKey: attackKey),
                        ),
                      ),
                      MineSectionModel(
                        title: t.settings.shortcuts.fire,
                        showIcon: false,
                        trailing: TextButton(
                          style: ButtonStyle(
                            padding: WidgetStateProperty.all(
                              const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 18,
                              ),
                            ),
                            overlayColor: WidgetStateProperty.all(
                              FRColors.primaryBackgroundColor
                                  .withValues(alpha: 0.3),
                            ),
                            surfaceTintColor: WidgetStateProperty.all(
                              FRColors.primaryBackgroundColor
                                  .withValues(alpha: 0.5),
                            ),
                            minimumSize: WidgetStateProperty.all(Size.zero),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          onPressed: () => Dialogs.showHotkeyDialog(
                            fireKey,
                            onHotKeyRecorded: controller.setFireHotkey,
                          ),
                          child: HotKeyVirtualView(hotKey: fireKey),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }),
          ],
        )
            .nestedSingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10),
            )
            .nestedFlexible(),
      ],
    )
        .nestedConstrainedBox(
          constraints: BoxConstraints(maxHeight: height * 0.8),
        )
        .nestedPadding(
          padding: EdgeInsets.only(bottom: 20 + bottom),
        )
        .nestedColoredBox(
          color: isDark ? FRColors.dialogBackgroundColor : Colors.white,
        );
  }
}
