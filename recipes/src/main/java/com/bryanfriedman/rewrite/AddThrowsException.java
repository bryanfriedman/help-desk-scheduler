package com.bryanfriedman.rewrite;

import lombok.Value;
import lombok.EqualsAndHashCode;
import org.openrewrite.*;
import org.openrewrite.internal.lang.Nullable;
import org.openrewrite.java.JavaIsoVisitor;
import org.openrewrite.java.MethodMatcher;
import org.openrewrite.java.tree.J;
import org.openrewrite.java.tree.JContainer;
import org.openrewrite.java.tree.JRightPadded;
import org.openrewrite.java.tree.JavaType;
import org.openrewrite.java.tree.NameTree;
import org.openrewrite.java.tree.Space;
import org.openrewrite.marker.Markers;

import java.util.ArrayList;
import java.util.List;

import static java.util.Collections.emptyList;
import static java.util.Collections.singletonList;

@Value
@EqualsAndHashCode(callSuper = false)
public class AddThrowsException extends Recipe {

    @Option(displayName = "Method pattern",
            description = "A method pattern to match methods to add throws Exception to. Patterns use the format: <class> <method>(<args>)",
            example = "MyClass execute()")
    String methodPattern;

    @Option(displayName = "Exception to add",
            description = "The fully qualified exception type to add to the throws clause",
            example = "java.io.IOException",
            required = false)
    @Nullable
    String exceptionType;

    @Override
    public String getDisplayName() {
        return "Add throws Exception to methods";
    }

    @Override
    public String getDescription() {
        return "Adds 'throws Exception' to method declarations matching the specified method pattern.";
    }

    @Override
    public TreeVisitor<?, ExecutionContext> getVisitor() {
        MethodMatcher methodMatcher = new MethodMatcher(methodPattern, true);

        return new JavaIsoVisitor<ExecutionContext>() {
            @Override
            public J.MethodDeclaration visitMethodDeclaration(J.MethodDeclaration method, ExecutionContext ctx) {
                J.MethodDeclaration m = super.visitMethodDeclaration(method, ctx);

                // Skip constructors
                if (m.isConstructor()) {
                    return m;
                }

                // Check if method matches the pattern
                // MethodMatcher requires the enclosing class context
                J.ClassDeclaration enclosingClass = getCursor().firstEnclosing(J.ClassDeclaration.class);

                // If no enclosing class, try matching the method type directly
                if (enclosingClass == null) {
                    if (m.getMethodType() == null || !methodMatcher.matches(m.getMethodType())) {
                        return m;
                    }
                } else if (!methodMatcher.matches(m, enclosingClass)) {
                    return m;
                }

                String exceptionFqn = exceptionType != null ? exceptionType : "java.lang.Exception";

                // Extract the simple name from FQN
                String exceptionSimpleName = exceptionFqn.substring(exceptionFqn.lastIndexOf('.') + 1);

                // Check if the exception is already in the throws clause
                if (m.getThrows() != null) {
                    for (NameTree throwsType : m.getThrows()) {
                        if (throwsType instanceof J.Identifier &&
                            ((J.Identifier) throwsType).getSimpleName().equals(exceptionSimpleName)) {
                            return m;
                        }
                        // Also check for fully qualified references
                        if (throwsType instanceof J.FieldAccess) {
                            J.FieldAccess fa = (J.FieldAccess) throwsType;
                            if (fa.getSimpleName().equals(exceptionSimpleName)) {
                                return m;
                            }
                        }
                    }
                }

                // Add import if not java.lang
                if (!exceptionFqn.startsWith("java.lang.")) {
                    maybeAddImport(exceptionFqn);
                }

                // Add the exception to the throws clause
                if (m.getThrows() == null || m.getThrows().isEmpty()) {
                    // When adding first throws clause, we need to create a JContainer with proper spacing
                    J.Identifier exceptionIdentifier = new J.Identifier(
                            Tree.randomId(),
                            Space.SINGLE_SPACE,  // Space between "throws" and the exception name
                            Markers.EMPTY,
                            emptyList(),
                            exceptionSimpleName,
                            JavaType.ShallowClass.build(exceptionFqn),
                            null
                    );

                    // Create JContainer with space before "throws" keyword
                    JContainer<NameTree> throwsContainer = JContainer.build(
                            Space.SINGLE_SPACE,  // This adds the space before "throws"
                            singletonList(JRightPadded.build(exceptionIdentifier)),
                            Markers.EMPTY
                    );

                    return m.getPadding().withThrows(throwsContainer);
                } else {
                    // Add to existing throws clause
                    List<NameTree> newThrows = new ArrayList<>(m.getThrows());
                    J.Identifier exceptionIdentifier = new J.Identifier(
                            Tree.randomId(),
                            Space.SINGLE_SPACE,
                            Markers.EMPTY,
                            emptyList(),
                            exceptionSimpleName,
                            JavaType.ShallowClass.build(exceptionFqn),
                            null
                    );
                    newThrows.add(exceptionIdentifier);
                    return m.withThrows(newThrows);
                }
            }
        };
    }
}