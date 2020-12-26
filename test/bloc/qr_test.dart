import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:superformula_challenge/blocs/blocs.dart';

import '../mock_repositories.dart';

void main() async {
  blocTest(
    'QR bloc emits Seed upon successful API call',
    build: () => QrBloc(qrRepository: MockQrRepository()),
    act: (QrBloc qrBloc) async {
      await qrBloc.getSeed();
    },
    expect: [
      isA<SeedLoading>(),
      isA<SeedLoaded>(),
    ],
  );

  blocTest(
    'QR bloc emits \'not loaded\' state upon unsuccessful API call',
    build: () => QrBloc(qrRepository: MockQrRepository(error: true)),
    act: (QrBloc qrBloc) async {
      await qrBloc.getSeed();
    },
    expect: [
      isA<SeedLoading>(),
      isA<SeedNotLoaded>(),
    ],
  );
}