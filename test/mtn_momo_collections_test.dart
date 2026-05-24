import 'package:dio/dio.dart';
import 'package:mtn_momo_collections/mtn_momo_collections.dart';
import 'package:test/test.dart';

void main() {
  group('MtnMomoClient', () {
    late Dio dio;

    setUp(() {
      dio = Dio();
    });

    test('can be instantiated', () {
      expect(MtnMomoClient(dio), isA<MtnMomoClient>());
    });

    test('provides access to sub-clients', () {
      final client = MtnMomoClient(dio);
      expect(client.collectionClient, isNotNull);
      expect(client.sandboxProvisioningClient, isNotNull);
    });
  });
}
