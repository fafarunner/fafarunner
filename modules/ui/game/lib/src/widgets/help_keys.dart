import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:game/src/constrants/constrants.dart';
import 'package:get/get.dart' hide Translations;
import 'package:l10n/l10n.dart';
import 'package:theme/theme.dart';

import '../controllers/settings_controller.dart';
import 'hotkey_virtual_view.dart';

class HelpKeys extends StatelessWidget {
  const HelpKeys({
    required this.onKeySelected,
    super.key,
  });

  final VoidCallback onKeySelected;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final controller = Get.find<SettingsController>();
    return SizedBox(
      height: 60,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          spacing: 26,
          children: [
            Obx(() {
              final directionalKeys = controller.directionalKeys.value;

              return TextButton(
                onPressed: onKeySelected,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  foregroundColor: WidgetStateProperty.all(FRColors.white),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: HelpDirectionalKeys(
                  directionalKeys: keyboardDirectionalKeys[directionalKeys],
                  label: t.settings.shortcuts.move,
                ),
              );
            }),
            Obx(() {
              final attackKey = controller.attackKey.value;

              return TextButton(
                onPressed: onKeySelected,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  foregroundColor: WidgetStateProperty.all(FRColors.white),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    HotKeyVirtualView(hotKey: attackKey),
                    Text(
                      t.settings.shortcuts.attack,
                      style: const TextStyle(fontFamily: 'Normal'),
                    ),
                  ],
                ),
              );
            }),
            Obx(() {
              final fireKey = controller.fireKey.value;

              return TextButton(
                onPressed: onKeySelected,
                style: ButtonStyle(
                  padding: WidgetStateProperty.all(EdgeInsets.zero),
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  foregroundColor: WidgetStateProperty.all(FRColors.white),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  spacing: 4,
                  children: [
                    HotKeyVirtualView(hotKey: fireKey),
                    Text(
                      t.settings.shortcuts.fire,
                      style: const TextStyle(fontFamily: 'Normal'),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class HelpDirectionalKeys extends StatelessWidget {
  const HelpDirectionalKeys({
    required this.directionalKeys,
    this.label,
    this.labelColor,
    super.key,
  });

  final KeyboardDirectionalKeys directionalKeys;
  final String? label;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      spacing: 4,
      children: [
        HotKeyVirtualView(
          hotKey: directionalKeys.up,
          labelColor: labelColor,
        ),
        Row(
          spacing: 4,
          children: [
            HotKeyVirtualView(
              hotKey: directionalKeys.left,
              labelColor: labelColor,
            ),
            HotKeyVirtualView(
              hotKey: directionalKeys.down,
              labelColor: labelColor,
            ),
            HotKeyVirtualView(
              hotKey: directionalKeys.right,
              labelColor: labelColor,
            ),
          ],
        ),
        if (label != null)
          Text(
            label!,
            style: TextStyle(color: labelColor, fontFamily: 'Normal'),
          ),
      ],
    );
  }
}
