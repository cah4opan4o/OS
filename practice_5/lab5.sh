while true; do
    echo "Command List:\n"
    echo "1) Copy file"
    echo "2) Moving file"
    echo "3) Creat file"
    echo "4) Exit"
    read -p "Chose function (1-4): " option

    case $option in
        1)
            read -p "chose file for copy: " file_name
            read -p "directory: " directory
            if [ -f $file_name] && [-d $directory]; then
                cp "$file_name" "$directory"
            else
                echo "ERROR"
            fi
            ;;
        2)
            read -p "chose file for moving: " file_name
            read -p "directory: " directory
            if [ -f $file_name] && [-d $directory]; then
                mv "$file_name" "$directory"
                echo "Файл '$file_name' перемещён в '$directory'"
            else
                echo "ERROR"
            fi
            ;;
        3)
            read -p "file name: " file_name
            touch "$file_name"
            echo "Файл '$file_name' был создан"
            ;;
        4)
            echo "Цикл закончин"
            break
            ;;

        *)
            echo "Такой команды нету"
            ;;
    esac
done