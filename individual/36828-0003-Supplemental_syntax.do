/*-------------------------------------------------------------------------*
 |                                                                         
 |            STATA SUPPLEMENTAL SYNTAX FILE FOR ICPSR 36828
 |               NATIONAL CRIME VICTIMIZATION SURVEY, 2016
 |                (DATASET 0003: PERSON RECORD-TYPE FILE)
 |
 |
 | This Stata missing value recode program is provided for optional use with
 | the Stata system version of this data file as distributed by ICPSR.
 | The program replaces user-defined numeric missing values (e.g., -9)
 | with generic system missing "."  Note that Stata allows you to specify
 | up to 27 unique missing value codes.  Only variables with user-defined
 | missing values are included in this program.
 |
 | To apply the missing value recodes, users need to first open the
 | Stata data file on their system, apply the missing value recodes if
 | desired, then save a new copy of the data file with the missing values
 | applied.  Users are strongly advised to use a different filename when
 | saving the new file.
 |
 *------------------------------------------------------------------------*/

replace V3010 = . if (V3010 == 99)
replace V3011 = . if (V3011 == 9)
replace V3012 = . if (V3012 == 99)
replace V3013 = . if (V3013 == 99)
replace V3014 = . if (V3014 == 99)
replace V3015 = . if (V3015 == 9)
replace V3016 = . if (V3016 == 9)
replace V3017 = . if (V3017 == 9)
replace V3018 = . if (V3018 == 9)
replace V3019 = . if (V3019 == 9)
replace V3020 = . if (V3020 == 99)
replace V3023A = . if (V3023A == -1 | V3023A == 99)
replace V3024 = . if (V3024 == 9)
replace V3024A = . if (V3024A == -1 | V3024A == 9)
replace V3025 = . if (V3025 == 99)
replace V3026 = . if (V3026 == 99)
replace V3027 = . if (V3027 == 9999)
replace V3031 = . if (V3031 == 99)
replace V3032 = . if (V3032 == 99)
replace V3033 = . if (V3033 == 99)
replace V3034 = . if (V3034 == 9)
replace V3035 = . if (V3035 == 999)
replace V3036 = . if (V3036 == 9)
replace V3037 = . if (V3037 == 999)
replace V3038 = . if (V3038 == 9)
replace V3039 = . if (V3039 == 999)
replace V3040 = . if (V3040 == 9)
replace V3041 = . if (V3041 == 999)
replace V3042 = . if (V3042 == 9)
replace V3043 = . if (V3043 == 999)
replace V3044 = . if (V3044 == 9)
replace V3045 = . if (V3045 == 999)
replace V3046 = . if (V3046 == 9)
replace V3047 = . if (V3047 == 999)
replace V3048 = . if (V3048 == 9)
replace V3049 = . if (V3049 == 99)
replace V3050 = . if (V3050 == 99)
replace V3051 = . if (V3051 == 99)
replace V3052 = . if (V3052 == 9)
replace V3053 = . if (V3053 == 999)
replace V3054 = . if (V3054 == 9)
replace V3055 = . if (V3055 == 99)
replace V3056 = . if (V3056 == 99)
replace V3057 = . if (V3057 == 99)
replace V3058 = . if (V3058 == 9)
replace V3059 = . if (V3059 == 999)
replace V3060 = . if (V3060 == 9)
replace V3061 = . if (V3061 == 9)
replace V3062 = . if (V3062 == 9)
replace V3063 = . if (V3063 == 9)
replace V3064 = . if (V3064 == 9)
replace V3065 = . if (V3065 == 9)
replace V3066 = . if (V3066 == 9)
replace V3067 = . if (V3067 == 9)
replace V3068 = . if (V3068 == 9)
replace V3069 = . if (V3069 == 9)
replace V3070 = . if (V3070 == 9)
replace V3_V4526H3A = . if (V3_V4526H3A == -1 | V3_V4526H3A == 9)
replace V3_V4526H3B = . if (V3_V4526H3B == -1 | V3_V4526H3B == 9)
replace V3_V4526H5 = . if (V3_V4526H5 == -1 | V3_V4526H5 == 9)
replace V3_V4526H4 = . if (V3_V4526H4 == -1 | V3_V4526H4 == 9)
replace V3_V4526H6 = . if (V3_V4526H6 == -1 | V3_V4526H6 == 9)
replace V3_V4526H7 = . if (V3_V4526H7 == -1 | V3_V4526H7 == 9)
replace V3071 = . if (V3071 == 9)
replace V3072 = . if (V3072 == 9)
replace V3073 = . if (V3073 == 9)
replace V3074 = . if (V3074 == 99)
replace V3075 = . if (V3075 == 9)
replace V3076 = . if (V3076 == 9)
replace V3078 = . if (V3078 == 9)
replace V3079 = . if (V3079 == 9)
replace V3081 = . if (V3081 == 99)
replace V3082 = . if (V3082 == -1)
replace PER_TIS = . if (PER_TIS == -1)
replace PERINTVNUM = . if (PERINTVNUM == -1)
replace PINTTYPE_TIS1 = . if (PINTTYPE_TIS1 == 9 | PINTTYPE_TIS1 == -1)
replace PINTTYPE_TIS2 = . if (PINTTYPE_TIS2 == 9 | PINTTYPE_TIS2 == -1)
replace PINTTYPE_TIS3 = . if (PINTTYPE_TIS3 == 9 | PINTTYPE_TIS3 == -1)
replace PINTTYPE_TIS4 = . if (PINTTYPE_TIS4 == 9 | PINTTYPE_TIS4 == -1)
replace PINTTYPE_TIS5 = . if (PINTTYPE_TIS5 == 9 | PINTTYPE_TIS5 == -1)
replace PINTTYPE_TIS6 = . if (PINTTYPE_TIS6 == 9 | PINTTYPE_TIS6 == -1)
replace PINTTYPE_TIS7 = . if (PINTTYPE_TIS7 == 9 | PINTTYPE_TIS7 == -1)
replace PERBOUNDED = . if (PERBOUNDED == -1)


