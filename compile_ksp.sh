echo "compiling ksp"

cd /root/killport/ksp/bpf

clang -S \
    -g \
    -target bpf \
    -I../../libbpf/src\
    -Wall \
    -Werror \
    -O2 -emit-llvm -c -o dicmp_kern.ll dicmp_kern.c

llc -march=bpf -filetype=obj -O2 -o dicmp_kern.o dicmp_kern.ll
