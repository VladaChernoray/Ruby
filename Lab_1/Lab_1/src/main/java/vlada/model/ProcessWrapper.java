package vlada.model;

import lombok.Getter;
import lombok.Setter;

@Getter
public class ProcessWrapper {
    private final Process process;

    private final String function;

    private boolean finished;

    public ProcessWrapper(Process process, String function) {
        this.process = process;
        this.function = function;
        this.finished = false;
    }

    public boolean isAlive() {
        return process.isAlive();
    }

    public int getExitValue() {
        return process.exitValue();
    }

    public void finish() {
        finished = true;
    }

    public void destroy() {
        process.destroy();
    }
}
