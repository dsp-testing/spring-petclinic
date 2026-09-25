/**
 * @name Deprecated Integer string constructor
 * @description Using the deprecated Integer string constructor obscures the preferred value factory.
 * @kind problem
 * @problem.severity recommendation
 * @precision high
 * @id java/modernization/deprecated-integer-string-constructor
 * @tags maintainability
 */

import java

from ClassInstanceExpr creation, Constructor constructor
where
  constructor = creation.getConstructor() and
  constructor.getDeclaringType().hasQualifiedName("java.lang", "Integer") and
  constructor.getNumberOfParameters() = 1 and
  constructor.getParameter(0).getType().(RefType).hasQualifiedName("java.lang", "String")
select creation, "Replace this deprecated constructor with Integer.valueOf(String)."
