# this file is generated by lib/gen_ocall_stub.py script
.text
.global gettimeofday
.type gettimeofday, @function
.p2align 5
gettimeofday:
    mov $5, %r15
    jmp sgx_ocall
