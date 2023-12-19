import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class Failure {
  /// ignore: avoid_unused_constructor_parameters
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final String? error;
  final String? code;
  final String? message;
  final Exception exception;
  const ServerFailure({
    this.error,
    this.code,
    this.message,
   required this.exception,
  });

  @override
  bool operator ==(covariant ServerFailure other) {
    if (identical(this, other)) return true;

    return other.error == error &&
        other.code == code &&
        other.message == message;
  }

  @override
  int get hashCode => error.hashCode ^ code.hashCode ^ message.hashCode;

 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'code': code,
      'message': message,
      'exception': exception,
    };
  }



  String toJson() => json.encode(toMap());


  @override
  String toString() =>
      'ServerFailure(error: $error, code: $code, message: $message)';
}

class NoDataFailure extends Failure {
  final String? error;
  NoDataFailure({
    this.error,
  });
  @override
  bool operator ==(Object other) => other is NoDataFailure;

  @override
  int get hashCode => 0;
}

class CacheFailure extends Failure {
  @override
  bool operator ==(Object other) => other is CacheFailure;

  @override
  int get hashCode => 0;
}
