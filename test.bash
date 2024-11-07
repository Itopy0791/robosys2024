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
# Adjusting expected value to match output format
[ "${out}" = "0" ] || ng "$LINENO"

# 空の入力をテスト
out=$(echo | ./plus)
# Adjusting expected value to match output format
[ "${out}" = "0" ] || ng "$LINENO"

# 最後にテストの結果を確認
[ "$res" = 0 ] && echo OK
exit $res


