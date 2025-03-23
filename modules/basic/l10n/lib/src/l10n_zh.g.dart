///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'l10n.g.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';

// Path: <root>
class TranslationsZh extends Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	@override 
	TranslationsZh $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsZh(meta: meta ?? this.$meta);

	// Translations
	@override String get appName => '发发跑酷';
	@override late final _TranslationsMenuPageZh menuPage = _TranslationsMenuPageZh._(_root);
	@override late final _TranslationsGamePageZh gamePage = _TranslationsGamePageZh._(_root);
	@override late final _TranslationsHotkeyDialogZh hotkeyDialog = _TranslationsHotkeyDialogZh._(_root);
	@override late final _TranslationsTrayZh tray = _TranslationsTrayZh._(_root);
	@override late final _TranslationsButtonsZh buttons = _TranslationsButtonsZh._(_root);
	@override late final _TranslationsSettingsZh settings = _TranslationsSettingsZh._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh': '中文',
	};
}

// Path: menuPage
class _TranslationsMenuPageZh extends TranslationsMenuPageEn {
	_TranslationsMenuPageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get playCap => '开始玩';
	@override String get keyboard => '键盘';
	@override String get joystick => '操纵杆';
	@override String get loading => '加载中...';
	@override String get creditsCap => '学分';
	@override String get poweredByPrefix => '由 ';
	@override String get poweredBySuffix => ' 开发';
	@override String get author => '科技小白英仔';
	@override String version({required Object version}) => '版本号: ${version}';
}

// Path: gamePage
class _TranslationsGamePageZh extends TranslationsGamePageEn {
	_TranslationsGamePageZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get talkWizard1 => '你好, 我年轻的骑士! \n你在这里做什么?';
	@override String get talkPlayer1 => '你好! \n我被派去营救一个被生活在这些街区的生物绑架的孩子.';
	@override String get talkWizard2 => '嗯……\n我不想打击你, 但你是第五个被派来执行这项任务的骑士. 到目前为止, 没有人活着回来, 他们的尸体像战利品一样挂在墙上.';
	@override String get talkPlayer2 => '别担心我的老人. 从来没有像我这样的骑士!\n我要消灭这里的一切生灵, 救出孩子!';
	@override String get talkWizard3 => '是的, 自信是你最不缺的!\n那就别说我没提醒你!\n祝你好运!';
	@override String get talkKid1 => '救命! 救命!';
	@override String get talkBoss1 => '闭嘴, 你这个令人垂涎欲滴的小东西!\n是时候品尝你柔软的皮肤了! 哈哈哈...';
	@override String get talkPlayer3 => '这次它不会是你讨厌的生物!\n你可怕的日子结束了!';
	@override String get talkBoss2 => '看那个! 另一个自负的骑士认为他可以阻止我! 哈哈哈\n过来!';
	@override String get talkKid2 => '感谢大神!!! \n你成功打败了这个可怕的生物! 非常感谢! \n我什至不知道如何感谢你!';
	@override String get talkPlayer4 => '能为您提供帮助是我的荣幸! 也别着急赏我, 你爹可是答应我一大笔钱来救你的! :-)';
	@override String get playAgainCap => '再玩一次';
	@override String get congratulations => '恭喜!';
	@override String get thanks => '感谢您测试游戏并感受 Flame 和 Bonfire 在构建 2D 游戏中的威力.\n也许我们可以有一个游戏的延续!\n我希望你喜欢!';
	@override String get doorWithoutKey => '我想我需要一把钥匙才能通过这里!';
}

// Path: hotkeyDialog
class _TranslationsHotkeyDialogZh extends TranslationsHotkeyDialogEn {
	_TranslationsHotkeyDialogZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get description => '请点击键盘上的键来设置快捷键';
}

// Path: tray
class _TranslationsTrayZh extends TranslationsTrayEn {
	_TranslationsTrayZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get settings => '设置';
	@override String get exit => '退出';
}

// Path: buttons
class _TranslationsButtonsZh extends TranslationsButtonsEn {
	_TranslationsButtonsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get cancel => '取消';
	@override String get ok => '确定';
}

// Path: settings
class _TranslationsSettingsZh extends TranslationsSettingsEn {
	_TranslationsSettingsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get shortcutsTitle => '快捷键';
	@override String get shortcutsDescription => '警告：暂不支持定义组合键。';
	@override late final _TranslationsSettingsShortcutsZh shortcuts = _TranslationsSettingsShortcutsZh._(_root);
}

// Path: settings.shortcuts
class _TranslationsSettingsShortcutsZh extends TranslationsSettingsShortcutsEn {
	_TranslationsSettingsShortcutsZh._(TranslationsZh root) : this._root = root, super.internal(root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get move => '移动';
	@override String get attack => '攻击';
	@override String get fire => '开火';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return '发发跑酷';
			case 'menuPage.playCap': return '开始玩';
			case 'menuPage.keyboard': return '键盘';
			case 'menuPage.joystick': return '操纵杆';
			case 'menuPage.loading': return '加载中...';
			case 'menuPage.creditsCap': return '学分';
			case 'menuPage.poweredByPrefix': return '由 ';
			case 'menuPage.poweredBySuffix': return ' 开发';
			case 'menuPage.author': return '科技小白英仔';
			case 'menuPage.version': return ({required Object version}) => '版本号: ${version}';
			case 'gamePage.talkWizard1': return '你好, 我年轻的骑士! \n你在这里做什么?';
			case 'gamePage.talkPlayer1': return '你好! \n我被派去营救一个被生活在这些街区的生物绑架的孩子.';
			case 'gamePage.talkWizard2': return '嗯……\n我不想打击你, 但你是第五个被派来执行这项任务的骑士. 到目前为止, 没有人活着回来, 他们的尸体像战利品一样挂在墙上.';
			case 'gamePage.talkPlayer2': return '别担心我的老人. 从来没有像我这样的骑士!\n我要消灭这里的一切生灵, 救出孩子!';
			case 'gamePage.talkWizard3': return '是的, 自信是你最不缺的!\n那就别说我没提醒你!\n祝你好运!';
			case 'gamePage.talkKid1': return '救命! 救命!';
			case 'gamePage.talkBoss1': return '闭嘴, 你这个令人垂涎欲滴的小东西!\n是时候品尝你柔软的皮肤了! 哈哈哈...';
			case 'gamePage.talkPlayer3': return '这次它不会是你讨厌的生物!\n你可怕的日子结束了!';
			case 'gamePage.talkBoss2': return '看那个! 另一个自负的骑士认为他可以阻止我! 哈哈哈\n过来!';
			case 'gamePage.talkKid2': return '感谢大神!!! \n你成功打败了这个可怕的生物! 非常感谢! \n我什至不知道如何感谢你!';
			case 'gamePage.talkPlayer4': return '能为您提供帮助是我的荣幸! 也别着急赏我, 你爹可是答应我一大笔钱来救你的! :-)';
			case 'gamePage.playAgainCap': return '再玩一次';
			case 'gamePage.congratulations': return '恭喜!';
			case 'gamePage.thanks': return '感谢您测试游戏并感受 Flame 和 Bonfire 在构建 2D 游戏中的威力.\n也许我们可以有一个游戏的延续!\n我希望你喜欢!';
			case 'gamePage.doorWithoutKey': return '我想我需要一把钥匙才能通过这里!';
			case 'hotkeyDialog.description': return '请点击键盘上的键来设置快捷键';
			case 'tray.settings': return '设置';
			case 'tray.exit': return '退出';
			case 'buttons.cancel': return '取消';
			case 'buttons.ok': return '确定';
			case 'settings.shortcutsTitle': return '快捷键';
			case 'settings.shortcutsDescription': return '警告：暂不支持定义组合键。';
			case 'settings.shortcuts.move': return '移动';
			case 'settings.shortcuts.attack': return '攻击';
			case 'settings.shortcuts.fire': return '开火';
			case 'locales.en': return 'English';
			case 'locales.zh': return '中文';
			default: return null;
		}
	}
}

