
import 'package:flutter_test/flutter_test.dart';
import 'package:linkyou_task/data/network/result.dart';
import 'package:linkyou_task/domain/models/user_model.dart';
import 'package:linkyou_task/domain/repository/repository.dart';
import 'package:linkyou_task/domain/use_cases/set_cached_user_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'check_cached_user_use_case_test.mocks.dart';


@GenerateMocks([Repository])
void main() {
  late SetCachedUserUseCase setCachedUserUseCase;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    setCachedUserUseCase = SetCachedUserUseCase(mockRepository);
    provideDummy<Result<bool>>(
      Success(true),
    );
    provideDummy<Result<bool>>(
      Fail(Exception("Failed to set cached user")),
    );
  });

  group('SetCachedUserUseCase Tests', () {
    test('setUser calls setCachedUser on LoginRepo', () async {
      final successResult = Success<bool>(true);
      final user = User(
          email: '',
          firstName: '',
          gender: '',
          id: -1,
          lastName: '',
         );
      const token = "";

      when(mockRepository.setCachedUser(user, token))
          .thenAnswer((_) async => successResult);

      final result = await setCachedUserUseCase.setUser(user, token);

      expect(result, successResult);
      verify(mockRepository.setCachedUser(user, token)).called(1);
    });

    test('setUser returns Fail when LoginRepo fails', () async {
      final exception = Exception("Failed to set cached user");
      final failResult = Fail<bool>(exception);
      final user = User(
          email: '',
          firstName: '',
          gender: '',
          id: -2,
          lastName: '',
         );
      const token = "";

      when(mockRepository.setCachedUser(user, token))
          .thenAnswer((_) async => failResult);

      final result = await setCachedUserUseCase.setUser(user, token);

      expect(result, failResult);
      verify(mockRepository.setCachedUser(user, token)).called(1);
    });
  });
}