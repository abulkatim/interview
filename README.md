Протестировано на Ubuntu 20.04 (Hetzner)

В ansible/hosts указывается актуальный IP сервера и путь до ключа на локальной машине

Запускается так:
ansible-playbook -i hosts interview.yml --become

Для этого необходим установленный ансибл на вашем рабочем устройстве

Минимальная конфигурация сервера (CX22) собирается за 8 минут 7 секунд

strange_box.tar.gz лежит в хомяке hero
nginx установлен и сломан
broken_backend.py запущен
пользователи созданы как и пароли к ним
весь необходимый для дебага софт установлен

также через tmux есть возможность наблюдать за тем что делает кандидат (для этого необходимо подключиться к серверу через ssh пользователя hero (или superhero) в момент когда кандидат залогинен с тем же пользователем)
