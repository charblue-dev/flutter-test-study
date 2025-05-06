import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:unit_test_mock/album.dart';

import 'album_test.mocks.dart' as mockito;

@GenerateMocks([http.Client])
void main() {
  group('fetch Album test with mockito', () {
    test('Album이 정상적으로 반환되어야 한다.', () async {
      final client = mockito.MockClient();

      when(
        client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')),
      ).thenAnswer(
        (_) async => http.Response(
            '{"userId": 1,"id": 1,"title": "quidem molestiae enim"}', 200),
      );

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('statusCode가 404인 경우, 예외가 발생해야 한다.', () async {
      final client = mockito.MockClient();

      when(client
              .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(client), throwsException);
    });
  });

  group('fetch Album test with http', () {
    test('Album이 정상적으로 반환되어야 한다.', () async {
      final client = http_testing.MockClient((request) async {
        if (request.url.toString() ==
            'https://jsonplaceholder.typicode.com/albums/1') {
          return http.Response(
              '{"userId": 1,"id": 1,"title": "quidem molestiae enim"}', 200);
        }
        return http.Response('Bad Request', 400);
      });

      expect(await fetchAlbum(client), isA<Album>());
    });

    test('statusCode가 404인 경우, 예외가 발생해야 한다.', () async {
      final client = http_testing.MockClient((request) async {
        if (request.url.toString() ==
            'https://jsonplaceholder.typicode.com/albums/1') {
          return http.Response('Not Found', 404);
        }

        return http.Response('Bad Request', 400);
      });

      expect(fetchAlbum(client), throwsException);
    });
  });
}
