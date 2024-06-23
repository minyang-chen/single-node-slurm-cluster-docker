
git clone https://github.com/NVIDIA/nccl-tests.git

#https://github.com/NVIDIA/nccl-tests
#These tests check both the performance and the correctness of NCCL operations.

cd cuda_nccl_test
./make

## quick example

./build/all_reduce_perf -b 8 0e 128M -f 2 -g 1   # 1 gpu

./build/all_reduce_perf -b 8 0e 128M -f 2 -g 2   # 2 gpu
