/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 50 (25 per locale)
///
/// Built on 2024-05-17 at 07:27 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
	en(languageCode: 'en', build: Translations.build),
	zh(languageCode: 'zh', build: _StringsZh.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, Translations> build;

	/// Gets current instance managed by [LocaleSettings].
	Translations get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider extends BaseTranslationProvider<AppLocale, Translations> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, Translations> of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, Translations> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	late final _StringsPagesEn pages = _StringsPagesEn._(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'zh': '中文',
	};
}

// Path: pages
class _StringsPagesEn {
	_StringsPagesEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get appName => 'FaFa Runner';
	String get playCap => 'PLAY';
	String get loading => 'Loading...';
	String get creditsCap => 'CREDITS';
	String get poweredByPrefix => 'Powered by ';
	String get poweredBySuffix => '';
	String get author => 'KJXBYZ';
	String version({required Object version}) => 'Version: ${version}';
	String get talkWizard1 => 'Hello my young knight!\nWhat are you doing here?';
	String get talkPlayer1 => 'Hello!\nI was sent to rescue a child who was kidnapped by creatures that live in those neighborhoods.';
	String get talkWizard2 => 'Humm...\nI don\'t want to demotivate you, but you are the fifth knight sent for this task. So far, none have returned alive and their bodies are hanging from the walls like trophies.';
	String get talkPlayer2 => 'Don\'t worry my old man. Knight like me never existed!\nI will exterminate every creature in this place and rescue the child!';
	String get talkWizard3 => 'Yes, confidence is what you don\'t lack!\nThen don\'t say I didn\'t warn you!\nGood luck!';
	String get talkKid1 => 'Heeeelp! Heeeelp!';
	String get talkBoss1 => 'Shut up, you appetizing little creature!\nThe time has come to taste your soft skin! ha ha ha ha';
	String get talkPlayer3 => 'It won\'t be your disgusting creature this time!\nYour monstrous days are over!';
	String get talkBoss2 => 'Look that! Another knight with an inflated ego thinking he can stop me! ha ha ha ha \nCome here!';
	String get talkKid2 => 'Thank the gods !!! \nYou managed to defeat this horrible creature! Thank you very much! \nI don\'t even know how to thank you!';
	String get talkPlayer4 => 'It was an honor to be able to help you! And don\'t worry about rewarding me, your father promised me a fortune to rescue you! :-)';
	String get playAgainCap => 'PLAY AGAIN';
	String get congratulations => 'CONGRATULATIONS!';
	String get thanks => 'Thanks for testing the game and feeling the power of Flame and Bonfire in building 2D games.\nMaybe we can have a continuation of the game!\nI hope that you enjoyed!';
	String get doorWithoutKey => 'I think I need a key to get through here!';
}

// Path: <root>
class _StringsZh implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsZh.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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

	@override late final _StringsZh _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsPagesZh pages = _StringsPagesZh._(_root);
	@override Map<String, String> get locales => {
		'en': 'English',
		'zh': '中文',
	};
}

// Path: pages
class _StringsPagesZh implements _StringsPagesEn {
	_StringsPagesZh._(this._root);

	@override final _StringsZh _root; // ignore: unused_field

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

extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'pages.appName': return 'FaFa Runner';
			case 'pages.playCap': return 'PLAY';
			case 'pages.loading': return 'Loading...';
			case 'pages.creditsCap': return 'CREDITS';
			case 'pages.poweredByPrefix': return 'Powered by ';
			case 'pages.poweredBySuffix': return '';
			case 'pages.author': return 'KJXBYZ';
			case 'pages.version': return ({required Object version}) => 'Version: ${version}';
			case 'pages.talkWizard1': return 'Hello my young knight!\nWhat are you doing here?';
			case 'pages.talkPlayer1': return 'Hello!\nI was sent to rescue a child who was kidnapped by creatures that live in those neighborhoods.';
			case 'pages.talkWizard2': return 'Humm...\nI don\'t want to demotivate you, but you are the fifth knight sent for this task. So far, none have returned alive and their bodies are hanging from the walls like trophies.';
			case 'pages.talkPlayer2': return 'Don\'t worry my old man. Knight like me never existed!\nI will exterminate every creature in this place and rescue the child!';
			case 'pages.talkWizard3': return 'Yes, confidence is what you don\'t lack!\nThen don\'t say I didn\'t warn you!\nGood luck!';
			case 'pages.talkKid1': return 'Heeeelp! Heeeelp!';
			case 'pages.talkBoss1': return 'Shut up, you appetizing little creature!\nThe time has come to taste your soft skin! ha ha ha ha';
			case 'pages.talkPlayer3': return 'It won\'t be your disgusting creature this time!\nYour monstrous days are over!';
			case 'pages.talkBoss2': return 'Look that! Another knight with an inflated ego thinking he can stop me! ha ha ha ha \nCome here!';
			case 'pages.talkKid2': return 'Thank the gods !!! \nYou managed to defeat this horrible creature! Thank you very much! \nI don\'t even know how to thank you!';
			case 'pages.talkPlayer4': return 'It was an honor to be able to help you! And don\'t worry about rewarding me, your father promised me a fortune to rescue you! :-)';
			case 'pages.playAgainCap': return 'PLAY AGAIN';
			case 'pages.congratulations': return 'CONGRATULATIONS!';
			case 'pages.thanks': return 'Thanks for testing the game and feeling the power of Flame and Bonfire in building 2D games.\nMaybe we can have a continuation of the game!\nI hope that you enjoyed!';
			case 'pages.doorWithoutKey': return 'I think I need a key to get through here!';
			case 'locales.en': return 'English';
			case 'locales.zh': return '中文';
			default: return null;
		}
	}
}

extension on _StringsZh {
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
