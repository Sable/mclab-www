/*
 * lg1_terminate.c
 *
 * Code generation for function 'lg1_terminate'
 *
 * C source code generated on: Mon Mar  3 12:17:58 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "lg1.h"
#include "lg1_terminate.h"

/* Function Definitions */
void lg1_atexit(void)
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void lg1_terminate(void)
{
  emlrtLeaveRtStackR2012b(emlrtRootTLSGlobal);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (lg1_terminate.c) */
