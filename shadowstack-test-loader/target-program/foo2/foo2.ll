; ModuleID = '/home/weijliu/elf-respect/ShadowStackCFI/foo2.c'
source_filename = "/home/weijliu/elf-respect/ShadowStackCFI/foo2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [29 x i8] c"----------1 in fun----------\00", align 1
@.str.1 = private unnamed_addr constant [33 x i8] c"----------1 in my_itoa----------\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"----------2 in my_itoa----------\00", align 1
@.str.3 = private unnamed_addr constant [22 x i8] c"----------1----------\00", align 1
@.str.4 = private unnamed_addr constant [22 x i8] c"----------2----------\00", align 1
@.str.5 = private unnamed_addr constant [22 x i8] c"----------3----------\00", align 1
@.str.6 = private unnamed_addr constant [22 x i8] c"----------4----------\00", align 1
@.str.7 = private unnamed_addr constant [9 x i8] c"success!\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local i32 @fun() #0 {
entry:
  %call = call i32 @puts(i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i64 0, i64 0))
  ret i32 1
}

declare dso_local i32 @puts(i8*) #1

; Function Attrs: noinline nounwind optnone
define dso_local i8* @my_itoa(i32 %val, i8* %buf, i32 %radix) #0 {
entry:
  %val.addr = alloca i32, align 4
  %buf.addr = alloca i8*, align 8
  %radix.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %firstdig = alloca i8*, align 8
  %temp = alloca i8, align 1
  %digval = alloca i32, align 4
  store i32 %val, i32* %val.addr, align 4
  store i8* %buf, i8** %buf.addr, align 8
  store i32 %radix, i32* %radix.addr, align 4
  %call = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.1, i64 0, i64 0))
  %0 = load i8*, i8** %buf.addr, align 8
  store i8* %0, i8** %p, align 8
  %1 = load i32, i32* %val.addr, align 4
  %cmp = icmp slt i32 %1, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load i8*, i8** %p, align 8
  %incdec.ptr = getelementptr inbounds i8, i8* %2, i32 1
  store i8* %incdec.ptr, i8** %p, align 8
  store i8 45, i8* %2, align 1
  %3 = load i32, i32* %val.addr, align 4
  %conv = sext i32 %3 to i64
  %sub = sub nsw i64 0, %conv
  %conv1 = trunc i64 %sub to i32
  store i32 %conv1, i32* %val.addr, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %4 = load i8*, i8** %p, align 8
  store i8* %4, i8** %firstdig, align 8
  %call2 = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0))
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end
  %5 = load i32, i32* %val.addr, align 4
  %6 = load i32, i32* %radix.addr, align 4
  %rem = urem i32 %5, %6
  store i32 %rem, i32* %digval, align 4
  %7 = load i32, i32* %radix.addr, align 4
  %8 = load i32, i32* %val.addr, align 4
  %div = udiv i32 %8, %7
  store i32 %div, i32* %val.addr, align 4
  %9 = load i32, i32* %digval, align 4
  %cmp3 = icmp ugt i32 %9, 9
  br i1 %cmp3, label %if.then5, label %if.else

if.then5:                                         ; preds = %do.body
  %10 = load i32, i32* %digval, align 4
  %sub6 = sub i32 %10, 10
  %add = add i32 %sub6, 97
  %conv7 = trunc i32 %add to i8
  %11 = load i8*, i8** %p, align 8
  %incdec.ptr8 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %incdec.ptr8, i8** %p, align 8
  store i8 %conv7, i8* %11, align 1
  br label %if.end12

if.else:                                          ; preds = %do.body
  %12 = load i32, i32* %digval, align 4
  %add9 = add i32 %12, 48
  %conv10 = trunc i32 %add9 to i8
  %13 = load i8*, i8** %p, align 8
  %incdec.ptr11 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %incdec.ptr11, i8** %p, align 8
  store i8 %conv10, i8* %13, align 1
  br label %if.end12

if.end12:                                         ; preds = %if.else, %if.then5
  br label %do.cond

do.cond:                                          ; preds = %if.end12
  %14 = load i32, i32* %val.addr, align 4
  %cmp13 = icmp sgt i32 %14, 0
  br i1 %cmp13, label %do.body, label %do.end

do.end:                                           ; preds = %do.cond
  %15 = load i8*, i8** %p, align 8
  %incdec.ptr15 = getelementptr inbounds i8, i8* %15, i32 -1
  store i8* %incdec.ptr15, i8** %p, align 8
  store i8 32, i8* %15, align 1
  br label %do.body16

do.body16:                                        ; preds = %do.cond19, %do.end
  %16 = load i8*, i8** %p, align 8
  %17 = load i8, i8* %16, align 1
  store i8 %17, i8* %temp, align 1
  %18 = load i8*, i8** %firstdig, align 8
  %19 = load i8, i8* %18, align 1
  %20 = load i8*, i8** %p, align 8
  store i8 %19, i8* %20, align 1
  %21 = load i8, i8* %temp, align 1
  %22 = load i8*, i8** %firstdig, align 8
  store i8 %21, i8* %22, align 1
  %23 = load i8*, i8** %p, align 8
  %incdec.ptr17 = getelementptr inbounds i8, i8* %23, i32 -1
  store i8* %incdec.ptr17, i8** %p, align 8
  %24 = load i8*, i8** %firstdig, align 8
  %incdec.ptr18 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %incdec.ptr18, i8** %firstdig, align 8
  br label %do.cond19

do.cond19:                                        ; preds = %do.body16
  %25 = load i8*, i8** %firstdig, align 8
  %26 = load i8*, i8** %p, align 8
  %cmp20 = icmp ult i8* %25, %26
  br i1 %cmp20, label %do.body16, label %do.end22

do.end22:                                         ; preds = %do.cond19
  %27 = load i8*, i8** %buf.addr, align 8
  ret i8* %27
}

; Function Attrs: noinline nounwind optnone
define dso_local void @enclave_main() #0 {
entry:
  %fp = alloca i32 ()*, align 8
  %b = alloca i32, align 4
  %i_b = alloca [8 x i8], align 1
  %ii_b = alloca i8*, align 8
  store i32 ()* @fun, i32 ()** %fp, align 8
  %call = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.3, i64 0, i64 0))
  %0 = load i32 ()*, i32 ()** %fp, align 8
  %call1 = call i32 %0()
  store i32 %call1, i32* %b, align 4
  %call2 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.4, i64 0, i64 0))
  %1 = bitcast [8 x i8]* %i_b to i8*
  store i8* %1, i8** %ii_b, align 8
  %call3 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.5, i64 0, i64 0))
  %2 = load i32, i32* %b, align 4
  %3 = load i8*, i8** %ii_b, align 8
  %call4 = call i8* @my_itoa(i32 %2, i8* %3, i32 10)
  store i8* %call4, i8** %ii_b, align 8
  %call5 = call i32 @puts(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.6, i64 0, i64 0))
  %4 = load i8*, i8** %ii_b, align 8
  %call6 = call i32 @puts(i8* %4)
  %call7 = call i32 @puts(i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.7, i64 0, i64 0))
  call void @exit(i32 0) #3
  unreachable
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32) #2

attributes #0 = { noinline nounwind optnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 9.0.0 (https://github.com/StanPlatinum/llvm-project.git 2355ea5e1501a28533d63027bf034ce84307357d)"}
