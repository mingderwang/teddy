/*
 *  ComAirAPI.h
 *  ComAir API V1.0.5
 *
 *  Created by Generalplus SA1 on 2011/5/12.
 *  Copyright 2011 GeneralPlus. All rights reserved.
 *
 */

#ifndef _COMAIRAPI_H
#define _COMAIRAPI_H
#include <MacTypes.h>

#if defined(__cplusplus)
extern "C" {
#endif
//--------------------------------------------------	
//Error code	
//--------------------------------------------------	
#define		COMAIR_NOERR					0
#define		COMAIR_AUIDOUINTFAILED			1
#define		COMAIR_ENABLEIORECFAILED		2
#define		COMAIR_SETFORMATFAILED			3
#define		COMAIR_SETRECCALLBACKFAILED		4
#define		COMAIR_ALLOCBUFFAILED			5
#define		COMAIR_AUDIONOTINIT				6
#define		COMAIR_UNSUPPORTMODE			7
#define		COMAIR_UNSUPPORTTHRESHOLD		8
#define		COMAIR_SETREGCODEFAILED			9	
#define		COMAIR_PLAYCOMAIRSOUNDFAILED	10		
//--------------------------------------------------	
//Defines	
//--------------------------------------------------		
typedef enum 
{
	eDecodeMode_1Sec	=1,		//1		second
	eDecodeMode_05Sec	=2,		//0.5	second
	eDecodeMode_025Sec	=3		//0.25	second
		
}eAudioDecodeMode;
	
typedef enum 
{
    eEncodeMode_1Sec	=24,	//1		second
    eEncodeMode_05Sec	=48,	//0.5	second
    eEncodeMode_025Sec	=96		//0.25	second
		
}eAudioEncodeMode;    
    
    
typedef int (*PFN_UserCallBack) (int i32Commnad);	
typedef int (*PFN_UserRawDataCallBack) (unsigned char* pbyRawData,int i32Size);	
	
	
#define		COMAIR_MAXTHRESHOLD		    128
#define		COMAIR_MINTHRESHOLD		    2	
	
//-------------------------------------------------	
//Functions	
//-------------------------------------------------	
	
	
int		InitComAirAudio();
int		UnitComAirAudio();	
	
int		StartComAirDecode();
int		StopComAirDecode();
	
	
int		SetComAirDecodeMode(eAudioDecodeMode eMode);
	
eAudioDecodeMode	GetComAirDecodeMode();	
	
int		SetComAirEecodeMode(eAudioEncodeMode eMode);
eAudioEncodeMode	GetComAirEecodeMode();	    
    
int		SetRegCode(UInt8 *pbyRegCode); 
	
int     SetCentralFreq(int i32Freq);
int     GetCentralFreq();

int		SetComAirThreshold(int i32Threshold);
int		GetComAirThreshold();
	
int		SetComAirUserCallBack(PFN_UserCallBack pfnUserCallBack);
int		SetComAirUserRawDataCallBack(PFN_UserRawDataCallBack pfnUserCallBack);
	
int		PlaySoundWithComAirCmd(NSURL *fileURL,Float32 SoundVolume,int i32command);	
int		PlayComAirCmd(int i32command);	
	
#if defined(__cplusplus)
}
#endif

#endif