DIR=$(pwd)
FILES=$DIR/.*

for f in $FILES
do
    #Check file is a file type
    if [ -f $f ]; then
        filename=${f##*/}
        echo "Linking: $filename"
        rm ~/$filename
        ln -sf $f ~/$filename
    fi
done
