#ifndef __VERSION_CTRL_H__
#define __VERSION_CTRL_H__

/* comment this line when compile for production release */
#define BETA_MODE

/*********************************************************/

/*
 * Versions Control
 * CHANGE these lines on new version release
 * after changed, re-compile programs before release
 */
// system version (app + kernel image)
#define SYS_MAJOR      1
#define SYS_MINOR      0
#define SYS_SUBMINOR   5
#define CURRENT_SYS_VERSION_NUM    ((SYS_MAJOR<<16)|\
                                    (SYS_MINOR<<8)|\
                                    SYS_SUBMINOR)
#define CURRENT_SYS_VERSION_STR    "1.0.5"

// app version (app only)
#define APP_MAJOR      0
#define APP_MINOR      2
#define APP_SUBMINOR   0
#define CURRENT_APP_VERSION_NUM    ((APP_MAJOR<<16)|\
                                    (APP_MINOR<<8)|\
                                    APP_SUBMINOR)
#define CURRENT_APP_VERSION_STR    "0.2.0"

#ifdef PLATFORM_ARM_A7
    #define DEVICE_PRODUCT_TYPE     "XXXX_V1"
    #ifdef BETA_MODE
        #define DEVICE_TYPE_STR         "VH-DEV"
        #define DEVICE_TYPE_NUM         201
    #else
        #define DEVICE_TYPE_STR         "VH-PRD"
        #define DEVICE_TYPE_NUM         202
    #endif
#else //NOT ARM_A7
    #define DEVICE_PRODUCT_TYPE     "YYYY_V1"
    #ifdef BETA_MODE
        #define DEVICE_TYPE_STR         "VC-DEV"
        #define DEVICE_TYPE_NUM         101
    #else
        #define DEVICE_TYPE_STR         "VC-PRD"
        #define DEVICE_TYPE_NUM         102
    #endif
#endif

#endif //__VERSION_CTRL_H__
