/*
 * drv_lgdr_types.h
 *
 * Code generation for function 'drv_lgdr'
 *
 * C source code generated on: Mon Mar  3 05:15:50 2014
 *
 */

#ifndef __DRV_LGDR_TYPES_H__
#define __DRV_LGDR_TYPES_H__

/* Include files */
#include "rtwtypes.h"

/* Type Definitions */
#ifndef typedef_ResolvedFunctionInfo
#define typedef_ResolvedFunctionInfo
typedef struct
{
    const char * context;
    const char * name;
    const char * dominantType;
    const char * resolved;
    uint32_T fileTimeLo;
    uint32_T fileTimeHi;
    uint32_T mFileTimeLo;
    uint32_T mFileTimeHi;
} ResolvedFunctionInfo;
#endif /*typedef_ResolvedFunctionInfo*/

#endif
/* End of code generation (drv_lgdr_types.h) */
