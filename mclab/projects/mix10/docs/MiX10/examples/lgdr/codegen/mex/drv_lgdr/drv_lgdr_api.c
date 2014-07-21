/*
 * drv_lgdr_api.c
 *
 * Code generation for function 'drv_lgdr_api'
 *
 * C source code generated on: Mon Mar  3 05:15:50 2014
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "drv_lgdr.h"
#include "drv_lgdr_api.h"

/* Function Declarations */
static real_T b_emlrt_marshallIn(const mxArray *u, const emlrtMsgIdentifier
  *parentId);
static real_T c_emlrt_marshallIn(const mxArray *src, const emlrtMsgIdentifier
  *msgId);
static real_T emlrt_marshallIn(const mxArray *scale, const char_T *identifier);
static void info_helper(ResolvedFunctionInfo info[20]);

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

static void info_helper(ResolvedFunctionInfo info[20])
{
  info[0].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m";
  info[0].name = "PN_Legendre_vectN";
  info[0].dominantType = "double";
  info[0].resolved =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PN_Legendre_vectN.m";
  info[0].fileTimeLo = 1392077750U;
  info[0].fileTimeHi = 0U;
  info[0].mFileTimeLo = 0U;
  info[0].mFileTimeHi = 0U;
  info[1].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PN_Legendre_vectN.m";
  info[1].name = "length";
  info[1].dominantType = "double";
  info[1].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/length.m";
  info[1].fileTimeLo = 1303167806U;
  info[1].fileTimeHi = 0U;
  info[1].mFileTimeLo = 0U;
  info[1].mFileTimeHi = 0U;
  info[2].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PN_Legendre_vectN.m";
  info[2].name = "mrdivide";
  info[2].dominantType = "double";
  info[2].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p";
  info[2].fileTimeLo = 1357973148U;
  info[2].fileTimeHi = 0U;
  info[2].mFileTimeLo = 1319751566U;
  info[2].mFileTimeHi = 0U;
  info[3].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p";
  info[3].name = "rdivide";
  info[3].dominantType = "double";
  info[3].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m";
  info[3].fileTimeLo = 1346531988U;
  info[3].fileTimeHi = 0U;
  info[3].mFileTimeLo = 0U;
  info[3].mFileTimeHi = 0U;
  info[4].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m";
  info[4].name = "eml_scalexp_compatible";
  info[4].dominantType = "double";
  info[4].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_scalexp_compatible.m";
  info[4].fileTimeLo = 1286840396U;
  info[4].fileTimeHi = 0U;
  info[4].mFileTimeLo = 0U;
  info[4].mFileTimeHi = 0U;
  info[5].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/rdivide.m";
  info[5].name = "eml_div";
  info[5].dominantType = "double";
  info[5].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_div.m";
  info[5].fileTimeLo = 1313369410U;
  info[5].fileTimeHi = 0U;
  info[5].mFileTimeLo = 0U;
  info[5].mFileTimeHi = 0U;
  info[6].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PN_Legendre_vectN.m";
  info[6].name = "mtimes";
  info[6].dominantType = "double";
  info[6].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mtimes.m";
  info[6].fileTimeLo = 1289541292U;
  info[6].fileTimeHi = 0U;
  info[6].mFileTimeLo = 0U;
  info[6].mFileTimeHi = 0U;
  info[7].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PN_Legendre_vectN.m";
  info[7].name = "sqrt";
  info[7].dominantType = "double";
  info[7].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/sqrt.m";
  info[7].fileTimeLo = 1343851986U;
  info[7].fileTimeHi = 0U;
  info[7].mFileTimeLo = 0U;
  info[7].mFileTimeHi = 0U;
  info[8].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/sqrt.m";
  info[8].name = "eml_error";
  info[8].dominantType = "char";
  info[8].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/eml/eml_error.m";
  info[8].fileTimeLo = 1343851958U;
  info[8].fileTimeHi = 0U;
  info[8].mFileTimeLo = 0U;
  info[8].mFileTimeHi = 0U;
  info[9].context = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/sqrt.m";
  info[9].name = "eml_scalar_sqrt";
  info[9].dominantType = "double";
  info[9].resolved =
    "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/eml_scalar_sqrt.m";
  info[9].fileTimeLo = 1286840338U;
  info[9].fileTimeHi = 0U;
  info[9].mFileTimeLo = 0U;
  info[9].mFileTimeHi = 0U;
  info[10].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m";
  info[10].name = "PNx_Legendre_vectN";
  info[10].dominantType = "double";
  info[10].resolved =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNx_Legendre_vectN.m";
  info[10].fileTimeLo = 1392077750U;
  info[10].fileTimeHi = 0U;
  info[10].mFileTimeLo = 0U;
  info[10].mFileTimeHi = 0U;
  info[11].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNx_Legendre_vectN.m";
  info[11].name = "length";
  info[11].dominantType = "double";
  info[11].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/length.m";
  info[11].fileTimeLo = 1303167806U;
  info[11].fileTimeHi = 0U;
  info[11].mFileTimeLo = 0U;
  info[11].mFileTimeHi = 0U;
  info[12].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNx_Legendre_vectN.m";
  info[12].name = "mtimes";
  info[12].dominantType = "double";
  info[12].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mtimes.m";
  info[12].fileTimeLo = 1289541292U;
  info[12].fileTimeHi = 0U;
  info[12].mFileTimeLo = 0U;
  info[12].mFileTimeHi = 0U;
  info[13].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNx_Legendre_vectN.m";
  info[13].name = "mrdivide";
  info[13].dominantType = "double";
  info[13].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p";
  info[13].fileTimeLo = 1357973148U;
  info[13].fileTimeHi = 0U;
  info[13].mFileTimeLo = 1319751566U;
  info[13].mFileTimeHi = 0U;
  info[14].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNx_Legendre_vectN.m";
  info[14].name = "sqrt";
  info[14].dominantType = "double";
  info[14].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/sqrt.m";
  info[14].fileTimeLo = 1343851986U;
  info[14].fileTimeHi = 0U;
  info[14].mFileTimeLo = 0U;
  info[14].mFileTimeHi = 0U;
  info[15].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/drv_lgdr.m";
  info[15].name = "PNxx_Legendre_vectN";
  info[15].dominantType = "double";
  info[15].resolved =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNxx_Legendre_vectN.m";
  info[15].fileTimeLo = 1392077750U;
  info[15].fileTimeHi = 0U;
  info[15].mFileTimeLo = 0U;
  info[15].mFileTimeHi = 0U;
  info[16].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNxx_Legendre_vectN.m";
  info[16].name = "length";
  info[16].dominantType = "double";
  info[16].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elmat/length.m";
  info[16].fileTimeLo = 1303167806U;
  info[16].fileTimeHi = 0U;
  info[16].mFileTimeLo = 0U;
  info[16].mFileTimeHi = 0U;
  info[17].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNxx_Legendre_vectN.m";
  info[17].name = "mtimes";
  info[17].dominantType = "double";
  info[17].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mtimes.m";
  info[17].fileTimeLo = 1289541292U;
  info[17].fileTimeHi = 0U;
  info[17].mFileTimeLo = 0U;
  info[17].mFileTimeHi = 0U;
  info[18].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNxx_Legendre_vectN.m";
  info[18].name = "mrdivide";
  info[18].dominantType = "double";
  info[18].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/ops/mrdivide.p";
  info[18].fileTimeLo = 1357973148U;
  info[18].fileTimeHi = 0U;
  info[18].mFileTimeLo = 1319751566U;
  info[18].mFileTimeHi = 0U;
  info[19].context =
    "[E]/home/sable/vkumar5/mclab/Benchmarks/new-benchmarks/lgdr/PNxx_Legendre_vectN.m";
  info[19].name = "sqrt";
  info[19].dominantType = "double";
  info[19].resolved = "[ILXE]$matlabroot$/toolbox/eml/lib/matlab/elfun/sqrt.m";
  info[19].fileTimeLo = 1343851986U;
  info[19].fileTimeHi = 0U;
  info[19].mFileTimeLo = 0U;
  info[19].mFileTimeHi = 0U;
}

void drv_lgdr_api(const mxArray * const prhs[1])
{
  real_T scale;

  /* Marshall function inputs */
  scale = emlrt_marshallIn(emlrtAliasP(prhs[0]), "scale");

  /* Invoke the target function */
  drv_lgdr(scale);
}

const mxArray *emlrtMexFcnResolvedFunctionsInfo(void)
{
  const mxArray *nameCaptureInfo;
  ResolvedFunctionInfo info[20];
  ResolvedFunctionInfo u[20];
  int32_T i;
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
  info_helper(info);
  for (i = 0; i < 20; i++) {
    u[i] = info[i];
  }

  y = NULL;
  iv0[0] = 20;
  emlrtAssign(&y, mxCreateStructArray(1, iv0, 0, NULL));
  for (i = 0; i < 20; i++) {
    r0 = &u[i];
    b_u = r0->context;
    b_y = NULL;
    m0 = mxCreateString(b_u);
    emlrtAssign(&b_y, m0);
    emlrtAddField(y, b_y, "context", i);
    b_u = r0->name;
    c_y = NULL;
    m0 = mxCreateString(b_u);
    emlrtAssign(&c_y, m0);
    emlrtAddField(y, c_y, "name", i);
    b_u = r0->dominantType;
    d_y = NULL;
    m0 = mxCreateString(b_u);
    emlrtAssign(&d_y, m0);
    emlrtAddField(y, d_y, "dominantType", i);
    b_u = r0->resolved;
    e_y = NULL;
    m0 = mxCreateString(b_u);
    emlrtAssign(&e_y, m0);
    emlrtAddField(y, e_y, "resolved", i);
    c_u = r0->fileTimeLo;
    f_y = NULL;
    m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
    *(uint32_T *)mxGetData(m0) = c_u;
    emlrtAssign(&f_y, m0);
    emlrtAddField(y, f_y, "fileTimeLo", i);
    c_u = r0->fileTimeHi;
    g_y = NULL;
    m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
    *(uint32_T *)mxGetData(m0) = c_u;
    emlrtAssign(&g_y, m0);
    emlrtAddField(y, g_y, "fileTimeHi", i);
    c_u = r0->mFileTimeLo;
    h_y = NULL;
    m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
    *(uint32_T *)mxGetData(m0) = c_u;
    emlrtAssign(&h_y, m0);
    emlrtAddField(y, h_y, "mFileTimeLo", i);
    c_u = r0->mFileTimeHi;
    i_y = NULL;
    m0 = mxCreateNumericMatrix(1, 1, mxUINT32_CLASS, mxREAL);
    *(uint32_T *)mxGetData(m0) = c_u;
    emlrtAssign(&i_y, m0);
    emlrtAddField(y, i_y, "mFileTimeHi", i);
  }

  emlrtAssign(&nameCaptureInfo, y);
  emlrtNameCapturePostProcessR2012a(emlrtAlias(nameCaptureInfo));
  return nameCaptureInfo;
}

/* End of code generation (drv_lgdr_api.c) */
