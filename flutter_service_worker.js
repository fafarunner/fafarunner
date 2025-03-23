'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "f2ad9363618c5f62e813740099a80e63",
"canvaskit/skwasm.wasm": "f0dfd99007f989368db17c9abeed5a49",
"canvaskit/skwasm.js.symbols": "80806576fa1056b43dd6d0b445b4b6f7",
"canvaskit/skwasm_st.js": "d1326ceef381ad382ab492ba5d96f04d",
"canvaskit/skwasm_st.wasm": "56c3973560dfcbf28ce47cebe40f3206",
"canvaskit/canvaskit.wasm": "efeeba7dcc952dae57870d4df3111fad",
"canvaskit/skwasm_st.js.symbols": "c7e7aac7cd8b612defd62b43e3050bdd",
"canvaskit/canvaskit.js": "86e461cf471c1640fd2b461ece4589df",
"canvaskit/canvaskit.js.symbols": "68eb703b9a609baef8ee0e413b442f33",
"canvaskit/chromium/canvaskit.wasm": "64a386c87532ae52ae041d18a32a3635",
"canvaskit/chromium/canvaskit.js": "34beda9f39eb7d992d46125ca868dc61",
"canvaskit/chromium/canvaskit.js.symbols": "5a23598a2a8efd18ec3b60de5d28af8f",
"splash/img/light-4x.png": "be8d3087e636229ccafada26db58551a",
"splash/img/dark-3x.png": "be88984696028bc8246d2d8b3e96f8fa",
"splash/img/light-3x.png": "be88984696028bc8246d2d8b3e96f8fa",
"splash/img/light-1x.png": "1d986f67c7ab4254e135bcf652feeebf",
"splash/img/dark-1x.png": "1d986f67c7ab4254e135bcf652feeebf",
"splash/img/light-2x.png": "820961dac4a636d07da0e33c07eab606",
"splash/img/dark-2x.png": "820961dac4a636d07da0e33c07eab606",
"splash/img/dark-4x.png": "be8d3087e636229ccafada26db58551a",
"index.html": "98bd5d2c2707a444551d433bd2b2a769",
"/": "98bd5d2c2707a444551d433bd2b2a769",
"assets/NOTICES": "dc8c059a0afb7ad1308b8a008d544d4a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "c49b0acc240f52839912b0e7bb19b492",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/FontManifest.json": "61640e4b1011cb0c10ce226064a215d6",
"assets/AssetManifest.bin.json": "c24d37f11a964c04e6ba6105f1c77add",
"assets/packages/game/assets/play_again.png": "9f76b916b2f41060feb788b2f7deefb6",
"assets/packages/game/assets/logo.png": "4a7b6ad9452ff9f732c0ce7faf751390",
"assets/packages/game/assets/game_over.png": "664f7f622ca4bcc7781ce556b3e95df8",
"assets/packages/game/assets/images/player/fireball_top.png": "e9a76f3ea950d6bc22f8f4cd3a22d7e3",
"assets/packages/game/assets/images/player/fireball_left.png": "cb3370c9039ec112af7bee6edf3e342d",
"assets/packages/game/assets/images/player/player_atack_effect_top.png": "7b01845d595c3803a07567ee87710658",
"assets/packages/game/assets/images/player/player_atack_effect_left.png": "5b5475da758d76f79c34429f70f7f6af",
"assets/packages/game/assets/images/player/player_crypt.png": "8e55febc1e2563a9d7ba4b48625ba88d",
"assets/packages/game/assets/images/player/knight_run_left.png": "ce9f3ad71135b459f6b66c892b5b9e30",
"assets/packages/game/assets/images/player/fireball_bottom.png": "05522f950d8d60e15615ee9705ff2ef0",
"assets/packages/game/assets/images/player/knight_run.png": "9cac5c91f943ba81915573bd93060d4d",
"assets/packages/game/assets/images/player/player_atack_effect_right.png": "39b3d8583205c90284cd60f0e018f29d",
"assets/packages/game/assets/images/player/knight_idle_left.png": "e4ddca181210b0cf9555331aaf2af512",
"assets/packages/game/assets/images/player/player_atack_effect_bottom.png": "e2406062be291971a034123fdd1757f9",
"assets/packages/game/assets/images/player/fireball_right.png": "aaa2c18fe241c16e95be131619693b80",
"assets/packages/game/assets/images/player/knight_idle.png": "191737282656dd3c8851a2dd3dfc1c0c",
"assets/packages/game/assets/images/player/explosion_fire.png": "81a3691935a18a30572870b759ad1683",
"assets/packages/game/assets/images/npc/kid_idle_right.png": "43e730b096bc0165a0ac3fa87e42e61f",
"assets/packages/game/assets/images/npc/wizard_idle_left.png": "d007579b66fc0760964f6e894ab245ab",
"assets/packages/game/assets/images/npc/kid_idle_left.png": "de8286bb5fe4f2284391197ceaef0361",
"assets/packages/game/assets/images/npc/wizard.png": "a8b090d2853a2035fc48c9fd78ca9a71",
"assets/packages/game/assets/images/joystick_atack_range_selected.png": "06f85cdc0deaf633e544f0ad9f0c75f8",
"assets/packages/game/assets/images/smoke_explosin.png": "555a8a42b72e662af232dc2092103c2a",
"assets/packages/game/assets/images/joystick_atack_selected.png": "5196050c562862a670e7757392710c4d",
"assets/packages/game/assets/images/enemy/imp/imp_idle.png": "fd0a267c699d58df27658a67a1df9c98",
"assets/packages/game/assets/images/enemy/imp/imp_idle_left.png": "6f2711ec02e91aeec1e74c0d0978c117",
"assets/packages/game/assets/images/enemy/imp/imp_run_right.png": "c309ba53677834ee89b49b2ca809f19a",
"assets/packages/game/assets/images/enemy/imp/imp_run_left.png": "f92f71d23122eea1b6de55830f2f5dcc",
"assets/packages/game/assets/images/enemy/boss/boss_run_right.png": "e7509da7b9d5aa375ec12c916c6731bc",
"assets/packages/game/assets/images/enemy/boss/boss_idle_left.png": "2c676458b5c2c1f4c835d3a29bceeb4f",
"assets/packages/game/assets/images/enemy/boss/boss_run_left.png": "ed663ba496619ace977619bacf9ba60b",
"assets/packages/game/assets/images/enemy/boss/boss_idle.png": "f722e5ea7c26f7613b885c0421a1922d",
"assets/packages/game/assets/images/enemy/atack_effect_left.png": "9c99ad913fcc75ce253f8db53faa846f",
"assets/packages/game/assets/images/enemy/atack_effect_right.png": "15831f9ccee22a845e854ccb3d18f6e5",
"assets/packages/game/assets/images/enemy/atack_effect_bottom.png": "aaeb1a8e791a0f15ba911e1d2540ab32",
"assets/packages/game/assets/images/enemy/goblin/goblin_run_right.png": "565c2f9a0bb01a9c56975664f8cd375c",
"assets/packages/game/assets/images/enemy/goblin/goblin_run_left.png": "05863189b562610b17a062114c7849a9",
"assets/packages/game/assets/images/enemy/goblin/goblin_idle.png": "8c97e935786b994c3cff4008212381b9",
"assets/packages/game/assets/images/enemy/goblin/goblin_idle_left.png": "a7563675f85ed259b2d0aae50ded196b",
"assets/packages/game/assets/images/enemy/mini_boss/mini_boss_idle_left.png": "bb3328289e788dc55212923e8636bcc6",
"assets/packages/game/assets/images/enemy/mini_boss/mini_boss_run_left.png": "f3ad68ec82c01c8c637594eee1410dcf",
"assets/packages/game/assets/images/enemy/mini_boss/mini_boss_idle.png": "c209ff336493312f3ac00bf473b9f059",
"assets/packages/game/assets/images/enemy/mini_boss/mini_boss_run_right.png": "0c646c8bd124d0ccb516160a34442f53",
"assets/packages/game/assets/images/enemy/atack_effect_top.png": "df3eeb246450bf06de6dfc325d0bdbd0",
"assets/packages/game/assets/images/joystick_atack.png": "a525ebd6bd0a9014c513884b7811f019",
"assets/packages/game/assets/images/emote/emote_love.png": "16913278e27883e8075a9b58af09e5f0",
"assets/packages/game/assets/images/emote/emote_exclamacao.png": "8b1897ae92f3a077e0aadaef2626d65a",
"assets/packages/game/assets/images/emote/emote_interregacao.png": "9afe746a2fdb43b7d126270712911544",
"assets/packages/game/assets/images/emote/emote_dots.png": "be3fbdff0238dc988be233225c230e75",
"assets/packages/game/assets/images/joystick_atack_range.png": "ff4ce744c80e383080ad2316ba0a9b9b",
"assets/packages/game/assets/images/joystick_knob.png": "c088b1ce385c20537c22dc2d4d39245a",
"assets/packages/game/assets/images/keyboard_tip.png": "3cb49ccd23380c09b95e1784d6c5b837",
"assets/packages/game/assets/images/explosion.png": "6969a53851107eb6c133a49cddbad3c3",
"assets/packages/game/assets/images/crypt.png": "8e55febc1e2563a9d7ba4b48625ba88d",
"assets/packages/game/assets/images/joystick_background.png": "2eef7b32e484d81f07eeb405b39c83a4",
"assets/packages/game/assets/images/tiled/tileSet.json": "f71c870db94b28b6e7b4f8a8a440c0c0",
"assets/packages/game/assets/images/tiled/map.json": "73c4a7dbaa818c33618efd58603e320b",
"assets/packages/game/assets/images/tiled/tile_set.png": "ee2500bc8bfdbfab012db5018b3969e2",
"assets/packages/game/assets/images/health_ui.png": "219e39516312f2f6bc264357497b99cb",
"assets/packages/game/assets/images/items/potion_red.png": "49cc98d9207a350b8266765ee890d09e",
"assets/packages/game/assets/images/items/key_silver.png": "7a3dc96e5dfb0e5000bad51da22e9fa7",
"assets/packages/game/assets/images/items/door_open.png": "430f6d0439652b87ce68ed84af5fb8c7",
"assets/packages/game/assets/images/items/torch_spritesheet.png": "858f57abd642f0303de50d719532f198",
"assets/packages/game/assets/images/items/door_closed.png": "c6ede55672762276cc71eca8cfe8a3e9",
"assets/packages/game/assets/images/items/stair_nextlevel.png": "779e0df7810b0e8b4fdbf49ab3aab96b",
"assets/packages/game/assets/images/items/spikes.png": "17b9e2041471cf40cc10cf4357e33bed",
"assets/packages/game/assets/images/items/bomb_anim_spritesheet.png": "da3b744bbf6d70d8d82c717ca7bf0078",
"assets/packages/game/assets/images/items/chest_spritesheet.png": "bcc8785d27d816e23eca114dd4e708ed",
"assets/packages/game/assets/images/items/barrel.png": "dc4d5a9e456b6f1c6ec6fdcc66af7727",
"assets/packages/game/assets/audio/battle_boss.mp3": "5c10fe38fddf586c9d694d8a28aa8a57",
"assets/packages/game/assets/audio/explosion.wav": "4ca7bc18a6487c7f43ddc9f739691c9a",
"assets/packages/game/assets/audio/attack_player.mp3": "ecb761207d8dccc6ff5814906211d47c",
"assets/packages/game/assets/audio/attack_enemy.mp3": "95c6ab8e9515377506e4f88ed660fa14",
"assets/packages/game/assets/audio/sound_interaction.wav": "02583765123656547a68bcb7dc7ebcc3",
"assets/packages/game/assets/audio/sound_bg.mp3": "603c391173ab8f849d737d0fa4fa0261",
"assets/packages/game/assets/audio/attack_fire_ball.wav": "49601c8eb5ba3a0148d60a178cd6a06f",
"assets/packages/game/assets/tray_logo.png": "78a0e4405acea98d355145bb6ebf6c21",
"assets/packages/game/assets/tray_icon.ico": "8cf7a82d8c25b3493eeac71e77edeb0c",
"assets/packages/game/fonts/font_pixel.ttf": "5fcd6c657ffa8a6791632c705f0944ea",
"assets/packages/flame_splash_screen/assets/layer3.png": "24a8fdc53b85d6d749cc2857c708de49",
"assets/packages/flame_splash_screen/assets/layer1.png": "31625c711892b1d250fe3bb58ad32850",
"assets/packages/flame_splash_screen/assets/layer2.png": "51efb74c8ec5a2fd21f622392678f607",
"assets/AssetManifest.json": "b79e83539212681f10d99e25b48af44b",
"version.json": "b3479f283226ff706fd661306ecd961b",
"flutter.js": "76f08d47ff9f5715220992f993002504",
"main.dart.js": "1cfe638d302d69db8a2b264ee27a2035",
"icons/Icon-maskable-512.png": "92af6a47563694b3ca0f6ed5b8b01ce5",
"icons/Icon-192.png": "306fcc64d15b2a8721f30e3287811f62",
"icons/Icon-512.png": "92af6a47563694b3ca0f6ed5b8b01ce5",
"icons/Icon-maskable-192.png": "306fcc64d15b2a8721f30e3287811f62",
"manifest.json": "68facede20f3319673c817b0994e0735",
"favicon.png": "ba58ae40a911fa0df45edad5b04f9df3",
"main.dart.js_1.part.js": "328500f1dbe55e86d82b82102f3ee43d",
"flutter_bootstrap.js": "f9e5d2a5138620dbe504554ced0b822f"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
