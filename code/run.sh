rm -rf ./kymppitonni;
gcc kymppitonni-orig.c -o kymppitonni;
touch ./output.txt;
./kymppitonni 50 10 300 >> ./output.txt;
cat output.txt;
rm -rf ./kymppitonni;
rm -rf ../outputs/output.txt;
mv ./output.txt ../outputs/output.txt;
