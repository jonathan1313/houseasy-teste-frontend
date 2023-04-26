import '../../repositories/sign_out_repository.dart';
import 'sign_out_usecase.dart';

class SignOutUsecaseImpl implements SignOutUsecase {
  
  final SignOutRepository _signOutRepository;

  SignOutUsecaseImpl(this._signOutRepository);
  
  @override
  Future<void> signOut() {
    return _signOutRepository.signOut();
  }
  
}