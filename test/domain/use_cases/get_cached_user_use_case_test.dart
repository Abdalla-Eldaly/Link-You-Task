
import 'package:flutter_test/flutter_test.dart';
import 'package:linkyou_task/data/network/result.dart';
import 'package:linkyou_task/domain/models/user_model.dart';
import 'package:linkyou_task/domain/repository/repository.dart';
import 'package:linkyou_task/domain/use_cases/get_cached_user_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_cached_user_use_case_test.mocks.dart';



@GenerateMocks([Repository])
void main() {
  late GetCachedUserUseCase getCachedUserUseCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getCachedUserUseCase = GetCachedUserUseCase(mockRepository);
    provideDummy<Result<User>>(
      Success(User()),
    );
    provideDummy<Result<User?>>(
      Fail(Exception("No cached user available")),
    );
  });

  group('GetCachedUserUseCase Tests', () {
    test('getUser calls getCachedUser on LoginRepo', () async {
      final successResult = Success<User>(
        User(),
      );

      when(mockRepository.getCachedUser())
          .thenAnswer((_) async => successResult);

      final result = await getCachedUserUseCase.getUser();

      expect(result, successResult);
      verify(mockRepository.getCachedUser()).called(1);
    });

    test('getUser returns Fail when LoginRepo fails', () async {
      final exception = Exception("No cached user available");
      final failResult = Fail<User>(exception);

      when(mockRepository.getCachedUser()).thenAnswer((_) async => failResult);

      final result = await getCachedUserUseCase.getUser();

      expect(result, failResult);
      verify(mockRepository.getCachedUser()).called(1);
    });
  });
}