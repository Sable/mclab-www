/*
 * drv_lgdr_initialize.c
 *
 * Code generation for function 'drv_lgdr_initialize'
 *
 * C source code generated on: Mon Mar  3 05:15:50 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "drv_lgdr.h"
#include "drv_lgdr_initialize.h"
#include "drv_lgdr_data.h"

/* Function Definitions */
void drv_lgdr_initialize(emlrtContext *aContext)
{
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, aContext, NULL, 1);
  emlrtClearAllocCountR2012b(emlrtRootTLSGlobal, FALSE, 0U, 0);
  emlrtEnterRtStackR2012b(emlrtRootTLSGlobal);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (drv_lgdr_initialize.c) */
