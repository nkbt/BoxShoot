Описание
-----
Приложение - прослойка, для создания скриншотов и использования публичной папки DropBox в качестве хранишища.

По горячей кнопке запускается приложение предлагающее выбрать область для снятия скриншота
Сохраняет скриншот в публичную папку dropbox c уникальным именем (MD5 hash дата+время)
Копирует в буфер полный URL до изображения

Установка
-----
1. Установить MiniCapSetup.exe
2. Проверить путь установки (обычно: C:\Program Files (x86)\MiniCap\MiniCap.exe или C:\Program Files\MiniCap\MiniCap.exe)
3. Внести изменения в config.ini изменив значение CAP
4. Создать каталог для скриншотов в общедоступной папке Public в каталоге Dropbox (например C:\Dropbox\Public\pic\)
5. Внести изменения в config.ini изменив значение DBOX_DIR
6. Через сайт dropbox получить начальную часть ссылки (например: http://dl.dropbox.com/u/2058666/pic/)
7. Внести изменения в config.ini изменив значение DBOX_URL
8. Изменить, если потребуется, hotkey для снятия скриншота. По умолчанию PRINTSCREEN (shoot_key в config.ini)
9. Скопировать config.ini и BoxShoot.exe в отдельный каталог (например C:\Program Files\BoxShoot)
10. Создать ярлык C:\Program Files\BoxShoot\BoxShoot.exe в автозагрузке

Ссылки
-----
AutoIT	http://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3-setup.exe

DropBox	http://cdn.dropbox.com/Dropbox%201.2.48.exe

MiniCAP	http://www.donationcoder.com/Software/Mouser/MiniCap/downloads/MiniCapSetup.exe
