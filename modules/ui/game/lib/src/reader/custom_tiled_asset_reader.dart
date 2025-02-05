import 'package:bonfire/map/util/world_map_reader.dart';
import 'package:tiledjsonreader/map/tiled_map.dart';
import 'package:tiledjsonreader/tiledjsonreader.dart';

class CustomTiledAssetReader extends WorldMapReader<TiledMap> {
// ignore: constant_identifier_names
  static const _ASSET_KEY_PREFIX = '';
  final String asset;
  late TiledJsonReader _reader;
  @override
  late String basePath;

  CustomTiledAssetReader({
    required this.asset,
  }) {
    final assetKey = asset;
    basePath = assetKey.replaceAll(assetKey.split('/').last, '');
    _reader = TiledJsonReader('$assetKey');
  }

  @override
  Future<TiledMap> readMap() async {
    return _reader.read();
  }
}
