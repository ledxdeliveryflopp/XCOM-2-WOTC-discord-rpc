

class Const:
    deleted_list = [
        'Failed to load',
        'WotC_Armory_GripFix_BattleRifles',
        'Warning: Redscreen: Found SpawnRestrictor',
        'Error: (RemoveNetObject)',
        'Warning: Attempting to detach NULL',
        'Warning: UpdateAIJob',
        ' Error: (AddNetObject) Object',
        'Warning: Warning,'
        'Warning: Redscreen:',
        'Warning',
        'WotC_Gameplay_SupportStrikes',
    ]


class LogCleaner:
    """Очистка лога игры"""
    @staticmethod
    def remove_lines_with_content(log_path: str, str_to_remove: str) -> None:
        with open(log_path, 'r', encoding='utf-8') as file:
            file_lines = file.readlines()
            filtered_lines = [line for line in file_lines if str_to_remove not in line]

        with open(log_path, 'w', encoding='utf-8') as file:
            file.writelines(filtered_lines)


if __name__ == '__main__':
    cleaner = LogCleaner()
    for line in Const.deleted_list:
        cleaner.remove_lines_with_content('Launch-backup-2025.06.18-22.18.17.log', line)
