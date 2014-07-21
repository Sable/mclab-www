/*
 * lg1.c
 *
 * Code generation for function 'lg1'
 *
 * C source code generated on: Mon Mar  3 12:17:58 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "lg1.h"

/* Variable Definitions */
static emlrtRTEInfo emlrtRTEI = { 7, 1, "lg1",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/lg1.m" };

/* Function Definitions */
void lg1(real_T scale)
{
  real_T d0;

  /* DRV_PN_LEGENDRE_VECTN Summary of this function goes here */
  /*    Detailed explanation goes here */
  d0 = scale * 5.0 * 2.0;
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, d0, mxDOUBLE_CLASS, (int32_T)d0,
    &emlrtRTEI, emlrtRootTLSGlobal);
}

/* End of code generation (lg1.c) */
