#!/bin/bash

#export PATH=$PATH:/usr/local/cuda/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

#DOMAIN INFORMATION
export NUMTHE=720
export NUMRHO=512
export PIXSIZE=1
#SOLVER DATA
export NUMITER=25
#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=512
export SPECSIZE=512
#BLOCK SIZE
export PROJBLOCK=512
export BACKBLOCK=512
#BUFFER SIZE
export PROJBUFF=48 #KB
export BACKBUFF=48 #KB
#I/O FILES
export THEFILE=./datasets/ADS2_theta.bin
export SINFILE=./datasets/ADS2_sinogram.bin
export OUTFILE=./datasets/recon_ADS2.bin

export OMP_NUM_THREADS=40

export PINDEX=/mnt/nvme0/memxctdata/ADS3/pidxfile.bin
export PVALUE=/mnt/nvme0/memxctdata/ADS3/pvalfile.bin
export BINDEX=/mnt/nvme0/memxctdata/ADS3/bidxfile.bin
export BVALUE=/mnt/nvme0/memxctdata/ADS3/bvalfile.bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/nvme0/bafs_dragon/library/lib64

#nvprof --analysis-metrics -f -o analysis.nvvp build/exe/src/main.cu.exe

make clean
make -j
cuda-memcheck build/exe/src/main.cu.exe 1
