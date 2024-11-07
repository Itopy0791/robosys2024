#!/bin/bash -xv

ng () {
        echo ${1}行目が違うよ
	res=1
}

res=0
# 最初のテスト
out=$(seq 5 | ./plus)
++ seq 5
++ ./plus
+ out=15
[ "${out}" = "15" ] || ng "$LINENO"
+ '[' 15 = 15 ']'

# 無効な入力をテスト (ここで出力からWarningメッセージを無視)
out=$(echo あ | ./plus)
++ echo あ
++ ./plus
+ out='Warning: '\''あ'\'' is not a valid number. Treated as 0.0
0.0'
# 期待される出力を「0.0」と比較
[ "${out}" = "0.0" ] || ng "$LINENO"
+ '[' 0.0 = 0.0 ']'

# 空の入力をテスト
out=$(echo | ./plus)
++ echo
++ ./plus
+ out='0.0'
[ "${out}" = "0.0" ] || ng "$LINENO"
+ '[' 0.0 = 0.0 ']'

# 最後にテストの結果を確認
[ "$res" = 0 ] && echo OK
+ '[' 0 = 0 ']'
OK
exit $res
+ exit 0

