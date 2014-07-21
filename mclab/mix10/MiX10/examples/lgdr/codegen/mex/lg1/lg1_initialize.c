/*
 * lg1_initialize.c
 *
 * Code generation for function 'lg1_initialize'
 *
 * C source code generated on: Mon Mar  3 12:17:58 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "lg1.h"
#include "lg1_initialize.h"

/* Variable Definitions */
static const volatile char_T *emlrtBreakCheckR2012bFlagVar;

/* Function Definitions */
void lg1_initialize(emlrtContext *aContext)
{
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, aContext, NULL, 1);
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, FALSE, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (lg1_initialize.c) */
