# Инструменты в Музыке

Проект **Инструменты в Музыке** представляет собой веб-приложение, позволяющее искать информацию о инструментах, которые используются в песнях.

## Команда

- **Мария Булытова** — Frontend разработчица.
- **Витряк Богдан** — Backed разработчик.

## Описание

Веб-приложение предоставляет следующие функции:
- Поиск песен по названию или жанру.
- Отображение списка песен с доступными инструментами.
- Информация об инструментах по клику.

## Требования

Для корректной работы проекта необходимо:
- Установленный **Python 3.x** для серверной части.
- Установленный **XAMPP** с настройкой порта MySQL на **8000**.

## Установка

1. Настройте локальный сервер с портом **8000**:
   - Установите **XAMPP** на вашем компьютере.
   - Откройте панель управления XAMPP.
   - Перейдите в настройки **MySQL** и измените порт на **8000**:
     1. Найдите строку `port=3306` и измените её на `port=8000`.
     2. Перезапустите сервер MySQL через панель управления XAMPP.

2. Клонируйте репозиторий:
    ```cmd
    git clone https://github.com/ваш-проект/инструменты-в-музыке.git
    cd инструменты-в-музыке
    ```
3. Создайте базу данных
	- Найдите файл music_db.sql в папке проекта после клонирования.
	- Откройте phpMyAdmin (обычно доступен по адресу http://localhost:8000/phpmyadmin).
	- Перейдите во вкладку SQL.
	- Скопируйте содержимое файла music_db.sql.
	- Вставьте его в текстовое поле и нажмите Выполнить.
Это создаст базу данных music_db и заполнит её начальными данными.

4. Установите все необходимые зависимости:
    Для установки зависимостей Python (если используется Flask):
    ```cmd
    pip3 install flask pymysql
    ```
## Запуск

Для запуска приложения выполните следующие шаги:

1. Запустите сервер:

    **Python**:
    ```cmd
    python app.py
    ```

2. Откройте браузер и перейдите по адресу который будет предоставлен вам в терминале.

## Структура проекта

```
├── /static
│   ├── /css
│   │   └── style.css         # Стили CSS
│   └── /js
│       └── script.js         # Скрипты JavaScript
│
├── /templates
│   └── index.html            # Главная HTML-страница
│
├── app.py                    # Основной серверный скрипт приложения
│
├── music_db.sql              # SQL файл для создания базы данных
│
├── requirements.txt          # Список зависимостей Python
│
└── README.md                 # Документация проекта
```
## Технологии

- **HTML5** — для структуры страницы.
- **CSS3** — для оформления и анимаций.
- **JavaScript** — для динамических взаимодействий.
- **Python (Flask)** — для серверной части.