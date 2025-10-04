package Runners;

import com.intuit.karate.junit5.Karate;

import javassist.ClassPath;

public class TestRunner {
	@Karate.Test
    public Karate testAll() {
        return Karate.run("classpath:features");
    }
}	