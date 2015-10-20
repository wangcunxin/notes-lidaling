转义序列    描述
\b               退格
\n               换行
\r               回车
\t               制表符
\'               单引号
\"               双引号
\\               反斜杠
\0               NUL。用于在字段或行之间插入NUL字符，或在用于--enclosed-by、--optionally-enclosed-by和--escaped-by参数时表示禁用包围/转义
\0ooo         一个Unicode字符代码点的八进制表示，实际的字符由八进制值ooo指定
\0xhhh       一个Unicode字符代码点的十六进制表示，采用\0xhhh的形式，其中hhh是十六进制值。例如，--fields-terminated-by '\0x10'指定的是回车符

http://web.cs.mun.ca/~michael/c/ascii-table.html
