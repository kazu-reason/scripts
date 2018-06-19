import csv
import sys
import os.path

args = sys.argv

# 引数のCSVファイル名について，validation
if len(args) < 2:
    print('CSVファイルを引数で指定してください．')
    sys.exit(1)
if not os.path.isfile(args[1]):
    print('CSVファイル {0} がありません．'.format(input_file))
    sys.exit(1)

input_file = args[1]
output_file = 'editCSV.py'
this_path = '/Users/naoki/scripts/editCSV'

f = open(input_file, 'r')
reader = csv.reader(f)
header = next(reader)
colnum = len(header)

# editCSV.py に出力するコードを作成
output_code = ''
for i in range(colnum):
    output_code += "row['{0}'], ".format(header[i])
f.close()

output_code = "output_row = [{0}]".format(output_code[:-2])

# editCSV.template.py の '# {{output}}' の部分に output_code を置換
f_template = open('{0}/editCSV.template.py'.format(this_path), 'r')
f_output = open(output_file, 'w')
for row in f_template:
    # '# {{output}}' の行を検索し，置換
    if row.find('# {{output}}'):
        row = row.replace('# {{output_row}}', output_code)
    f_output.write(row)
f_output.close()
f_template.close()
