
import 'package:flutter_test/flutter_test.dart';
import 'package:linkyou_task/data/models/requests/login_request/login_request.dart';
import 'package:linkyou_task/data/models/responses/login_response/Login_respones.dart';
import 'package:linkyou_task/data/network/result.dart';
import 'package:linkyou_task/domain/repository/repository.dart';
import 'package:linkyou_task/domain/use_cases/login_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_use_case_test.mocks.dart';

@GenerateMocks([Repository])
void main() {
  late LoginUseCase loginUseCase;
  late MockRepository mockRepository;


  setUp(() {
    mockRepository = MockRepository();
    loginUseCase = LoginUseCase(mockRepository);
    provideDummy<Result<LoginResponse?>>(
      Success(LoginResponse()),
    );
    provideDummy<Result<LoginResponse?>>(
      Fail(Exception("Invalid credentials")),
    );
    final loginRequest = LoginRequest(username: "test@example.com", password: "password123");

  });

  group('LoginUseCase Tests', () {
    test('login calls login on LoginRepo', () async {
      final successResult = Success<LoginResponse>(
        LoginResponse(),
      );

      when(mockRepository.login(LoginRequest(username: 'username', password: '1234')))
          .thenAnswer((_) async => successResult);

      final result =
      await loginUseCase.login(LoginRequest(username: 'username', password: '1234'));

      expect(result, successResult);
      verify(mockRepository.login(LoginRequest(username: 'username', password: '1234'))).called(1);
    });

    test('login returns Fail when LoginRepo fails', () async {
      final exception = Exception("Invalid credentials");
      final failResult = Fail<LoginResponse>(exception);

      when(mockRepository.login(LoginRequest(username: 'username', password: '1234Wrong')))
          .thenAnswer((_) async => failResult);

      final result =
      await loginUseCase.login(LoginRequest(username: 'username', password: '1234Wrong'));

      expect(result, failResult);
      verify(mockRepository.login(LoginRequest(username: 'username', password: '1234')))
          .called(1);
    });
  });
}