function show_error {
    echo "Недопустимая опция: -$1" >&2
    exit 1
}

while getopts ":fm:" opt; do
    case $opt in
        f)
            echo "Приветственное сообщение!"
            ;;
        m)
            if [[ -e "$OPTARG" ]]; then
                echo "Файл '${OPTARG}' есть."
            else
                echo "Файл '${OPTARG}' нет."
            fi
            ;;
        ?)
            show_error $OPTARG
            ;;
        :)
            echo "Опция -$OPTARG требует аргумент." >&2
            exit 1
            ;;
    esac
done

if [ "$OPTIND" -eq 1 ]; then
    echo "Не указаны параметры. Используйте -f или -m name."
fi