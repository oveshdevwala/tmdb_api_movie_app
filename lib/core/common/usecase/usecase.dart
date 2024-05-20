import 'package:fpdart/fpdart.dart';
import 'package:tmbd_movie_app/core/common/failure/failure.dart';

abstract interface class UseCase<SuccesType, Param> {
  Future<Either<Failure, SuccesType>> call(Param param);
}
class NoParam{}