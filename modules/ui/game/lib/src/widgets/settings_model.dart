import 'package:bonfire/bonfire.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:group_button/group_button.dart';
import 'package:l10n/l10n.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:theme/theme.dart';

import '../constrants/constrants.dart';
import '../enums/enums.dart';
import '../providers/providers.dart';
import '../util/dialogs.dart';
import '../util/navigator_util.dart';
import '../widgets/section_item.dart';
import 'help_keys.dart';
import 'hotkey_virtual_view.dart';

List<DirectionalKeysWrapper> buttons = [
  DirectionalKeysWrapper(
    DirectionalKeys.arrows,
    KeyboardDirectionalKeys.arrows(),
  ),
  DirectionalKeysWrapper(DirectionalKeys.wasd, KeyboardDirectionalKeys.wasd()),
];

/// Settings
class SettingsModal extends StatefulWidget {
  const SettingsModal({super.key});

  @override
  State<SettingsModal> createState() => _SettingsModalState();
}

class _SettingsModalState extends State<SettingsModal> {
  late GroupButtonController groupButtonController;
  late SettingsProvider settingsProvider = context.read<SettingsProvider>();

  @override
  void initState() {
    super.initState();
    groupButtonController = GroupButtonController(
      selectedIndex: settingsProvider.directionalKeys,
    );
  }

  @override
  void dispose() {
    groupButtonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bottom = MediaQuery.paddingOf(context).bottom;
    final height = MediaQuery.sizeOf(context).height;

    return ColoredBox(
      color: isDark ? FRColors.dialogBackgroundColor : Colors.white,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20 + bottom),
        child: ConstrainedBox(
          constraints: BoxConstraints(maxHeight: height * 0.8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: FRColors.borderColor, width: 0.5),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        t.tray.settings,
                        style: TextStyle(
                          color: isDark
                              ? Colors.white
                              : FRColors.primaryTextColor,
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
                        icon: DecoratedBox(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: isDark
                                ? FRColors.placeholderTextColor
                                : FRColors.primaryGrayColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(
                              Icons.close,
                              color: isDark
                                  ? FRColors.primaryTextColor
                                  : FRColors.secondaryTextColor,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 10,
                    children: [
                      Consumer<SettingsProvider>(
                        builder: (context, provider, child) {
                          final themeMode = provider.themeMode;
                          final directionalKeys = provider.directionalKeys;
                          final attackKey = provider.attackKey;
                          final fireKey = provider.fireKey;
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
                                    title: t.settings.shortcuts.move,
                                    showIcon: false,
                                    trailing: GroupButton<DirectionalKeysWrapper>(
                                      options: const GroupButtonOptions(
                                        selectedColor: FRColors.primaryColor,
                                      ),
                                      // style: ButtonStyle(
                                      //   padding: WidgetStateProperty.all(
                                      //     const EdgeInsets.symmetric(
                                      //       vertical: 12,
                                      //       horizontal: 18,
                                      //     ),
                                      //   ),
                                      //   overlayColor: WidgetStateProperty.all(
                                      //     FRColors.primaryBackgroundColor
                                      //         .withValues(alpha: 0.3),
                                      //   ),
                                      //   surfaceTintColor: WidgetStateProperty.all(
                                      //     FRColors.primaryBackgroundColor
                                      //         .withValues(alpha: 0.5),
                                      //   ),
                                      //   minimumSize: WidgetStateProperty.all(Size.zero),
                                      //   tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                      // ),
                                      // onPressed: () => Dialogs.showHotkeyDialog(
                                      //   attackKey,
                                      //   onHotKeyRecorded: controller.setAttackHotkey,
                                      // ),
                                      controller: groupButtonController,
                                      buttons: buttons,
                                      buttonIndexedBuilder: (selected, index, context) {
                                        return GestureDetector(
                                          onTap: () {
                                            printErrorLog(
                                              'index: $index, selected: $selected',
                                            );
                                            final keyboardDirectionalKey =
                                                keyboardDirectionalKeys
                                                    .elementAt(index);
                                            if (keyboardDirectionalKey.contain(
                                                  attackKey,
                                                ) ||
                                                keyboardDirectionalKey.contain(
                                                  fireKey,
                                                )) {
                                              BotToast.showText(
                                                text: t.settings.shortcutsUsed,
                                              );
                                              return;
                                            }

                                            provider.setDirectionalKeys(index);
                                          },
                                          behavior: HitTestBehavior.opaque,
                                          child: HelpDirectionalKeys(
                                            // label:
                                            //     buttons.elementAt(index).directionalKeys.name,
                                            directionalKeys: buttons
                                                .elementAt(index)
                                                .keyboardDirectionalKeys,
                                            labelColor: index == directionalKeys
                                                ? FRColors.primaryColor
                                                : null,
                                          ),
                                        );
                                      },
                                      // child: HotKeyVirtualView(hotKey: attackKey),
                                    ),
                                  ),
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
                                        surfaceTintColor:
                                            WidgetStateProperty.all(
                                              FRColors.primaryBackgroundColor
                                                  .withValues(alpha: 0.5),
                                            ),
                                        minimumSize: WidgetStateProperty.all(
                                          Size.zero,
                                        ),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () => Dialogs.showHotkeyDialog(
                                        attackKey,
                                        onHotKeyRecorded:
                                            provider.setAttackHotkey,
                                      ),
                                      child: HotKeyVirtualView(
                                        hotKey: attackKey,
                                      ),
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
                                        surfaceTintColor:
                                            WidgetStateProperty.all(
                                              FRColors.primaryBackgroundColor
                                                  .withValues(alpha: 0.5),
                                            ),
                                        minimumSize: WidgetStateProperty.all(
                                          Size.zero,
                                        ),
                                        tapTargetSize:
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      onPressed: () => Dialogs.showHotkeyDialog(
                                        fireKey,
                                        onHotKeyRecorded:
                                            provider.setFireHotkey,
                                      ),
                                      child: HotKeyVirtualView(hotKey: fireKey),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DirectionalKeysWrapper {
  DirectionalKeysWrapper(this.directionalKeys, this.keyboardDirectionalKeys);

  final DirectionalKeys directionalKeys;
  final KeyboardDirectionalKeys keyboardDirectionalKeys;
}
