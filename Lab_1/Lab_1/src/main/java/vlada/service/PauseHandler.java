package vlada.service;

import vlada.Main;
import vlada.model.ProcessWrapper;
import vlada.model.Results;
import lombok.Getter;
import lombok.Setter;

import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class PauseHandler {
    private static final int WAIT_TIME = 15000;

    @Getter
    private static final AtomicBoolean continueProcess = new AtomicBoolean(false);

    @Getter
    private static final AtomicBoolean endPrompt = new AtomicBoolean(false);

    @Setter
    @Getter
    private static Thread thread;

    public static void stop() {
        List<ProcessWrapper> processes = Main.getProcesses();
        for (ProcessWrapper process : processes) {
            process.finish();
            process.destroy();
        }
    }

    public static void startPrompt() {
        endPrompt.set(false);
        continueProcess.set(false);
        Main.getKeyHandler().prompt();
        thread = new Thread(() -> {
            long start = System.currentTimeMillis();
            long currentTime = System.currentTimeMillis();
            while (currentTime - start <= WAIT_TIME && !Main.getResultsPrinted().get() && !endPrompt.get()) {

                currentTime = System.currentTimeMillis();
            }
            Main.getKeyHandler().reset();
            if (continueProcess.get()) {
                return;
            }
            Results.printMainResult();
            stop();
        });
        thread.start();
    }
}
