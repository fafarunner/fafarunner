///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsZh implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsZh({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.zh,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <zh>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsZh _root = this; // ignore: unused_field

	// Translations
	@override late final _TranslationsPagesZh pages = _TranslationsPagesZh._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh': '中文',
	};
}

// Path: pages
class _TranslationsPagesZh implements TranslationsPagesEn {
	_TranslationsPagesZh._(this._root);

	final TranslationsZh _root; // ignore: unused_field

	// Translations
	@override String get appName => '发发跑酷';
	@override String get playCap => '开始玩';
	@override String get loading => '加载中...';
	@override String get creditsCap => '学分';
	@override String get poweredByPrefix => '由 ';
	@override String get poweredBySuffix => ' 开发';
	@override String get author => '科技小白英仔';
	@override String version({required Object version}) => '版本号: ${version}';
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

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsZh {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'pages.appName': return '发发跑酷';
			case 'pages.playCap': return '开始玩';
			case 'pages.loading': return '加载中...';
			case 'pages.creditsCap': return '学分';
			case 'pages.poweredByPrefix': return '由 ';
			case 'pages.poweredBySuffix': return ' 开发';
			case 'pages.author': return '科技小白英仔';
			case 'pages.version': return ({required Object version}) => '版本号: ${version}';
			case 'pages.talkWizard1': return '你好, 我年轻的骑士! \n你在这里做什么?';
			case 'pages.talkPlayer1': return '你好! \n我被派去营救一个被生活在这些街区的生物绑架的孩子.';
			case 'pages.talkWizard2': return '嗯……\n我不想打击你, 但你是第五个被派来执行这项任务的骑士. 到目前为止, 没有人活着回来, 他们的尸体像战利品一样挂在墙上.';
			case 'pages.talkPlayer2': return '别担心我的老人. 从来没有像我这样的骑士!\n我要消灭这里的一切生灵, 救出孩子!';
			case 'pages.talkWizard3': return '是的, 自信是你最不缺的!\n那就别说我没提醒你!\n祝你好运!';
			case 'pages.talkKid1': return '救命! 救命!';
			case 'pages.talkBoss1': return '闭嘴, 你这个令人垂涎欲滴的小东西!\n是时候品尝你柔软的皮肤了! 哈哈哈...';
			case 'pages.talkPlayer3': return '这次它不会是你讨厌的生物!\n你可怕的日子结束了!';
			case 'pages.talkBoss2': return '看那个! 另一个自负的骑士认为他可以阻止我! 哈哈哈\n过来!';
			case 'pages.talkKid2': return '感谢大神!!! \n你成功打败了这个可怕的生物! 非常感谢! \n我什至不知道如何感谢你!';
			case 'pages.talkPlayer4': return '能为您提供帮助是我的荣幸! 也别着急赏我, 你爹可是答应我一大笔钱来救你的! :-)';
			case 'pages.playAgainCap': return '再玩一次';
			case 'pages.congratulations': return '恭喜!';
			case 'pages.thanks': return '感谢您测试游戏并感受 Flame 和 Bonfire 在构建 2D 游戏中的威力.\n也许我们可以有一个游戏的延续!\n我希望你喜欢!';
			case 'pages.doorWithoutKey': return '我想我需要一把钥匙才能通过这里!';
			case 'locales.en': return 'English';
			case 'locales.zh': return '中文';
			default: return null;
		}
	}
}

