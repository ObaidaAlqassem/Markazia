abstract class Either<L, R> {
  const Either();

  bool isLeft();

  bool isRight();

  L getLeft() {
    return ((this as Left)._l) as L;
  }

  R getRight() {
    return ((this as Right)._r) as R;
  }

  Left<L, r> left<r>() {
    return Left(getLeft());
  }

  Right<l, R> right<l>() {
    return Right(getRight());
  }

  Either<L, NR> toNewRight<NR>({
    required NR Function(R r) converter,
  }) {
    if (isRight()) {
      return Right(converter(getRight()));
    } else {
      return left();
    }
  }

  Either<NL, R> toNewLeft<NL>({
    required NL Function(L l) converter,
  }) {
    if (isRight()) {
      return Right(getRight());
    } else {
      return Left(converter(getLeft()));
    }
  }
}

class Left<L, R> extends Either<L, R> {
  const Left(this._l);

  final L _l;

  @override
  bool isLeft() {
    return true;
  }

  @override
  bool isRight() {
    return false;
  }
}

class Right<L, R> extends Either<L, R> {
  const Right(this._r);

  final R _r;

  @override
  bool isLeft() {
    return false;
  }

  @override
  bool isRight() {
    return true;
  }
}
