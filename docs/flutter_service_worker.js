'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "97f5471c5b14202f4b85c7e1462e4a58",
"assets/AssetManifest.bin.json": "3908cd7baaf140efb4e15aa97a476d4d",
"assets/AssetManifest.json": "07799fed7a67766a63fb8f0c07e1d274",
"assets/assets/fonts/inter/Inter_18pt-Black.ttf": "b797a429ef21b9b7d44b96038cdb10f2",
"assets/assets/fonts/inter/Inter_18pt-BlackItalic.ttf": "6a6d7edd78447c5edcb33570ce97efe8",
"assets/assets/fonts/inter/Inter_18pt-Bold.ttf": "7ef6f6d68c7fedc103180f2254985e8c",
"assets/assets/fonts/inter/Inter_18pt-BoldItalic.ttf": "66469edaf106f7a1e14f4061212a1123",
"assets/assets/fonts/inter/Inter_18pt-ExtraBold.ttf": "a6ed481bff60bc9270904d214947ab13",
"assets/assets/fonts/inter/Inter_18pt-ExtraBoldItalic.ttf": "b03bfa9ceab3df1f81834d0523331c30",
"assets/assets/fonts/inter/Inter_18pt-ExtraLight.ttf": "2c6c78d98816958b53fea58451f921d3",
"assets/assets/fonts/inter/Inter_18pt-ExtraLightItalic.ttf": "24df6449633144fa3f4258c775dd67c5",
"assets/assets/fonts/inter/Inter_18pt-Italic.ttf": "ab4004692577ac82604c777fa83da556",
"assets/assets/fonts/inter/Inter_18pt-Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/assets/fonts/inter/Inter_18pt-LightItalic.ttf": "6eb3a2d2c6f095080ac034867886d0bf",
"assets/assets/fonts/inter/Inter_18pt-Medium.ttf": "8540f35bf8acd509b9ce356f1111e983",
"assets/assets/fonts/inter/Inter_18pt-MediumItalic.ttf": "c64a8c393f4d6ffd87f80723727b7f2c",
"assets/assets/fonts/inter/Inter_18pt-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/fonts/inter/Inter_18pt-SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/fonts/inter/Inter_18pt-SemiBoldItalic.ttf": "0f93bef7d8e8ea0612ba37a71efcccff",
"assets/assets/fonts/inter/Inter_18pt-Thin.ttf": "6f2d2f41f504aee66da88684f15d7e1d",
"assets/assets/fonts/inter/Inter_18pt-ThinItalic.ttf": "95d83862ccec5b0d0487f243e34fcc61",
"assets/assets/fonts/inter/Inter_24pt-Black.ttf": "2392341284c30f5fffb9fe0ab0cd983e",
"assets/assets/fonts/inter/Inter_24pt-BlackItalic.ttf": "1fa0b44e2ca8a6ce911e0fc8cc3b7255",
"assets/assets/fonts/inter/Inter_24pt-Bold.ttf": "8b04b3bd9435341377d7f4b4d68b6ecc",
"assets/assets/fonts/inter/Inter_24pt-BoldItalic.ttf": "a1757dcadd00b07cd874af79e2904c92",
"assets/assets/fonts/inter/Inter_24pt-ExtraBold.ttf": "995fb5ac38b90303c0cc1a0b21e2c9fe",
"assets/assets/fonts/inter/Inter_24pt-ExtraBoldItalic.ttf": "054fe10e7073eb84bf31447dfd79e522",
"assets/assets/fonts/inter/Inter_24pt-ExtraLight.ttf": "8da347e947a38e1262841f21fe7c893e",
"assets/assets/fonts/inter/Inter_24pt-ExtraLightItalic.ttf": "c37c2ef7e42dc86b284a5cbaf8a8efae",
"assets/assets/fonts/inter/Inter_24pt-Italic.ttf": "0b52c6d11ac407c2ef591475f2b4ed11",
"assets/assets/fonts/inter/Inter_24pt-Light.ttf": "65ec965bd90e1a297cdb3be407420abc",
"assets/assets/fonts/inter/Inter_24pt-LightItalic.ttf": "a401ba0ab41163ff9ec6247c023b1c68",
"assets/assets/fonts/inter/Inter_24pt-Medium.ttf": "4591e900425d177e6ba268d165bf12e8",
"assets/assets/fonts/inter/Inter_24pt-MediumItalic.ttf": "5ed286000cb7a0e7b015ec71e190a767",
"assets/assets/fonts/inter/Inter_24pt-Regular.ttf": "e48c1217adab2a0e44f8df400d33c325",
"assets/assets/fonts/inter/Inter_24pt-SemiBold.ttf": "c77560a8441d664af3e65dd57026dff9",
"assets/assets/fonts/inter/Inter_24pt-SemiBoldItalic.ttf": "9685a9dcf0c26640b3828dd34b953bcd",
"assets/assets/fonts/inter/Inter_24pt-Thin.ttf": "1e9e30c74648950a240427636b6c1992",
"assets/assets/fonts/inter/Inter_24pt-ThinItalic.ttf": "27a3a82e0df426a69c7a7562a2293bda",
"assets/assets/fonts/inter/Inter_28pt-Black.ttf": "298c6ce1b2641dfe1647544180b67fd1",
"assets/assets/fonts/inter/Inter_28pt-BlackItalic.ttf": "ff93e5c0c4542fe58a56430a3be67cce",
"assets/assets/fonts/inter/Inter_28pt-Bold.ttf": "14080569c713459a85b1693cf7354cc0",
"assets/assets/fonts/inter/Inter_28pt-BoldItalic.ttf": "a2d4f13d253a5d230ab950b8d1aa6a3b",
"assets/assets/fonts/inter/Inter_28pt-ExtraBold.ttf": "7c8dddeead3a39ebb25d4be0e0c4b876",
"assets/assets/fonts/inter/Inter_28pt-ExtraBoldItalic.ttf": "0a060bf48937936c4aa7d9952dfe1ae8",
"assets/assets/fonts/inter/Inter_28pt-ExtraLight.ttf": "97f88391f7a4de7986e436bdeeb86d8c",
"assets/assets/fonts/inter/Inter_28pt-ExtraLightItalic.ttf": "44168090bcf11276f500c0f02b154ff4",
"assets/assets/fonts/inter/Inter_28pt-Italic.ttf": "457934416e3b66a693b814d64446076e",
"assets/assets/fonts/inter/Inter_28pt-Light.ttf": "3ea4007efbbb2f30c2c73275eef5c2b0",
"assets/assets/fonts/inter/Inter_28pt-LightItalic.ttf": "53fd3364ffe65ab2ff79f7fe024c83ce",
"assets/assets/fonts/inter/Inter_28pt-Medium.ttf": "4bf75147230e93108702b004fdee55df",
"assets/assets/fonts/inter/Inter_28pt-MediumItalic.ttf": "ecec8d44b9cfb67aafab4573295b3c29",
"assets/assets/fonts/inter/Inter_28pt-Regular.ttf": "fc20e0880f7747bb39b85f2a0722b371",
"assets/assets/fonts/inter/Inter_28pt-SemiBold.ttf": "70c03908b3ab82969b38ba14745f3a54",
"assets/assets/fonts/inter/Inter_28pt-SemiBoldItalic.ttf": "f6a4fc371cbdc516f1b3aa53e570e25e",
"assets/assets/fonts/inter/Inter_28pt-Thin.ttf": "f045084a42b5d5a11297b0c058ecf884",
"assets/assets/fonts/inter/Inter_28pt-ThinItalic.ttf": "3a4d750a496f2c6e20eef12f2f28443c",
"assets/assets/icons/android.svg": "55a818257f107f0219b465f5bf994dcd",
"assets/assets/icons/android_studio.svg": "beccf3d5c80dab2d8719250fb6566d21",
"assets/assets/icons/api.svg": "29c52c3a26f17d43a0c00846ade7195c",
"assets/assets/icons/background.png": "c8f672da804feaf5f5c6346f8567b244",
"assets/assets/icons/bloc.svg": "3ff9e17e7e82263002c5c1df9f2fb6a3",
"assets/assets/icons/canva.svg": "f26a1bbae68c7359bf743045a2dbf43f",
"assets/assets/icons/dark_mood.svg": "42255d98a42c2305be64fe4580d9c680",
"assets/assets/icons/dart.svg": "77736b70355db3b992d712891749acd5",
"assets/assets/icons/drawio.svg": "4aed57189ac4df6ff2985eb682af483f",
"assets/assets/icons/email.png": "0ab3669818d467ffb6558802f9541eb5",
"assets/assets/icons/facebook.png": "fba8cf30702eff336ee05339deaa34bc",
"assets/assets/icons/figma.svg": "cd76b1d8ad37d6f691921a8831d59dc0",
"assets/assets/icons/firebase.svg": "029fd3c092480d94d80837b5fc4d2744",
"assets/assets/icons/flutter.svg": "9a6e81be6ff5b09956f4f85fe1f0a89f",
"assets/assets/icons/getx.svg": "f1a51baddcb354a105e2825a17999ba0",
"assets/assets/icons/git.svg": "5823989cf97fd166c65a7df7522a2768",
"assets/assets/icons/github.png": "2dedee9b3eb9dc4a2e2c4e47cfbe85cd",
"assets/assets/icons/github.svg": "391ee4edc86af441cd145f89a40651c2",
"assets/assets/icons/gitlab.png": "36c2afc995692fb41c8ca54c1b2a15b0",
"assets/assets/icons/gitlab.svg": "c2c228ff14df49ae562d6dc4d52a13cf",
"assets/assets/icons/google_play_console.svg": "06f4299a87770c5e9d40ea01bbee6cab",
"assets/assets/icons/java.svg": "38dc9c536e7e5dfcf54cfa44eda536bb",
"assets/assets/icons/linkedin.png": "c72f600dedcb9ff87c1db18481dd3b39",
"assets/assets/icons/location.svg": "0cfa20a89b67c66414f741b6c38ddd1d",
"assets/assets/icons/onesignal.svg": "a9fa373d43e692f6d453cb042e3fcc79",
"assets/assets/icons/postman.svg": "fbfb57a181ce251926d686d12e6cee5a",
"assets/assets/icons/sentry.svg": "245506c309e35b321abf72e27904ec6b",
"assets/assets/icons/sqlite.svg": "1b093aca4c524e3646b10cb3d53bbd2f",
"assets/assets/icons/vs_code.svg": "bf246f1a348a946a439ef4c8e4ef8466",
"assets/assets/icons/whatsapp.png": "31e57b86c0e63908de73e049ea41a6d5",
"assets/assets/icons/youtube.png": "fabf77927a3864fdf13f0fb11dfdb638",
"assets/assets/images/assmak_ui.png": "d815418c0f6bc6eab9f86c6ef74a7683",
"assets/assets/images/auc.jpg": "596355c44836b0890c2bb4e70958d690",
"assets/assets/images/bill_hub.png": "070df4c71b3c7b4a6f3f347d92c7c681",
"assets/assets/images/formado_ui.png": "e3520dcffa4da7c594944404b3e5bf5b",
"assets/assets/images/hiparking_ui.png": "ce283c5177e0fb28199c6e38044fcc01",
"assets/assets/images/logo.png": "1270ef584b669faa44433eea8b190883",
"assets/assets/images/madar_ui.png": "ceda1dc4a461d20ebe0618357de4b678",
"assets/assets/images/mind_space.png": "9ca32c1838aa890587c410c05323ebeb",
"assets/assets/images/mobeen_ui.png": "2254906cbd2ab0b68cf39c4d7036da3f",
"assets/assets/images/mubin.jpg": "b002ab5ff5071c1d42d946dc54d5e242",
"assets/assets/images/prefection.jpg": "968d10fe15c4b98aa10de955c6abe240",
"assets/assets/images/smart_sugar_ui.png": "8f93878b1988336b39a623a6c84fd5ee",
"assets/assets/images/teacher_tech.png": "5858b1e16780b2e8f7974520fe35ad47",
"assets/assets/translations/ar-EG.json": "83e080e504ed43acb7861c3d0a535e57",
"assets/assets/translations/en-US.json": "d4b7066c8ca57a71f7ee332893b62d9b",
"assets/FontManifest.json": "8a3fd1321d700af1b2e12dc293760a31",
"assets/fonts/MaterialIcons-Regular.otf": "eee1839f75000d30024ed32207f22d2c",
"assets/NOTICES": "355f5ca5c0f51f2df45afcf655d47715",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "7aec5c5c9d8c501a36f9ffb852072945",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "93f89e48b67ad2ede02489bbfd36261e",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "7db3cfc0abb9fc2ed12291774df6a3e2",
"/": "7db3cfc0abb9fc2ed12291774df6a3e2",
"main.dart.js": "bb399a3987d42a69c4d9b1008b8d0b10",
"manifest.json": "5da5618090cce58334379cca5d11fefd",
"splash/img/dark-1x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/dark-2x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/dark-3x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/dark-4x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/light-1x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/light-2x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/light-3x.png": "1270ef584b669faa44433eea8b190883",
"splash/img/light-4x.png": "1270ef584b669faa44433eea8b190883",
"version.json": "820fc5193428783b75f92e9d0a338f60"};
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
