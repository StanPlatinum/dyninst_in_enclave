.text
.file	"test.bc"
.globl	enclave_main            # -- Begin function enclave_main
.p2align	4, 0x90
.type	enclave_main,@function
enclave_main:                           # @enclave_main
.cfi_startproc
# %bb.0:
pushq	%rbp
.cfi_def_cfa_offset 16
.cfi_offset %rbp, -16
movq	%rsp, %rbp
.cfi_def_cfa_register %rbp
movl	$4000000000, %eax       # imm = 0xEE6B2800
pushq %rax
leaq	-4(%rbp,%rax), %rax
cmpq	$12121, %rax            # imm = 0x2F59
ja .chenyi_sgx_exit
cmpq	$12121, %rax            # imm = 0x2F59
jl .chenyi_sgx_exit
popq %rax
leaq	-4(%rbp,%rax), %rcx
pushq %rax
leaq	-16(%rbp), %rax
cmpq	$12121, %rax            # imm = 0x2F59
ja .chenyi_sgx_exit
cmpq	$12121, %rax            # imm = 0x2F59
jl .chenyi_sgx_exit
popq %rax
movq	%rcx, -16(%rbp)
pushq %rax
leaq	-4(%rbp,%rax), %rax
cmpq	$12121, %rax            # imm = 0x2F59
ja .chenyi_sgx_exit
cmpq	$12121, %rax            # imm = 0x2F59
jl .chenyi_sgx_exit
popq %rax
movl	$5, -4(%rbp,%rax)
popq	%rbp
.cfi_def_cfa %rsp, 8
retq
.chenyi_sgx_exit:
popq %rax
.cfi_def_cfa %rbp, 16
movl $1, %edi
callq exit
.Lfunc_end0:
.size	enclave_main, .Lfunc_end0-enclave_main
.cfi_endproc
# -- End function

.ident	"clang version 3.8.0-2ubuntu4 (tags/RELEASE_380/final)"
