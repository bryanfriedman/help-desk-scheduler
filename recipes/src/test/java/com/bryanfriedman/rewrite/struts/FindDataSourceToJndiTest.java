package com.bryanfriedman.rewrite.struts;

import org.junit.jupiter.api.Test;
import org.openrewrite.Recipe;
import org.openrewrite.java.JavaParser;
import org.openrewrite.test.RecipeSpec;
import org.openrewrite.test.RewriteTest;

import static org.openrewrite.java.Assertions.java;

class FindDataSourceToJndiTest implements RewriteTest {

    @Override
    public void defaults(RecipeSpec spec) {
        spec.recipe(new FindDataSourceToJndi());
        spec.parser(JavaParser.fromJavaVersion()
            .classpath("struts", "servlet-api")
    );
    }

    @Test
    void replacesFindDataSourceNull() {
        rewriteRun(
            //language=java
           java(
            // before
            """
            package a;

            import org.apache.struts.action.ActionServlet;
            import javax.sql.DataSource;

            class C {
                ActionServlet servlet;
                DataSource ds;
                void m() {
                    ds = servlet.findDataSource(null);
                }
            }
            """,
            // after
            """
            package a;

            import org.apache.struts.action.ActionServlet;

            import javax.naming.Context;
            import javax.naming.InitialContext;
            import javax.sql.DataSource;

            class C {
                ActionServlet servlet;
                DataSource ds;
                void m() {
                    ds = (DataSource) ((Context) new InitialContext().lookup("java:comp/env")).lookup("jdbc/hds");
                }
            }
            """
          )
        );
    }
}