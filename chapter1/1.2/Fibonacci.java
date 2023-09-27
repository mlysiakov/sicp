public class Fibonacci {
    
    public static void main(String[] args) {
        System.out.println(recursiveFibonacci(10));
        System.out.println(tailRecursiveFibonacci(10));
        System.out.println(iterativeFibonacci(10));
    }

    static int recursiveFibonacci(int n) {
        if (n < 2) {
            return n;
        }
        return recursiveFibonacci(n - 1) + recursiveFibonacci(n - 2);
    }

    static int tailRecursiveFibonacci(int n) {
        return tailRecursiveFibonacci(1, 0, n);
    }

    private static int tailRecursiveFibonacci(int a, int b, int counter) {
        if (counter == 0) {
            return b;
        }
        return tailRecursiveFibonacci(a + b, a, --counter);
    }

    static int iterativeFibonacci(int n) {
        int a = 1;
        int b = 0;
        for (; n > 0; n--) {
            int tmp = a;
            a = a + b;
            b = tmp;
        }
        return b;
    }
}
