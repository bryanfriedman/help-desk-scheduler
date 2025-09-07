package com.bryanfriedman.rewrite.struts;

import org.openrewrite.ExecutionContext;
import org.openrewrite.Recipe;
import org.openrewrite.TreeVisitor;
import org.openrewrite.java.JavaVisitor;
import org.openrewrite.java.JavaTemplate;
import org.openrewrite.java.MethodMatcher;
import org.openrewrite.java.tree.J;

public class FindDataSourceToJndi extends Recipe {

    @Override public String getName() {
        return "com.bryanfriedman.rewrite.struts.FindDataSourceToJndi";
    }
    @Override public String getDisplayName() { return "Replace Struts data source helpers with JNDI lookup"; }
    @Override public String getDescription() { return "Replaces ActionServlet.findDataSource(..) / RequestUtils.getDataSource(..) with a JNDI javax.sql.DataSource lookup."; }

    @Override
    public TreeVisitor<?, ExecutionContext> getVisitor() {
        return new JavaVisitor<ExecutionContext>() {
            final MethodMatcher mFind = new MethodMatcher("org.apache.struts.action.ActionServlet findDataSource(..)");
            final MethodMatcher mReq  = new MethodMatcher("org.apache.struts.util.RequestUtils getDataSource(..)");

            final JavaTemplate jndiExpr = JavaTemplate.builder(
                "(DataSource) ((Context) new InitialContext().lookup(\"java:comp/env\")).lookup(\"jdbc/hds\")"
            ).imports(
                "javax.naming.Context",
                "javax.naming.InitialContext",
                "javax.sql.DataSource"
            ).build();

            @Override
            public J visitMethodInvocation(J.MethodInvocation mi, ExecutionContext ctx) {
                J m = super.visitMethodInvocation(mi, ctx);
                if (m instanceof J.MethodInvocation && (mFind.matches((J.MethodInvocation) m) || mReq.matches((J.MethodInvocation) m))) {
                    // Ensure imports are added
                    maybeAddImport("javax.naming.Context");
                    maybeAddImport("javax.naming.InitialContext");
                    maybeAddImport("javax.sql.DataSource");

                    return jndiExpr.apply(getCursor(), ((J.MethodInvocation) m).getCoordinates().replace());
                }
                return m;
            }
        };
    }
}