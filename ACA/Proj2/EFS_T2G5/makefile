# ACA 2019/2020
#
# the CUDA stuff is assumed to be installed in /usr/local/cuda
# the CUDA device is assumed to have architecture sm_61 (for the GTX 1060)
#

CUDA_ARCH = sm_61


clean:
	rm -f a.out cryptCuda cryptCudaStride

all:    cryptCuda cryptCudaStride


cryptCuda:           cryptCuda.cu
	nvcc -arch=$(CUDA_ARCH) --compiler-options -O2,-Wall -I/usr/local/cuda/include -o cryptCuda cryptCuda.cu

cryptCudaStride:     cryptCudaStride.cu
	nvcc -arch=$(CUDA_ARCH) --compiler-options -O2,-Wall -I/usr/local/cuda/include -o cryptCudaStride cryptCudaStride.cu

