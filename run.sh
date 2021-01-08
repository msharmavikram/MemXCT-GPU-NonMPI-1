#!/bin/bash

#export PATH=$PATH:/usr/local/cuda/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64

#DOMAIN INFORMATION
export NUMTHE=2400
export NUMRHO=2048
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
export THEFILE=./datasets/ADS4_theta.bin
export SINFILE=./datasets/ADS4_sinogram.bin
export OUTFILE=./datasets/recon_ADS4.bin

export OMP_NUM_THREADS=40

export PINDEX=/mnt/nvme2/memxctdata/ADS4/pidxfile.bin
export PVALUE=/mnt/nvme2/memxctdata/ADS4/pvalfile.bin
export BINDEX=/mnt/nvme2/memxctdata/ADS4/bidxfile.bin
export BVALUE=/mnt/nvme2/memxctdata/ADS4/bvalfile.bin

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/nvme0/bafs_dragon/library/lib64

#nvprof --analysis-metrics -f -o analysis.nvvp build/exe/src/main.cu.exe

make clean
make -j
build/exe/src/main.cu.exe 5
