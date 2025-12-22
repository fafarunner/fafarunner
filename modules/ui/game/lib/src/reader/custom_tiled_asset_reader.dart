import 'package:bonfire/map/util/world_map_reader.dart';
import 'package:tiledjsonreader/map/tiled_map.dart';
import 'package:tiledjsonreader/tiledjsonreader.dart';

class CustomTiledAssetReader extends WorldMapReader<TiledMap> {
  CustomTiledAssetReader({required this.asset}) {
    final assetKey = asset;
    basePath = assetKey.replaceAll(assetKey.split('/').last, '');
    _reader = TiledJsonReader(assetKey);
  }

  final String asset;
  late TiledJsonReader _reader;

  @override
  late String basePath;

  @override
  Future<TiledMap> readMap() async {
    return _reader.read();
  }
}
