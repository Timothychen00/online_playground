from json_format_output import json_formal_output

with open('test/game_2.js','r')as file1:
    json_formal_output(file1.read(),'test/game_2_new.js')