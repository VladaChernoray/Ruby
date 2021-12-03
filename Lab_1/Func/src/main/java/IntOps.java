public class IntOps {
    public static int funcF(int num) throws InterruptedException {
        validateInput(num);

        return (int) Math.log(num) * 7;
    }

    public static int funcG(int num) throws InterruptedException {
        validateInput(num);

        return (int) (Math.abs(num) * Math.tan(num));
    }

    private static void validateInput(int num) throws InterruptedException {
        if (num < 0) {
            throw new InterruptedException();
        }
    }
}
