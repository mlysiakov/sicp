public class Exponentiation {

  public static void main(String[] args) {
    assertEquals(2, inCycleCalculator(2, 1));
    assertEquals(128, inCycleCalculator(2, 7));
    assertEquals(256, inCycleCalculator(2, 8));

    assertEquals(2, recursiveCalculator(2, 1));
    assertEquals(128, recursiveCalculator(2, 7));
    assertEquals(256, recursiveCalculator(2, 8));

    assertEquals(2, fastRecursiveCalculator(2, 1));
    assertEquals(128, fastRecursiveCalculator(2, 7));
    assertEquals(256, fastRecursiveCalculator(2, 8));

    assertEquals(2, fastIterativeCalculator(2, 1));
    assertEquals(128, fastIterativeCalculator(2, 7));
    assertEquals(256, fastIterativeCalculator(2, 8));
  }

  private static int inCycleCalculator(int base, int exponent) {
      int result = base;
      for (int i = 1; i < exponent; i++) {
        result *= base;
      }
      return result;
  }

  private static int recursiveCalculator(int base, int exponent) {
    return exponent  == 0 ? 1 : base * recursiveCalculator(base, --exponent);
  }

  private static int fastRecursiveCalculator(int base, int exponent) {
    if (exponent == 0) {
      return 1;
    }
    return isEven(exponent) ?
        (int) Math.pow(fastRecursiveCalculator(base, exponent / 2), 2)
        : base * fastRecursiveCalculator(base, --exponent);
  }

  private static int fastIterativeCalculator(int base, int exponent) {
    int result = 1;
    while (exponent > 0) {
      if (isEven(exponent)) {
        base *= base;
        exponent /= 2;
      } else {
        result *= base;
        exponent -= 1;
      }
    }
    return result;
  }

  private static void assertEquals(int expected, int actual) {
    if (expected != actual) {
      throw new AssertionError("Actual is " + actual + " but was expected to be " + expected);
    }
  }

  private static boolean isEven(int number) {
    return number % 2 == 0;
  }
}