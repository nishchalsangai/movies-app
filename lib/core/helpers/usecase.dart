import 'package:dartz/dartz.dart';
import 'package:movies_app/core/helpers/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Type,Failure>> call(Params params);
}