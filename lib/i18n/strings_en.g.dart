///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
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
	late final TranslationsPagesEn pages = TranslationsPagesEn.internal(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'zh': '中文',
	};
}

// Path: pages
class TranslationsPagesEn {
	TranslationsPagesEn.internal(this._root);

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

