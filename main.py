import os
import logging 
import time
from datetime import datetime


def main():
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    test_env = os.getenv("test_env", 0)
    logging.info("test_env = {}, local time: {}, timezone: {}".format(
        test_env, current_time, time.tzname))

if __name__ == "__main__":
    format_str = (
        '%(asctime)s: %(levelname)s '
        '%(filename)s:%(lineno)d] %(message)s')
    formatter = logging.Formatter(format_str)
    stream_handler = logging.StreamHandler()
    stream_handler.setFormatter(formatter)

    logger = logging.getLogger()
    logger.setLevel(logging.INFO)
    logger.addHandler(stream_handler)
    main()
