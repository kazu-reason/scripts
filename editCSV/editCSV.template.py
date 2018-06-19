import pandas as pd
imput_file = 'desharnais.csv'
output_file = 'output.csv'

csv = pd.read_csv(imput_file)
header = csv.columns
colnum = len(header)

output_text = "{0}\n".format(', '.join(header))
for index, row in csv.iterrows():
    # row['列名']の値を編集することで，ファイルを編集できます．

    # {{output_row}}
    output_row_str = map(str, output_row)
    output_row = ', '.join(output_row_str)

    # 改行込みで変数に格納
    output_text += output_row + '\n'

# 編集した内容をファイルに出力
f = open(output_file, 'w')
f.write(output_text)
f.close()
