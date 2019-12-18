function branches() {
    git branch | while read line; do
        current=' '
        name=${line##\* }   ## removes leading * for current
        if [ ! "$name" = "$line" ]; then
            current='*';
        fi
        description=`git config branch.$name.description`
        if [ -z $description ]; then
            printf "%-2s %-20s\n" $current $name
        else
            printf "%-2s %-20s %s\n" $current $name $description
        fi
    done
}
