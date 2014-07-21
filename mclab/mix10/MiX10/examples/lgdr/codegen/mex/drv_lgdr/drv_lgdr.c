/*
 * drv_lgdr.c
 *
 * Code generation for function 'drv_lgdr'
 *
 * C source code generated on: Mon Mar  3 05:15:50 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "drv_lgdr.h"
#include "drv_lgdr_data.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 8, "drv_lgdr",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m" };

static emlrtRSInfo b_emlrtRSI = { 9, "drv_lgdr",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m" };

static emlrtRSInfo c_emlrtRSI = { 10, "drv_lgdr",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m" };

static emlrtRSInfo d_emlrtRSI = { 28, "PN_Legendre_vectN",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PN_Legendre_vectN.m"
};

static emlrtRSInfo g_emlrtRSI = { 32, "PNx_Legendre_vectN",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNx_Legendre_vectN.m"
};

static emlrtRSInfo h_emlrtRSI = { 36, "PNxx_Legendre_vectN",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNxx_Legendre_vectN.m"
};

static emlrtRTEInfo emlrtRTEI = { 7, 1, "drv_lgdr",
  "/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m" };

/* Function Definitions */
void drv_lgdr(real_T scale)
{
  int32_T i;
  int32_T j;

  /* DRV_PN_LEGENDRE_VECTN Summary of this function goes here */
  /*    Detailed explanation goes here */
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, scale, mxDOUBLE_CLASS, (int32_T)scale,
    &emlrtRTEI, emlrtRootTLSGlobal);
  i = 0;
  while (i <= (int32_T)scale - 1) {
    emlrtPushRtStackR2012b(&emlrtRSI, emlrtRootTLSGlobal);

    /*  This evaluates the NORMALIZED, ORTHOGONORMAL Legendre polynomials  */
    /*  P_{n)(x) for all degrees up to and including n. x may be either  */
    /*  a scalar or a vector. */
    /*  Input:  x = scalar or vector of grid points where Legendre polynomials */
    /*              are to be evaluated. */
    /*          n = degree of highest Legendre polynomial needed. */
    /*  Output: PNa is a size(x) times (n+1) array */
    /*  Example:    */
    /*   let x = [0 0.3 0.9], n=3. Then the output will be the 3x4 array */
    /*   PNa = | P_0(x(1)=0)   P_{1}(x(1))  P_{2}(x(1))  P_{3}(x(1)) | */
    /*         | P_0(x(2)=0.3) P_{1}(x(2))  P_{2}(x(2))  P_{3}(x(2)) |  */
    /*         | P_0(x(3)=0.9) P_{1}(x(3))  P_{2}(x(3))  P_{3}(x(3)) | */
    /*  if */
    for (j = 0; j < 4; j++) {
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    /*  j */
    /*  if */
    for (j = 0; j < 6; j++) {
      emlrtPushRtStackR2012b(&d_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&d_emlrtRSI, emlrtRootTLSGlobal);
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    /*  j */
    emlrtPopRtStackR2012b(&emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&b_emlrtRSI, emlrtRootTLSGlobal);

    /*  This evaluates the FIRST DERIVATIVE of the NORMALIZED, ORTHOGONORMAL  */
    /*  Legendre polynomials P_{n)(x) for all degrees up to and including N. */
    /*  x may be either a scalar or a vector. */
    /*  Input:  x = scalar or vector of grid points where Legendre polynomials */
    /*              are to be evaluated. */
    /*          n = degree of highest Legendre polynomial needed. */
    /*  Output: PNxa is a  size(x) times (n+1) array */
    /*  Example: */
    /*   let x = [0 0.3 0.9], n=3. Then the output will be the 3x4 array */
    /*   PNxa = |dP_0/dx(x(1)=0)   dP_{1}/dx(x(1)) dP_{2}/dx(x(1)) dP_{3}/dx(x(1))| */
    /*          |dP_0/dx(x(2)=0.3) dP_{1}/dx(x(2)) dP_{2}/dx(x(2)) dP_{3}/dx(x(2))|  */
    /*          |dP_0/dx(x(3)=0.9) dP_{1}/dx(x(3)) dP_{2}/dx(x(3)) dP_{3}/dx(x(3))| */
    /*  if */
    /*  if */
    for (j = 0; j < 3; j++) {
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    /*  j */
    /*  if	 */
    for (j = 0; j < 6; j++) {
      emlrtPushRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&g_emlrtRSI, emlrtRootTLSGlobal);
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    /*  j */
    emlrtPopRtStackR2012b(&b_emlrtRSI, emlrtRootTLSGlobal);
    emlrtPushRtStackR2012b(&c_emlrtRSI, emlrtRootTLSGlobal);

    /*  This evaluates the  SECOND DERIVATIVE of the NORMALIZED, ORTHOGONORMAL  */
    /*  Legendre polynomials P_{n)(x) for all degrees up to and including N. */
    /*  x may be either a scalar or a vector */
    /*  Input:  x = scalar or vector of grid points where Legendre polynomials */
    /*              are to be evaluated. */
    /*          n = degree of highest Legendre polynomial needed. */
    /*  Output: PNxxa is a  size(x) times (n+1) array */
    /*  Example: */
    /*   let x = [0.1 0.3 ], n=3. Then the output will be the 2 x 4 array */
    /*   PNxxa= | P_{0,xx}(x(1)=0.1) P_{1,xx}(x(1)) P_{2,xx}(x(1)) P_{3,xx}(x(1))| */
    /*          | P_{0,xx}(x(2)=0.3) P_{1,xx}(x(2)) P_{2,xx}(x(2)) P_{3,xx}(x(2))|  */
    /*   P"_{n+3} = (1/(n+1))*{2(n+5/2)*x*P"_{n+2}-(n+4) P"_{n+1}} */
    /*  if */
    /*  if */
    /*  if */
    for (j = 0; j < 2; j++) {
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    /*  j */
    /*  if */
    for (j = 0; j < 6; j++) {
      emlrtPushRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
      emlrtPopRtStackR2012b(&h_emlrtRSI, emlrtRootTLSGlobal);
      emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
    }

    /*  j */
    emlrtPopRtStackR2012b(&c_emlrtRSI, emlrtRootTLSGlobal);
    i++;
    emlrtBreakCheckFastR2012b(emlrtBreakCheckR2012bFlagVar, emlrtRootTLSGlobal);
  }
}

/* End of code generation (drv_lgdr.c) */
