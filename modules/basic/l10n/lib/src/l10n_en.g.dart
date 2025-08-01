///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'l10n.g.dart';

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
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// en: 'FaFa Runner'
	String get appName => 'FaFa Runner';

	late final TranslationsMenuPageEn menuPage = TranslationsMenuPageEn.internal(_root);
	late final TranslationsGamePageEn gamePage = TranslationsGamePageEn.internal(_root);
	late final TranslationsHotkeyDialogEn hotkeyDialog = TranslationsHotkeyDialogEn.internal(_root);
	late final TranslationsTrayEn tray = TranslationsTrayEn.internal(_root);
	late final TranslationsButtonsEn buttons = TranslationsButtonsEn.internal(_root);
	late final TranslationsSettingsEn settings = TranslationsSettingsEn.internal(_root);
	Map<String, String> get locales => {
		'en': 'English',
		'zh': '中文',
	};
}

// Path: menuPage
class TranslationsMenuPageEn {
	TranslationsMenuPageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PLAY'
	String get playCap => 'PLAY';

	/// en: 'Keyboard'
	String get keyboard => 'Keyboard';

	/// en: 'Joystick'
	String get joystick => 'Joystick';

	/// en: 'Loading...'
	String get loading => 'Loading...';

	/// en: 'CREDITS'
	String get creditsCap => 'CREDITS';

	/// en: 'Powered by '
	String get poweredByPrefix => 'Powered by ';

	/// en: ''
	String get poweredBySuffix => '';

	/// en: 'KJXBYZ'
	String get author => 'KJXBYZ';

	/// en: 'Version: $version'
	String version({required Object version}) => 'Version: ${version}';
}

// Path: gamePage
class TranslationsGamePageEn {
	TranslationsGamePageEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Hello my young knight! What are you doing here?'
	String get talkWizard1 => 'Hello my young knight!\nWhat are you doing here?';

	/// en: 'Hello! I was sent to rescue a child who was kidnapped by creatures that live in those neighborhoods.'
	String get talkPlayer1 => 'Hello!\nI was sent to rescue a child who was kidnapped by creatures that live in those neighborhoods.';

	/// en: 'Humm... I don't want to demotivate you, but you are the fifth knight sent for this task. So far, none have returned alive and their bodies are hanging from the walls like trophies.'
	String get talkWizard2 => 'Humm...\nI don\'t want to demotivate you, but you are the fifth knight sent for this task. So far, none have returned alive and their bodies are hanging from the walls like trophies.';

	/// en: 'Don't worry my old man. Knight like me never existed! I will exterminate every creature in this place and rescue the child!'
	String get talkPlayer2 => 'Don\'t worry my old man. Knight like me never existed!\nI will exterminate every creature in this place and rescue the child!';

	/// en: 'Yes, confidence is what you don't lack! Then don't say I didn't warn you! Good luck!'
	String get talkWizard3 => 'Yes, confidence is what you don\'t lack!\nThen don\'t say I didn\'t warn you!\nGood luck!';

	/// en: 'Heeeelp! Heeeelp!'
	String get talkKid1 => 'Heeeelp! Heeeelp!';

	/// en: 'Shut up, you appetizing little creature! The time has come to taste your soft skin! ha ha ha ha'
	String get talkBoss1 => 'Shut up, you appetizing little creature!\nThe time has come to taste your soft skin! ha ha ha ha';

	/// en: 'It won't be your disgusting creature this time! Your monstrous days are over!'
	String get talkPlayer3 => 'It won\'t be your disgusting creature this time!\nYour monstrous days are over!';

	/// en: 'Look that! Another knight with an inflated ego thinking he can stop me! ha ha ha ha Come here!'
	String get talkBoss2 => 'Look that! Another knight with an inflated ego thinking he can stop me! ha ha ha ha \nCome here!';

	/// en: 'Thank the gods !!! You managed to defeat this horrible creature! Thank you very much! I don't even know how to thank you!'
	String get talkKid2 => 'Thank the gods !!! \nYou managed to defeat this horrible creature! Thank you very much! \nI don\'t even know how to thank you!';

	/// en: 'It was an honor to be able to help you! And don't worry about rewarding me, your father promised me a fortune to rescue you! :-)'
	String get talkPlayer4 => 'It was an honor to be able to help you! And don\'t worry about rewarding me, your father promised me a fortune to rescue you! :-)';

	/// en: 'PLAY AGAIN'
	String get playAgainCap => 'PLAY AGAIN';

	/// en: 'CONGRATULATIONS!'
	String get congratulations => 'CONGRATULATIONS!';

	/// en: 'Thanks for testing the game and feeling the power of Flame and Bonfire in building 2D games. Maybe we can have a continuation of the game! I hope that you enjoyed!'
	String get thanks => 'Thanks for testing the game and feeling the power of Flame and Bonfire in building 2D games.\nMaybe we can have a continuation of the game!\nI hope that you enjoyed!';

	/// en: 'I think I need a key to get through here!'
	String get doorWithoutKey => 'I think I need a key to get through here!';
}

// Path: hotkeyDialog
class TranslationsHotkeyDialogEn {
	TranslationsHotkeyDialogEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Please click the key on your keyboard to set the shortcut'
	String get description => 'Please click the key on your keyboard to set the shortcut';
}

// Path: tray
class TranslationsTrayEn {
	TranslationsTrayEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Settings'
	String get settings => 'Settings';

	/// en: 'Exit'
	String get exit => 'Exit';
}

// Path: buttons
class TranslationsButtonsEn {
	TranslationsButtonsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'OK'
	String get ok => 'OK';
}

// Path: settings
class TranslationsSettingsEn {
	TranslationsSettingsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Shortcuts'
	String get shortcutsTitle => 'Shortcuts';

	/// en: 'WARNING: Defining key combinations is not currently supported.'
	String get shortcutsDescription => 'WARNING: Defining key combinations is not currently supported.';

	/// en: 'This key is an application built-in key.'
	String get shortcutsRegistered => 'This key is an application built-in key.';

	/// en: 'This key is used as a direction key.'
	String get shortcutsArrow => 'This key is used as a direction key.';

	/// en: 'This key is used.'
	String get shortcutsUsed => 'This key is used.';

	late final TranslationsSettingsShortcutsEn shortcuts = TranslationsSettingsShortcutsEn.internal(_root);
}

// Path: settings.shortcuts
class TranslationsSettingsShortcutsEn {
	TranslationsSettingsShortcutsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Move'
	String get move => 'Move';

	/// en: 'Attack'
	String get attack => 'Attack';

	/// en: 'Fire'
	String get fire => 'Fire';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'appName': return 'FaFa Runner';
			case 'menuPage.playCap': return 'PLAY';
			case 'menuPage.keyboard': return 'Keyboard';
			case 'menuPage.joystick': return 'Joystick';
			case 'menuPage.loading': return 'Loading...';
			case 'menuPage.creditsCap': return 'CREDITS';
			case 'menuPage.poweredByPrefix': return 'Powered by ';
			case 'menuPage.poweredBySuffix': return '';
			case 'menuPage.author': return 'KJXBYZ';
			case 'menuPage.version': return ({required Object version}) => 'Version: ${version}';
			case 'gamePage.talkWizard1': return 'Hello my young knight!\nWhat are you doing here?';
			case 'gamePage.talkPlayer1': return 'Hello!\nI was sent to rescue a child who was kidnapped by creatures that live in those neighborhoods.';
			case 'gamePage.talkWizard2': return 'Humm...\nI don\'t want to demotivate you, but you are the fifth knight sent for this task. So far, none have returned alive and their bodies are hanging from the walls like trophies.';
			case 'gamePage.talkPlayer2': return 'Don\'t worry my old man. Knight like me never existed!\nI will exterminate every creature in this place and rescue the child!';
			case 'gamePage.talkWizard3': return 'Yes, confidence is what you don\'t lack!\nThen don\'t say I didn\'t warn you!\nGood luck!';
			case 'gamePage.talkKid1': return 'Heeeelp! Heeeelp!';
			case 'gamePage.talkBoss1': return 'Shut up, you appetizing little creature!\nThe time has come to taste your soft skin! ha ha ha ha';
			case 'gamePage.talkPlayer3': return 'It won\'t be your disgusting creature this time!\nYour monstrous days are over!';
			case 'gamePage.talkBoss2': return 'Look that! Another knight with an inflated ego thinking he can stop me! ha ha ha ha \nCome here!';
			case 'gamePage.talkKid2': return 'Thank the gods !!! \nYou managed to defeat this horrible creature! Thank you very much! \nI don\'t even know how to thank you!';
			case 'gamePage.talkPlayer4': return 'It was an honor to be able to help you! And don\'t worry about rewarding me, your father promised me a fortune to rescue you! :-)';
			case 'gamePage.playAgainCap': return 'PLAY AGAIN';
			case 'gamePage.congratulations': return 'CONGRATULATIONS!';
			case 'gamePage.thanks': return 'Thanks for testing the game and feeling the power of Flame and Bonfire in building 2D games.\nMaybe we can have a continuation of the game!\nI hope that you enjoyed!';
			case 'gamePage.doorWithoutKey': return 'I think I need a key to get through here!';
			case 'hotkeyDialog.description': return 'Please click the key on your keyboard to set the shortcut';
			case 'tray.settings': return 'Settings';
			case 'tray.exit': return 'Exit';
			case 'buttons.cancel': return 'Cancel';
			case 'buttons.ok': return 'OK';
			case 'settings.shortcutsTitle': return 'Shortcuts';
			case 'settings.shortcutsDescription': return 'WARNING: Defining key combinations is not currently supported.';
			case 'settings.shortcutsRegistered': return 'This key is an application built-in key.';
			case 'settings.shortcutsArrow': return 'This key is used as a direction key.';
			case 'settings.shortcutsUsed': return 'This key is used.';
			case 'settings.shortcuts.move': return 'Move';
			case 'settings.shortcuts.attack': return 'Attack';
			case 'settings.shortcuts.fire': return 'Fire';
			case 'locales.en': return 'English';
			case 'locales.zh': return '中文';
			default: return null;
		}
	}
}

