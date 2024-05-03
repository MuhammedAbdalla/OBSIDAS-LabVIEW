import sys

try:
    sheet = open(sys.argv[1], 'r')
    for i,line in enumerate(sheet.readlines()):
        splitLine = line.split(':')
        tag = splitLine[0]
        data = splitLine[1]
        print(f"Line {i}:", tag, data)
except Exception as e:
    print("Error in reading OBSI File:", e)