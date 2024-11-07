#!/bin/bash -xv

ng () {
        echo "${1}行目が違うよ"
	res=1
}

res=0

# 最初のテスト
out=$(seq 5 | ./plus)
[ "${out}" = "15" ] || ng "$LINENO"

# 無効な入力をテスト (警告メッセージを無視して最終結果を比較)
out=$(echo あ | ./plus)
# 出力が警告メッセージを含んでいる場合、最終結果 "0" を比較
out_result=$(echo "$out" | tail -n 1)  # 最後の行を抽出
[ "${out_result}" = "0" ] || ng "$LINENO"

# 空の入力をテスト
out=$(echo | ./plus)
out_result=$(echo "$out" | tail -n 1)  # 最後の行を抽出
[ "${out_result}" = "0" ] || ng "$LINENO"

# 最後にテストの結果を確認
[ "$res" = 0 ] && echo OK
exit $res

