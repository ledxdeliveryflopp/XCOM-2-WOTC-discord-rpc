
def extract_mission_info():
    with open(r'C:\Users\Tim.TIMOHA-PC\Documents\My Games\XCOM2 War of the Chosen\XComGame\Logs\Launch.log', 'r', encoding='utf-8') as log_file:
        collected_data: dict = {}
        mission_counter: int = 0
        mission_end_counter: int = 0
        chosen_counter: int = 0
        for line in log_file:
            if 'RPC-MISSION-INFO: OpName:' in line:
                mission_counter += 1
                collected_data['OpName'] = line.split(':')[2].replace('\n', '')
                collected_data['op_name_success'] = True
            if 'RPC-MISSION-INFO: Core OP mission type:' in line:
                collected_data['mission_type'] = line.split()[6]
                collected_data['mission_type_success'] = True
            if 'RPC-MISSION-INFO: PlotName:' in line:
                collected_data['mission_plot'] = line
                collected_data['mission_plot_success'] = True
            if 'On-Post-Mission-END' in line:
                mission_end_counter += 1
            if 'UIChosenReveal' in line:
                chosen_counter += 1
                if chosen_counter == mission_counter:
                    collected_data['enemy_data'] = {'logo': 'chosen_logo', 'type': 'chosen'}
                else:
                    collected_data['enemy_data'] = {'logo': 'advent_logo', 'type': 'advent'}
        if mission_counter == mission_end_counter:
            return None
        op_name_status = collected_data.get('op_name_success')
        mission_type_status = collected_data.get('mission_type_success')
        mission_plot_status = collected_data.get('mission_plot_success')
        if op_name_status is True and mission_type_status is True and mission_plot_status is True:
            return collected_data


def extract_game_state():
    with open(r'C:\Users\Tim.TIMOHA-PC\Documents\My Games\XCOM2 War of the Chosen\XComGame\Logs\Launch.log', 'r', encoding='utf-8') as log_file:
        result: str = None
        for line in log_file:
            if 'UISL-RPC: RPC-SCREEN:' in line:
                result = line
        if result:
            return result.split()[3]


# [0650.64] Log: Kismet: << Processing XCom Unit List >>
# [0650.64] Log: Kismet:  5 : Units registered to XCOM squad list
# [0650.64] Log: Kismet:  X : Updating XCOM list counts
# [0650.64] Log: Kismet:  5 : XCOM squad units in play
# [0650.64] Log: Kismet:  0 : XCOM squad units killed
# [0650.64] Log: Kismet:  0 : XCOM squad units extracted
# [0650.64] Log: Kismet:  3 : Set XCom Heavy Losses threshold


def extract_player_squad():
    with open(r'C:\Users\Tim.TIMOHA-PC\Documents\My Games\XCOM2 War of the Chosen\XComGame\Logs\Launch.log', 'r', encoding='utf-8') as log_file:
        result: int = None
        unit_all_count: int = None
        for line in log_file:
            if 'Units registered to XCOM squad list' in line:
                unit_all_count = int(line.split()[3])
            if 'XCOM squad units in play' in line:
                result = int(line.split()[3])
            if 'XCOM squad units killed' in line:
                result = result - int(line.split()[3])
        if result:
            return result, unit_all_count


def extract_alien_facility_count():
    with open(r'C:\Users\Tim.TIMOHA-PC\Documents\My Games\XCOM2 War of the Chosen\XComGame\Logs\Launch.log', 'r', encoding='utf-8') as log_file:
        result: int = 0
        for line in log_file:
            if 'RPC-ALIEN-INFO:' in line:
                result += 1
        return result
#

# if __name__ == '__main__':
#     extract_alien_facility_count()
