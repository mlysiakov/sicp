public class Factorial {

    public static void main(String[] args) {
        System.out.println(recursiveFactorial(6));
        System.out.println(tailRecursiveFactorial(6));
        System.out.println(iterativeFactorial(6));
    }

    static int recursiveFactorial(int n) {
        if (n == 1) {
            return 1;
        }
        return n * (recursiveFactorial(--n));
    }

    static int tailRecursiveFactorial(int n) {
        return tailRecursiveFactorial(1, 1, n);
    }

    private static int tailRecursiveFactorial(int total, int counter, int maxCount) {
        if (counter > maxCount) {
            return total;
        }
        return tailRecursiveFactorial(total * counter, ++counter, maxCount);
    }

    static int iterativeFactorial(int n) {
        int result = 1;
        for (int i = 1; i <= n; i++) {
            result *= i;
        }
        return result;
    }
}