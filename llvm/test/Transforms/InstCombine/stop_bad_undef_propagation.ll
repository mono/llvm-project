; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt < %s -instcombine -S | FileCheck %s

; For each of the div/rem integer instructions we test 3 different variants for
; how an undef value could be back propagated:
; 0) back propagation because of an undef shuffle vector mask
; 1) back propagation because of an undef value selected from RHS
; 2) back propagation because of an undef value selected from LHS

define <3 x float> @udiv0(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @udiv0(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = udiv <2 x i32> %t1, <i32 255, i32 255>
  %t3 = uitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 undef>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @udiv1(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @udiv1(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = udiv <2 x i32> %t1, <i32 255, i32 255>
  %t3 = uitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @udiv2(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @udiv2(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = udiv <2 x i32> %t1, <i32 255, i32 255>
  %t3 = uitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> undef, <2 x float> %t3, <3 x i32> <i32 2, i32 3, i32 0>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @sdiv0(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @sdiv0(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = sdiv <2 x i32> %t1, <i32 255, i32 255>
  %t3 = sitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 undef>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @sdiv1(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @sdiv1(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = sdiv <2 x i32> %t1, <i32 255, i32 255>
  %t3 = sitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @sdiv2(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @sdiv2(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = sdiv <2 x i32> %t1, <i32 255, i32 255>
  %t3 = sitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> undef, <2 x float> %t3, <3 x i32> <i32 2, i32 3, i32 0>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @urem0(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @urem0(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = urem <2 x i32> %t1, <i32 255, i32 255>
  %t3 = uitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 undef>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @urem1(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @urem1(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = urem <2 x i32> %t1, <i32 255, i32 255>
  %t3 = uitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @urem2(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @urem2(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = urem <2 x i32> %t1, <i32 255, i32 255>
  %t3 = uitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> undef, <2 x float> %t3, <3 x i32> <i32 2, i32 3, i32 0>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @srem0(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @srem0(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = srem <2 x i32> %t1, <i32 255, i32 255>
  %t3 = sitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 undef>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @srem1(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @srem1(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = srem <2 x i32> %t1, <i32 255, i32 255>
  %t3 = sitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> %t3, <2 x float> undef, <3 x i32> <i32 0, i32 1, i32 2>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}

define <3 x float> @srem2(<3 x float> %x, i32 %y, i32 %z) {
; CHECK-LABEL: @srem2(
; CHECK-NEXT:    [[T5:%.*]] = shufflevector <3 x float> [[X:%.*]], <3 x float> <float 0.000000e+00, float 0.000000e+00, float undef>, <3 x i32> <i32 0, i32 3, i32 4>
; CHECK-NEXT:    [[T6:%.*]] = fmul <3 x float> [[T5]], [[X]]
; CHECK-NEXT:    ret <3 x float> [[T6]]
;
  %t0 = insertelement <2 x i32> undef, i32 %y, i32 0
  %t1 = insertelement <2 x i32> %t0, i32 %z, i32 1
  %t2 = srem <2 x i32> %t1, <i32 255, i32 255>
  %t3 = sitofp <2 x i32> %t2 to <2 x float>
  %t4 = shufflevector <2 x float> undef, <2 x float> %t3, <3 x i32> <i32 2, i32 3, i32 0>
  %t5 = shufflevector <3 x float> %x, <3 x float> %t4, <3 x i32> <i32 0, i32 3, i32 4>
  %t6 = fmul <3 x float> %x, %t5
  ret <3 x float> %t6
}