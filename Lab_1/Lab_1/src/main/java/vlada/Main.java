package vlada;

import lombok.Getter;
import lombok.Setter;
import vlada.model.FuncResult;
import vlada.model.ProcessWrapper;
import vlada.model.Results;
import vlada.service.KeyHandler;
import vlada.service.PauseHandler;

import java.io.*;
import java.util.*;
import java.util.concurrent.atomic.AtomicBoolean;

public class Main {
    @Getter
    private static final AtomicBoolean resultsPrinted = new AtomicBoolean(false);

    @Getter
    private static final List<ProcessWrapper> processes = new ArrayList<>();

    @Getter
    private static final KeyHandler keyHandler = new KeyHandler();

    private static final String JAR_PATH = getJarPath();

    public static void main(String[] args) {
        keyHandler.start();

        while (true) {
            reset();

            Scanner scanner = new Scanner(System.in);

            System.out.println("Write argument: ");
            String arg = scanner.nextLine();

            System.out.println("Write functions(e.g., <F G F F F>): ");
            List<String> functions = Arrays.asList(scanner.nextLine().split("\\s+"));

            for (String function : functions) {
                try {
                    Process process = new ProcessBuilder("java", "-jar", JAR_PATH, arg, function).start();
                    processes.add(new ProcessWrapper(process, function));
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            while (true) {
                for (ProcessWrapper process : processes) {
                    if (!process.isAlive() && !process.isFinished()) {
                        process.finish();

                        Results.getResults().add(new FuncResult(process.getFunction(), process.getExitValue()));
                        if (process.getExitValue() == 0) {
                            System.out.println("Result of main function = 0");
                            resultsPrinted.set(true);
                            break;
                        }
                    }
                }
                if (Results.getResults().size() == functions.size()) {
                    Results.printMainResult();
                    break;
                }
                if (resultsPrinted.get()) {
                    break;
                }
            }
            PauseHandler.stop();
            if (PauseHandler.getThread() != null) {
                try {
                    PauseHandler.getThread().join();
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    private static void reset() {
        resultsPrinted.set(false);
        PauseHandler.setThread(null);
        processes.clear();
        Results.getResults().clear();
    }

    private static String getJarPath() {
        String thisProjectDir = System.getProperty("user.dir");
        thisProjectDir = thisProjectDir.substring(0, thisProjectDir.length() - 5);
        return thisProjectDir + "Lab_1\\Func\\target\\Func-1.0-SNAPSHOT.jar";
    }
}