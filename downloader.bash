#! /usr/bin/env bash

python3 pgnmentor_parser.py

if  test -d "./pgn"
then
    rm -rf ./pgn/
fi

if  test -d "./database"
then
    rm -rf ./database/
fi

if  test -d "./temp"
then
    rm -rf ./temp
fi

mkdir ./temp
mkdir ./database
mkdir ./pgn

cd ./temp

for link in $(cat ../urls.txt)
do
    curl -O ${link}
done

for input_file in $(ls *.zip)
do
    unzip -o "${input_file}" -d ../pgn/"${input_file%.*}"
done

cd ../pgn

for dir in $(ls)
do
    cat "${dir}/${dir}.pgn" | tee -a "../database/database.pgn"
done

cd ../

rm -rf ./temp