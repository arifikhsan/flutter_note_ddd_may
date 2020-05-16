import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_note_ddd_may/domain/core/errors.dart';
import 'package:flutter_note_ddd_may/domain/core/value_failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  bool isValid() => value.isRight();

  T getOrCrash() {
    return value.fold(
      (left) => throw UnexpectedValueError(left),
      (right) => right,
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
