
class LogFiller:

    @staticmethod
    def save_ui_log(log_path: str, new_log_path: str) -> None:
        with open(log_path, 'r', encoding='utf-8') as file:
            file_lines = file.readlines()
        ui_lines = [line for line in file_lines if 'UISL-RPC' in line]

        with open(new_log_path, 'w+') as log_file:
            log_file.writelines(ui_lines)


if __name__ == '__main__':
    filler = LogFiller()
    filler.save_ui_log('Launch.log', 'ui.log')
