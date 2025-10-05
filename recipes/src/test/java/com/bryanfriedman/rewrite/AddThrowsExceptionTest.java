package com.bryanfriedman.rewrite;

import org.junit.jupiter.api.Test;
import org.openrewrite.DocumentExample;
import org.openrewrite.test.RewriteTest;

import static org.openrewrite.java.Assertions.java;

class AddThrowsExceptionTest implements RewriteTest {

    @DocumentExample
    @Test
    void addsThrowsExceptionToExecute() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("MyClass execute()", "java.lang.Exception")),
            //language=java
            java(
                """
                public class MyClass {
                    public String execute() {
                        return "";
                    }
                }
                """,
                """
                public class MyClass {
                    public String execute() throws Exception {
                        return "";
                    }
                }
                """
            )
        );
    }

    @Test
    void appendsExceptionWhenOtherCheckedThrown() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("MyClass execute()", "java.lang.Exception")),
            //language=java
            java(
                """
                import java.sql.SQLException;

                public class MyClass {
                    public String execute() throws SQLException {
                        return "";
                    }
                }
                """,
                """
                import java.sql.SQLException;

                public class MyClass {
                    public String execute() throws SQLException, Exception {
                        return "";
                    }
                }
                """
            )
        );
    }

    @Test
    void doesNotTouchNonMatchingMethods() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("C execute()", "java.lang.Exception")),
            //language=java
            java(
                """
                public class C {
                    public int helper() {
                        return 1;
                    }
                }
                """
            )
        );
    }

    @Test
    void doesNotDuplicateException() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("MyClass execute()", "java.lang.Exception")),
            //language=java
            java(
                """
                public class MyClass {
                    public String execute() throws Exception {
                        return "";
                    }
                }
                """
            )
        );
    }

    @Test
    void matchesByMethodNamePattern() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("MyClass execute*(..)", "java.lang.Exception")),
            //language=java
            java(
                """
                public class MyClass {
                    public String executeQuery() {
                        return "";
                    }

                    public void executeUpdate(String sql) {
                    }

                    public String getData() {
                        return "";
                    }
                }
                """,
                """
                public class MyClass {
                    public String executeQuery() throws Exception {
                        return "";
                    }

                    public void executeUpdate(String sql) throws Exception {
                    }

                    public String getData() {
                        return "";
                    }
                }
                """
            )
        );
    }

    @Test
    void addsImportForNonJavaLangException() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("MyClass process()", "java.io.IOException")),
            //language=java
            java(
                """
                public class MyClass {
                    public void process() {
                    }
                }
                """,
                """
                import java.io.IOException;

                public class MyClass {
                    public void process() throws IOException {
                    }
                }
                """
            )
        );
    }

    @Test
    void worksWithMultipleMethods() {
        rewriteRun(
            spec -> spec.recipe(new AddThrowsException("MyClass *(..)", "java.lang.Exception")),
            //language=java
            java(
                """
                public class MyClass {
                    public String execute() {
                        return "";
                    }

                    public int count() {
                        return 0;
                    }

                    public String process() {
                        return "";
                    }
                }
                """,
                """
                public class MyClass {
                    public String execute() throws Exception {
                        return "";
                    }

                    public int count() throws Exception {
                        return 0;
                    }

                    public String process() throws Exception {
                        return "";
                    }
                }
                """
            )
        );
    }
}