/*
 * lg1_api.c
 *
 * Code generation for function 'lg1_api'
 *
 * C source code generated on: Mon Mar  3 12:17:58 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "lg1.h"
#include "lg1_api.h"

/* Type Definitions */
#ifndef typedef_ResolvedFunctionInfo
#define typedef_ResolvedFunctionInfo

typedef struct {
  const char * context;
  const char * name;
  const char * dominantType;
  const char * resolved;
  uint32_T fileTimeLo;
  uint32_T fileTimeHi;
  uint32_T mFileTimeLo;
  uint32_T mFileTimeHi;
} ResolvedFunctionInfo;

#endif                                 /*typedef_ResolvedFunctionInfo*/

/* Function Declarations */
static real_T b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId);
static real_T c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId);
static real_T emlrt_marshallIn(const mxArray *scale, const char_T *identifier);

/* Function Definitions */
static real_T b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId)
{
  real_T y;
  y = c_emlrt_marshallIn(emlrtAlias(u), parentId);
  emlrtDestroyArray(&u);
  return y;
}

static real_T c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId)
{
  real_T ret;
  emlrtCheckBuiltInR2012b(emlrtRootTLSGlobal, msgId, src, "double", FALSE, 0U, 0);
  ret = *(real_T *)mxGetData(src);
  emlrtDestroyArray(&src);
  return ret;
}

static real_T emlrt_marshallIn(const mxArray *scale, const char_T *identifier)
{
  real_T y;
  emlrtMsgIdentifier thisId;
  thisId.fIdentifier = identifier;
  thisId.fParent = NULL;
  y = b_emlrt_marshallIn(emlrtAlias(scale), &thisId);
  emlrtDestroyArray(&scale);
  return y;
}

const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  ResolvedFunctionInfo info[1];
  ResolvedFunctionInfo (*b_info)[1];
  ResolvedFunctionInfo u[1];
  const mxArray *y;
  int32_T iv0[1];
  ResolvedFunctionInfo *r0;
  const char * b_u;
  const mxArray *b_y;
  const mxArray *m0;
  const mxArray *c_y;
  const mxArray *d_y;
  const mxArray *e_y;
  uint32_T c_u;
  const mxArray *f_y;
  const mxArray *g_y;
  const mxArray *h_y;
  const mxArray *i_y;
  nameCaptureInfo = NULL;
  b_info = (ResolvedFunctionInfo (*)[1])info;
  (*b_info)[0].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/lg1.m";
  (*b_info)[0].name = "mtimes";
  (*b_info)[0].dominantType = "double";
  (*b_info)[0].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mtimes.m";
  (*b_info)[0].fileTimeLo = 1289541292U;
  (*b_info)[0].fileTimeHi = 0U;
  (*b_info)[0].mFileTimeLo = 0U;
  (*b_info)[0].mFileTimeHi = 0U;
  u[0] = info[0];
  y = NULL;
  iv0[0] = 1;
  emlrtAssign(&y, mxCreateStructArray(1, iv0, 0, NULL));
  r0 = &u[0];
  b_u = r0->context;
  b_y = NULL;
  m0 = mxCreateString(b_u);
  emlrtAssign(&b_y, m0);
  emlrtAddField(y, b_y, "context", 0);
  b_u = r0->name;
  c_y = NULL;
  m0 = mxCreateString(b_u);
  emlrtAssign(&c_y, m0);
  emlrtAddField(y, c_y, "name", 0);
  b_u = r0->dominantType;
  d_y = NULL;
  m0 = mxCreateString(b_u);
  emlrtAssign(&d_y, m0);
  emlrtAddField(y, d_y, "dominantType", 0);
  b_u = r0->resolved;
  e_y = NULL;
  m0 = mxCreateString(b_u);
  emlrtAssign(&e_y, m0);
  emlrtAddField(y, e_y, "resolved", 0);
  c_u = r0->fileTimeLo;
  f_y = NULL;
  m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
  *(uint32_T *)mxGetData(m0) = c_u;
  emlrtAssign(&f_y, m0);
  emlrtAddField(y, f_y, "fileTimeLo", 0);
  c_u = r0->fileTimeHi;
  g_y = NULL;
  m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
  *(uint32_T *)mxGetData(m0) = c_u;
  emlrtAssign(&g_y, m0);
  emlrtAddField(y, g_y, "fileTimeHi", 0);
  c_u = r0->mFileTimeLo;
  h_y = NULL;
  m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
  *(uint32_T *)mxGetData(m0) = c_u;
  emlrtAssign(&h_y, m0);
  emlrtAddField(y, h_y, "mFileTimeLo", 0);
  c_u = r0->mFileTimeHi;
  i_y = NULL;
  m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
  *(uint32_T *)mxGetData(m0) = c_u;
  emlrtAssign(&i_y, m0);
  emlrtAddField(y, i_y, "mFileTimeHi", 0);
  emlrtAssign(&nameCaptureInfo, y);
  emlrtNameCapturePostProcessR2012a(emlrtAlias(nameCaptureInfo));
  return nameCaptureInfo;
}

void lg1_api(const mxArray * const prhs[1])
{
  real_T scale;

  /* Marshall function inputs */
  scale = emlrt_marshallIn(emlrtAliasP(prhs[0]), "scale");

  /* Invoke the target function */
  lg1(scale);
}

/* End of code generation (lg1_api.c) */
