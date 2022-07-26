FROM python:3.10

RUN mkdir -p /usr/src/app/
# запуск создания директории

WORKDIR /usr/src/app/
# установка рабочей директории

COPY . /usr/src/app/
# копирование всего из нашей директории в рабочую

# переменная окужения для часового пояса, надо указать в параметрах запуска run -e TZ=EUROPE/BERLIN либо раскоментировать строку ниже
#ENV TZ EUROPE/BERLIN

run pip install --no-cache-dir -r requirements.txt
# устанавливаем зависимости для нашего проэкта из reqirements.txt

EXPOSE 8080
# декларация про проброс порта 8080 наружу контейнера (но не сам проброс)
# docker run -d -p 8080:8080 --rm hello_world - при запуске контейнера указываем какой порт внутри будет проброшен в какой порт снаружи

CMD ["python", "app.py"]
# запуск нашего проэкта из командной строки в контейнере


# примонтировать общую папку что бы обновлять данные автоматически, например изменить строку в response.json
# звпустить run с пораметром -v  C:\Users\User\Desktop\Hello\resources:/usr/src/app/resources
#через двоеточие указать рабочую папку указанную в параметрах докер файла + /resources
#второй способ через команду volume : docker volume create xxx
#и при запуске указать run -v web:/usr/src/app/resouces рабочая папка + resources


#FROM — задаёт базовый (родительский) образ.
#LABEL — описывает метаданные. Например — сведения о том, кто создал и поддерживает образ.
#ENV — устанавливает постоянные переменные среды.
#RUN — выполняет команду и создаёт слой образа. Используется для установки в контейнер пакетов.
#COPY — копирует в контейнер файлы и папки.
#ADD — копирует файлы и папки в контейнер, может распаковывать локальные .tar-файлы.
#CMD — описывает команду с аргументами, которую нужно выполнить когда контейнер будет запущен. Аргументы могут быть переопределены при запуске контейнера. В файле может присутствовать лишь одна инструкция CMD.
#WORKDIR — задаёт рабочую директорию для следующей инструкции.
#ARG — задаёт переменные для передачи Docker во время сборки образа.
#ENTRYPOINT — предоставляет команду с аргументами для вызова во время выполнения контейнера. Аргументы не переопределяются.
#EXPOSE — указывает на необходимость открыть порт.
#VOLUME — создаёт точку монтирования для работы с постоянным хранилищем.
