/*
 * fuel_rate_control_types.h
 *
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * Code generation for model "fuel_rate_control".
 *
 * Model version              : 1.539
 * Simulink Coder version : 8.10 (R2016a) 10-Feb-2016
 * C source code generated on : Mon May 15 14:52:57 2017
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Specified
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#ifndef RTW_HEADER_fuel_rate_control_types_h_
#define RTW_HEADER_fuel_rate_control_types_h_
#include "rtwtypes.h"
#include "multiword_types.h"
#ifndef DEFINED_TYPEDEF_FOR_EngSensors_
#define DEFINED_TYPEDEF_FOR_EngSensors_

typedef struct {
  real32_T throttle;
  real32_T speed;
  real32_T ego;
  real32_T map;
} EngSensors;

#endif

#ifndef DEFINED_TYPEDEF_FOR_sld_FuelModes_
#define DEFINED_TYPEDEF_FOR_sld_FuelModes_

typedef enum {
  LOW = 1,                             /* Default value */
  RICH,
  DISABLED
} sld_FuelModes;

#endif

/* Forward declaration for rtModel */
typedef struct tag_RTM_fuel_rate_control_T RT_MODEL_fuel_rate_control_T;

#endif                                 /* RTW_HEADER_fuel_rate_control_types_h_ */
