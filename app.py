from flask import Flask, request, render_template, jsonify
import pymysql

app = Flask(__name__)

def get_db_connection():
    return pymysql.connect(
        host="localhost",
        user="root",
        password="",
        database="music_db",
        port=8000,
        charset="utf8mb4"
    )

instrument_icons = {
    'Гитара': 'fa-guitar',
    'Барабаны': 'fa-drum',
    'Пианино': 'fa-keyboard',
    'Скрипка': 'fa-music',  
    'Бас-гитара': 'fa-guitar',  
    'Саксофон': 'fa-music',  
   'Трубка': 'fa-volume-up',
    'Флейта': 'fa-flute',
    'Клавишные': 'fa-keyboard',
    'Виолончель': 'fa-cello'
}

@app.route("/", methods=["GET", "POST"])
def index():
    result = []
    message = ""  
    if request.method == "POST":
        search_query = request.form.get("song_name")

        if search_query.strip() == "":  
            message = "Пожалуйста, введите текст для поиска."  
        else:
            db = get_db_connection()
            try:
                with db.cursor() as cursor:
                    query = """
                        SELECT name, instruments, genre FROM songs 
                        WHERE name LIKE %s OR genre LIKE %s
                    """
                    cursor.execute(query, ('%' + search_query + '%', '%' + search_query + '%'))
                    result = cursor.fetchall()
            finally:
                db.close()

            if not result:
                message = "Ничего не найдено"  

    return render_template("index.html", result=result, message=message, instrument_icons=instrument_icons)

@app.route("/instrument", methods=["GET"])
def get_instrument_info():
    instrument_name = request.args.get("instrument")
    db = get_db_connection()
    try:
        with db.cursor() as cursor:
            query = "SELECT name, description FROM instruments WHERE name = %s"
            cursor.execute(query, (instrument_name,))
            result = cursor.fetchone()
    finally:
        db.close()

    if result:
        return jsonify({"name": result[0], "info": result[1]})
    else:
        return jsonify({"name": "Инструмент не найден", "info": "Описание отсутствует"})

if __name__ == "__main__":
    app.run(debug=True, host='0.0.0.0', port=10000)