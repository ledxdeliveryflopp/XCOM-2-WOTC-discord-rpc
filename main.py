import datetime
import sys
import time
import uuid

from loguru import logger
from pypresence import Presence, ActivityType

from log_parser import extract_mission_info, extract_game_state, extract_player_squad, extract_alien_facility_count


mission_type_dict: dict = {
    'NeutralizeFieldCommander': 'Убить полевого командира',
    'ProtectDevice': 'Защитить устройство',
    'ChosenRetaliation': 'Защитить сопротивление'
}

ui_states_dict: dict = {
    'UIStrategyMap': 'На стратегической карте',
    'UILoadGame': 'Загружается',
    'UIPersonnel_Armory': 'Просматривает список солдат',
    'robojumper_UISquadSelect': 'Выбирает отряд',
    'UIPersonnel_SquadSelect': 'Выбирает отряд',
    'UIPauseMenu': 'Пауза',
    'UIAvengerHUD': 'Мститель'
}


if __name__ == '__main__':
    client_id = "1385860669735178241"
    RPC = Presence(client_id)
    start = time.time()
    RPC.connect()
    logger.add(rf"xcom_logger_{datetime.datetime.now().timestamp()}.log", rotation="100 MB",
               format="{time:DD-MM-YYYY at HH:mm:ss} | {level} | {message}")
    try:
        while True:
            time.sleep(3)
            mission_data = extract_mission_info()
            if mission_data:
                actual_squad_size, full_squad_size = extract_player_squad()
                logger.info(f'mission_data: {mission_data}')
                logger.info(f'actual squad size: {actual_squad_size}')
                logger.info(f'full squad size: {full_squad_size}')
                mission_name = mission_data.get('OpName')
                mission_objective = mission_data.get('mission_type')
                enemy_data = mission_data.get('enemy_data', {'logo': 'advent_logo', 'type': 'advent'})
                enemy_logo = enemy_data['logo']
                enemy_type = enemy_data['type']
                normal_objective = mission_type_dict.get(mission_objective, mission_objective)
                RPC.update(
                    activity_type=ActivityType.PLAYING,
                    details='Выполняет задание',
                    state=mission_name,
                    party_size=[actual_squad_size, full_squad_size],
                    large_text=normal_objective,
                    large_image='test',
                    party_id=str(uuid.uuid4()),
                    small_image=enemy_logo,
                    small_text=enemy_type,
                    start=start,
                )
            else:
                state = extract_game_state()
                facility_count = extract_alien_facility_count()
                logger.info(f'state: {state}')
                logger.info(f'facility count: {facility_count}')
                normal_state = ui_states_dict.get(state, state)
                RPC.update(
                    activity_type=ActivityType.PLAYING,
                    details=normal_state,
                    state=f'Объектов пришельцев: {facility_count}',
                    large_text='XCOM 2 WOTC',
                    large_image='test',
                    start=start,
                )
    except KeyboardInterrupt:
        RPC.close()
        exit(1)
    except FileNotFoundError as exception:
        RPC.close()
        logger.info(f'error while read file: {exception}')
        sys.exit(1)
