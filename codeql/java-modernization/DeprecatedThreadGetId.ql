/**
 * @name Deprecated Thread.getId call
 * @description Thread.getId is deprecated in modern Java and has a direct replacement.
 * @kind problem
 * @problem.severity recommendation
 * @precision high
 * @id java/modernization/deprecated-thread-get-id
 * @tags maintainability
 */

import java

from MethodCall call, Method method
where
  method = call.getMethod() and
  method.hasQualifiedName("java.lang", "Thread", "getId") and
  method.getNumberOfParameters() = 0
select call, "Replace Thread.getId() with Thread.threadId()."
