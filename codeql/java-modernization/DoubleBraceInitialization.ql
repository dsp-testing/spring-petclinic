/**
 * @name Double-brace initialization
 * @description An anonymous class with an instance initializer introduces an unnecessary subtype.
 * @kind problem
 * @problem.severity recommendation
 * @precision high
 * @id java/modernization/double-brace-initialization
 * @tags maintainability
 */

import java

from
  ClassInstanceExpr creation, AnonymousClass anonymousClass, InstanceInitializer initializer,
  BlockStmt initializerBlock
where
  anonymousClass = creation.getAnonymousClass() and
  initializer.getDeclaringType() = anonymousClass and
  initializerBlock.getParent() = initializer.getBody()
select creation,
  "Replace double-brace initialization with normal object construction and explicit initialization."
