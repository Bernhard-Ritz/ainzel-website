'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "bba91874459048dd54b5bd4bebe93128",
"assets/AssetManifest.bin.json": "324301cb94117914a4e21ad540f4cfd1",
"assets/AssetManifest.json": "dc5a21f75c173e07efd6dd9436425886",
"assets/assets/audios/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/fonts/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/AdobeStock_101351121.jpg": "9696754cb91b2b8c3a5d54f7cccdcba5",
"assets/assets/images/AdobeStock_104278045_-_light-3.jpg": "8c3e420aa14abda09fa184b5ddaf5105",
"assets/assets/images/AdobeStock_104278093.jpg": "c2ae743fdcabed2d091531a0fe2f4d6e",
"assets/assets/images/AdobeStock_132948967.jpg": "8235033269094faf69b51a6536c53b3a",
"assets/assets/images/AdobeStock_132949044.jpg": "0db671aff34acbd41c7bd9e615acb073",
"assets/assets/images/AdobeStock_132950058.jpg": "32269fcce329c521fb01949fa46c9c70",
"assets/assets/images/AdobeStock_132950425.jpg": "a09cba1d0a18af68d212a8f43566855d",
"assets/assets/images/AdobeStock_322690073.jpeg": "8c8a4f4d90c553b84482464c21059dbe",
"assets/assets/images/AdobeStock_409720953.jpg": "2f9f2e7395f0acb1fd265a859cb8e3f3",
"assets/assets/images/AdobeStock_411171725.jpg": "21535e5ba6bafcfdfc9d7823144e6983",
"assets/assets/images/Ainzel_logo_v10_blue.png": "441e1d2b70b266f9b32e94d3ef169980",
"assets/assets/images/Background2.png": "ff69538a4717bea54d1246b66acd63e4",
"assets/assets/images/Bank_Blue.png": "ba08e7c56700d3571f5deb13bae0428d",
"assets/assets/images/Collaboration2_blue.png": "91232db28dc71068b22621bb8d5be5cf",
"assets/assets/images/Collaboration2_orange.png": "9f6d753d0d9a72a6923b33b09a72e6b5",
"assets/assets/images/CompetitiveEdge2_blue.png": "574ef47eca0418a0073426d7283f6bc3",
"assets/assets/images/CompetitiveEdge2_orange.png": "c6b29c680e7a64723bf731732cd0a305",
"assets/assets/images/Compliance_blue.png": "f6a4feffdec0117af7bfb0dcdf8ffce5",
"assets/assets/images/Compliance_orange.png": "ef7eaf70927d2581a55962d0a2672ba6",
"assets/assets/images/DataTapestry_blue.png": "5a68d7ca74f3159c4033550de65811d0",
"assets/assets/images/DataTapestry_orange.png": "a36b2d641ec07ba118b7f597c7180006",
"assets/assets/images/DEflag.png": "ec19a83807915d7eff650d85c8234bac",
"assets/assets/images/Efficiency_blue.png": "afb1773aa0f1b35acad2862d877c0160",
"assets/assets/images/Efficiency_orange.png": "c73106dfa2427e9c4f212418178f7d69",
"assets/assets/images/ENflag.png": "3777b15b4db7ee49cc449ef91059b24a",
"assets/assets/images/ESflag.png": "1b18df548d93cf13689c7afed6f4cf90",
"assets/assets/images/ExpertGroup_Transparent_Details.png": "2122a666638fa7dcb2135bc74f929659",
"assets/assets/images/ExpertGroup_Transparent_Details2.png": "0ad39a95cc2f2fc2adc3fd2bfd983125",
"assets/assets/images/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/images/FRflag.png": "96d09ef9f6b3a31b7278f0935d70a00b",
"assets/assets/images/Growth_blue.png": "36c8a557e501a0ff94a398d8c96cdde4",
"assets/assets/images/Growth_orange.png": "ed48c841c1214c6bcfaa65fe352f98a3",
"assets/assets/images/Innovation_blue.png": "1e48098b1d1365d403bb2beccdf494ec",
"assets/assets/images/Innovation_orange.png": "06c9ba4ae747437ae01abd458abe7847",
"assets/assets/images/Obstacle1_blue.png": "5993b7f557939cbf3274e63b945b594e",
"assets/assets/images/Obstacle2_blue.png": "b52f314c8a684a0eca49b6242ce3b695",
"assets/assets/images/Obstacle3_blue.png": "c16cdae2fa251d2bcebb8d1c7ba76b81",
"assets/assets/images/Obstacle4_blue.png": "58a54c10cbb7f9e9022b444c37028562",
"assets/assets/images/Obstacle6_blue.png": "65c0643ad24c244053c739c24eb164d4",
"assets/assets/images/Obstacle7_blue.png": "98eeddfd999c2b4cbff7e831c597a758",
"assets/assets/images/Person1_blue.png": "1d8b469994b83fb0d7f9403b91d29afa",
"assets/assets/images/Person2_blue.png": "e00543c7cd65c14e1b336b47778f2cb4",
"assets/assets/images/Person3_blue.png": "31f21f8b2d2e581a942c5f408441175b",
"assets/assets/images/Person4_blue.png": "9ccc00ea3f183f2f68b508ac9e1030d1",
"assets/assets/images/Person5_blue.png": "031eaa410fbb8fe8dde8262a6cdcf2ec",
"assets/assets/images/Person6_blue.png": "6e22e6808afe7733b1cfd0e3140364df",
"assets/assets/images/Person7_blue.png": "25017ffbba803cd212859cc99d4927f2",
"assets/assets/images/Person8_blue.png": "05c41ca017dc3058e754210e1a7cc2ff",
"assets/assets/images/Personalized_blue.png": "b56cfa533b4f86aee6d7b06a057494eb",
"assets/assets/images/Personalized_orange.png": "a2e6a1f69a99032d3797b69ed7cdef9e",
"assets/assets/images/Pharma_blue.png": "22d4dcdda7ad785c474768802e6c7394",
"assets/assets/images/ProfessionalServices_Blue.png": "8387e3406d8ca10e9023e314fcd0d207",
"assets/assets/images/PublicSector_Blue.png": "5b0675ef3e59dd63ea5fcea7931fb625",
"assets/assets/images/ServiceExcellence_blue.png": "751f3d6c3664dcf1527bb0979daf73d4",
"assets/assets/images/ServiceExcellence_orange.png": "1c01a0a75d8ffec185c309dfd01b0ca1",
"assets/assets/lottie_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/pdfs/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/rive_animations/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/assets/videos/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "9b7955b377544da52909e60404950445",
"assets/NOTICES": "4847a90d89778901e7dc6443d3942f8a",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "e550ead5838245c364af5e4917219e3f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "fffec275934b3ebeaddb26724ca93c2b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "2e4d399992bbce7fa78dba1cdfdbddc4",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "2704101cb06ce66e2000356a312be25c",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"index.html": "bd552f42c303081db923c686cce4c1b7",
"/": "bd552f42c303081db923c686cce4c1b7",
"main.dart.js": "1f65ff750ff1e1ee8b096851790a5b90",
"version.json": "26357d5b7036e366bcda0844e7f9eccf"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
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
