# clean and compile
rm -rf ./kymppitonni;
gcc -o kymppitonni kymppitonni-pthreads.c -lpthread;
# run on 2 threads
touch ./output_pthreads_2.txt;
./kymppitonni 50 10 300 2 >> ./output_pthreads_2.txt;
cat output_pthreads_2.txt;
# run on three threads
touch ./output_pthreads_3.txt;
./kymppitonni 50 10 300 3 >> ./output_pthreads_3.txt;
cat output_pthreads_3.txt;
# run on 4 threads
touch ./output_pthreads_4.txt;
./kymppitonni 50 10 300 4 >> ./output_pthreads_4.txt;
cat output_pthreads_4.txt;
# clean executable and prev outputs
rm -rf ./kymppitonni;
rm -rf ../outputs/output_pthreads_2.txt;
rm -rf ../outputs/output_pthreads_3.txt;
rm -rf ../outputs/output_pthreads_4.txt;
# move outputs to their folder
mv ./output_pthreads_2.txt ../outputs/output_pthreads_2.txt;
mv ./output_pthreads_3.txt ../outputs/output_pthreads_3.txt;
mv ./output_pthreads_4.txt ../outputs/output_pthreads_4.txt;
