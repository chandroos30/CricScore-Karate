package Runners;

import org.junit.jupiter.api.Test;

import com.intuit.karate.Runner;

class TestRunner {

    @Test
    void runAllRegressionTests() {
        System.out.println("Running features in parallel. Reports will be generated in target/karate-reports");

        Runner.path(
            "classpath:features/withLogin/Login.feature",
            "classpath:features/withoutLogin/SkipLogin.feature"
        )
        .tags("Reg")
        .parallel(5);                            

        System.out.println("Execution finished. Check target/karate-reports/karate-summary.html");
    }
}