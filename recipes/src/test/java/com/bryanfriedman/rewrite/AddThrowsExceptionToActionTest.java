package com.bryanfriedman.rewrite;

import org.junit.jupiter.api.Test;
import org.openrewrite.java.JavaParser;
import org.openrewrite.test.RecipeSpec;
import org.openrewrite.test.RewriteTest;

import static org.openrewrite.java.Assertions.java;

class AddThrowsExceptionToActionTest implements RewriteTest {

    @Override
    public void defaults(RecipeSpec spec) {
        spec.recipe(new AddThrowsException("org.apache.struts.action.Action *(..)", "java.lang.Exception"))
            // Use real classpath names if you have jars; otherwise inline stubs below.
            .parser(JavaParser.fromJavaVersion()
            .classpath("struts", "servlet-api")
        );
    }

    @Test
    void addsThrowsExceptionToExecute() {
        rewriteRun(
            java(
                // before
                """
                import org.apache.struts.action.*;
                import javax.servlet.http.*;

                public class A extends Action {
                    public ActionForward execute(ActionMapping m, ActionForm f,
                                                 HttpServletRequest req, HttpServletResponse res) {
                        return m.findForward("ok");
                    }
                }
                """,
                // after
                """
                import org.apache.struts.action.*;
                import javax.servlet.http.*;

                public class A extends Action {
                    public ActionForward execute(ActionMapping m, ActionForm f,
                                                 HttpServletRequest req, HttpServletResponse res) throws Exception {
                        return m.findForward("ok");
                    }
                }
                """
            )
        );
    }

    @Test
    void appendsExceptionWhenOtherCheckedThrown() {
        rewriteRun(
            java(
                // before
                """
                import org.apache.struts.action.*;
                import javax.servlet.http.*;
                import java.sql.SQLException;

                public class B extends Action {
                    public ActionForward execute(ActionMapping m, ActionForm f,
                                                 HttpServletRequest req, HttpServletResponse res) throws SQLException {
                        return m.findForward("ok");
                    }
                }
                """,
                // after (SQLException remains; Exception appended)
                """
                import org.apache.struts.action.*;
                import javax.servlet.http.*;
                import java.sql.SQLException;

                public class B extends Action {
                    public ActionForward execute(ActionMapping m, ActionForm f,
                                                 HttpServletRequest req, HttpServletResponse res) throws SQLException, Exception {
                        return m.findForward("ok");
                    }
                }
                """
            )
        );
    }

    @Test
    void doesNotTouchNonActionForwardMethods() {
        rewriteRun(
            java(
                // before = after
                """
                public class C {
                    public String helper() { return "x"; }
                }
                """
            )
        );
    }
}