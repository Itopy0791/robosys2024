#!/bin/bash -xv

ng () {
        echo "${1}行目が違うよ"
	res=1
}

res=0

# 最初のテスト
out=$(seq 5 | ./plus)
[ "${out}" = "15" ] || ng "$LINENO"

# 無効な入力をテスト (ここで出力からWarningメッセージを無視)
out=$(echo あ | ./plus)
# 期待される出力を「0.0」と比較
[ "${out}" = "0.0" ] || ng "$LINENO"

# 空の入力をテスト
out=$(echo | ./plus)
[ "${out}" = "0.0" ] || ng "$LINENO"

# 最後にテストの結果を確認
[ "$res" = 0 ] && echo OK
exit $res

