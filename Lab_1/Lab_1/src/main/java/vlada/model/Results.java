package vlada.model;

import lombok.Getter;
import vlada.Main;

import java.util.*;

public class Results {
    @Getter
    private final static List<FuncResult> results = new ArrayList<>();

    public static synchronized void printMainResult() {
        if (Main.getResultsPrinted().get()) {
            return;
        }
        int min = 0;

        if (results.size() != 0) {
            min = results.get(0).getRes();
        }
        if (results.size() != countFinished(Main.getProcesses())) {
            boolean fCheck = false;
            boolean gCheck = false;
            for (FuncResult re : results) {
                if (re.getFunc().equals("F")) {
                    fCheck = true;
                }
                if (re.getFunc().equals("G")) {
                    gCheck = true;
                }
            }
            System.out.println("There is no result of main function");
            if (!fCheck) {
                System.out.println("Function F didnt return result");
            }
            if (!gCheck) {
                System.out.println("Function G didnt return result");
            }
            Main.getResultsPrinted().set(true);
            return;
        }
        for (FuncResult funcResult : results) {
            //min+=res.get(i).getRes();
            if (funcResult.getRes() < min) {
                min = funcResult.getRes();
            }
        }
        System.out.println("Result of main function = " + min);
        Main.getResultsPrinted().set(true);
    }

    private static int countFinished(List<ProcessWrapper> processes) {
        int res = 0;
        for (ProcessWrapper process : processes) {
            res += process.isFinished() ? 1 : 0;
        }

        return res;
    }
}
