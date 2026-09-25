/**
 * @name Deprecated Class.newInstance call
 * @description Class.newInstance bypasses explicit constructor lookup and has obsolete exception behavior.
 * @kind problem
 * @problem.severity recommendation
 * @precision high
 * @id java/modernization/deprecated-class-new-instance
 * @tags maintainability
 */

import java

from MethodCall call, Method method
where
  method = call.getMethod() and
  method.getDeclaringType().getSourceDeclaration().hasQualifiedName("java.lang", "Class") and
  method.hasName("newInstance") and
  method.getNumberOfParameters() = 0
select call,
  "Replace Class.newInstance() with getDeclaredConstructor().newInstance() and handle its reflective exceptions."
