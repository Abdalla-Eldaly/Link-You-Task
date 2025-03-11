
import 'package:flutter_test/flutter_test.dart';
import 'package:linkyou_task/data/network/result.dart';
import 'package:linkyou_task/domain/repository/repository.dart';
import 'package:linkyou_task/domain/use_cases/check_cached_user_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_cached_user_use_case_test.mocks.dart';


@GenerateMocks([Repository])
void main() {
  late CheckCachedUserUseCase checkCachedUserUseCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    checkCachedUserUseCase = CheckCachedUserUseCase(mockRepository);
    provideDummy<Result<String?>>(Success("cached_user_id"));
    provideDummy<Result<String?>>(Fail(Exception("No cached user found")));
  });

  group('CheckCachedUserUseCase Tests', () {
    test('checkUser calls checkCachedUser on LoginRepo', () async {
      final successResult = Success<String?>("cached_user_id");

      when(mockRepository.checkCachedUser())
          .thenAnswer((_) async => successResult);

      final result = await checkCachedUserUseCase.checkUser();

      expect(result, successResult);
      verify(mockRepository.checkCachedUser()).called(1);
    });

    test('checkUser returns Fail when LoginRepo fails', () async {
      final exception = Exception("No cached user found");
      final failResult = Fail<String?>(exception);

      when(mockRepository.checkCachedUser()).thenAnswer((_) async => failResult);

      final result = await checkCachedUserUseCase.checkUser();

      expect(result, failResult);
      verify(mockRepository.checkCachedUser()).called(1);
    });
  });
}