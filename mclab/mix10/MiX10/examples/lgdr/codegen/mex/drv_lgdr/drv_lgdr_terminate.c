/*
 * drv_lgdr_terminate.c
 *
 * Code generation for function 'drv_lgdr_terminate'
 *
 * C source code generated on: Mon Mar  3 05:15:50 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "drv_lgdr.h"
#include "drv_lgdr_terminate.h"

/* Function Definitions */
void drv_lgdr_atexit(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void drv_lgdr_terminate(void)
{
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (drv_lgdr_terminate.c) */
