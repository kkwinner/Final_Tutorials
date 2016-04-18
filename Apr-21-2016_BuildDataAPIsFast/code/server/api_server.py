# -*- coding: utf-8 -*-
import connexion
from datetime import datetime


def root():
    cur_time = datetime.now().isoformat()
    return {'name': 'demo-data-one', 'time': cur_time}

if __name__ == '__main__':
    app = connexion.App(__name__, specification_dir='apispec/')
    app.add_api('data_api.yaml')

    # run our standalone gevent server
    app.run(port=1234)