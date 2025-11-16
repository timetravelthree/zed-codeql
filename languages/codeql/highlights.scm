; CodeQL syntax highlighting with fixed syntax

; Keywords as literal text tokens, quoted
[
  "import" "from" "where" "select" "as" "order" "by"
  "asc" "desc" "and" "or" "not" "in" "any"
  "forall" "exists" "forex" "implies" "if"
  "then" "else"
] @keyword

; Types: node types from grammar

; Functions and predicates
(predicateName) @function
(memberPredicate name: (predicateName) @function)

; Variables and parameters
(variable) @variable
(varDecl (varName) @variable.parameter)

; Literals
(integer) @number
(float) @number
(string) @string
(bool) @boolean

; Operators as literal text tokens
[
  "+" "-" "*" "/" "%" "=" "!=" "<" ">" "<=" ">="
] @operator

; Punctuation
[( "(" ")" "[" "]" "{" "}" )] @punctuation.bracket
[( ";" "," "." )] @punctuation.delimiter

; Comments (capture names as per Tree-sitter expectations)
(line_comment) @comment
(block_comment) @comment

; Annotations (attributes)
(annotation) @attribute
