import random
import time
from datetime import datetime


def extract_mission_info(input_file, output_file):
    with open(input_file, 'r', encoding='utf-8') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
        recording = False
        for line in infile:
            print(line)
            if "RPC-MISSION-INFO: ------------------------------On-Pre-Mission-Start------------------------------" in line:
                recording = True
                outfile.write(line)  # Записываем строку начала блока
            elif "RPC-MISSION-INFO: ------------------------------On-Pre-Mission-END--------------------------------" in line:
                if recording:
                    outfile.write(line)  # Записываем строку конца блока
                    recording = False
                    outfile.write("\n")  # Добавляем пустую строку между блоками
            elif recording:
                outfile.write(line)  # Записываем строки внутри блока


input_log_file = r'C:\Users\Tim.TIMOHA-PC\Documents\My Games\XCOM2 War of the Chosen\XComGame\Logs\Launch.log'
output_log_file = f'Parsed_{datetime.now().date()}_{random.randint(1, 1000000000)}.log'

if __name__ == '__main__':
    while True:
        time.sleep(5)
        extract_mission_info(input_log_file, output_log_file)
