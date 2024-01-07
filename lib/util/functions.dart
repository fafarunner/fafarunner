import 'package:fafa_runner/constrants/constrants.dart';

const tileSizeSpriteSheet = 16;

double valueByTileSize(double value) {
  return value * (tileSize / tileSizeSpriteSheet);
}
