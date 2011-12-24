module deimos.mediainfo;

/* MediaInfoDLL - All info about media files, for DLL
// Copyright (C) 2002-2009 Jerome Martinez, Zen@MediaArea.net
//
// This library is free software: you can redistribute it and/or modify it
// under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// any later version.
//
// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this library. If not, see <http://www.gnu.org/licenses/>.
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//
// Public DLL interface implementation
// Wrapper for MediaInfo Library
// Please see MediaInfo.h for help
//
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*/

import core.stdc.stddef;

/** @brief Kinds of Stream */
enum MediaInfo_stream_t
{
    MediaInfo_Stream_General,
    MediaInfo_Stream_Video,
    MediaInfo_Stream_Audio,
    MediaInfo_Stream_Text,
    MediaInfo_Stream_Chapters,
    MediaInfo_Stream_Image,
    MediaInfo_Stream_Menu,
    MediaInfo_Stream_Max
}
alias MediaInfo_stream_t MediaInfo_stream_C;

/** @brief Kinds of Info */
enum MediaInfo_info_t
{
    MediaInfo_Info_Name,
    MediaInfo_Info_Text,
    MediaInfo_Info_Measure,
    MediaInfo_Info_Options,
    MediaInfo_Info_Name_Text,
    MediaInfo_Info_Measure_Text,
    MediaInfo_Info_Info,
    MediaInfo_Info_HowTo,
    MediaInfo_Info_Max
}
alias MediaInfo_info_t MediaInfo_info_C;

/** @brief Option if InfoKind = Info_Options */
enum MediaInfo_infooptions_t
{
    MediaInfo_InfoOption_ShowInInform,
    MediaInfo_InfoOption_Reserved,
    MediaInfo_InfoOption_ShowInSupported,
    MediaInfo_InfoOption_TypeOfValue,
    MediaInfo_InfoOption_Max
}
alias MediaInfo_infooptions_t MediaInfo_infooptions_C;

/** @brief File opening options */
enum MediaInfo_fileoptions_t
{
    MediaInfo_FileOption_Nothing        =0x00,
    MediaInfo_FileOption_NoRecursive    =0x01,
    MediaInfo_FileOption_CloseAll       =0x02,
    MediaInfo_FileOption_Max            =0x04
}
alias MediaInfo_fileoptions_t MediaInfo_fileoptions_C;

extern(System):

/***************************************************************************/
/*! \file MediaInfoDll.h
\brief DLL wrapper for MediaInfo.h.

DLL wrapper for MediaInfo.h \n
    Can be used for C and C++\n
    "Handle" replaces class definition
*/
/***************************************************************************/

version(UNICODE)
{
    /** @brief A 'new' MediaInfo interface, return a Handle, don't forget to delete it after using it*/
    void*              MediaInfo_New (); /*you must ALWAYS call MediaInfo_Delete(Handle) in order to free memory*/
    /** @brief A 'new' MediaInfo interface (with a quick init of useful options : "**VERSION**;**APP_NAME**;**APP_VERSION**", but without debug information, use it only if you know what you do), return a Handle, don't forget to delete it after using it*/
    void*              MediaInfo_New_Quick (const(wchar_t)* File, const(wchar_t)* Options); /*you must ALWAYS call MediaInfo_Delete(Handle) in order to free memory*/
    /** @brief Delete a MediaInfo interface*/
    void               MediaInfo_Delete (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a filename)*/
    size_t             MediaInfo_Open (void* Handle, const(wchar_t)* File);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer) */
    size_t             MediaInfo_Open_Buffer (void* Handle, const(ubyte)* Begin, size_t Begin_Size, const(ubyte)* End, size_t End_Size); /*return Handle*/
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Init) */
    size_t             MediaInfo_Open_Buffer_Init (void* Handle, ulong File_Size, ulong File_Offset);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Continue) */
    size_t             MediaInfo_Open_Buffer_Continue (void* Handle, ubyte* Buffer, size_t Buffer_Size);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Continue_GoTo_Get) */
    ulong   MediaInfo_Open_Buffer_Continue_GoTo_Get (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Finalize) */
    size_t             MediaInfo_Open_Buffer_Finalize (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Open (NextPacket) */
    size_t             MediaInfo_Open_NextPacket (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Save */
    size_t             MediaInfo_Save (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Close */
    void               MediaInfo_Close (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Inform */
    const(wchar_t)*     MediaInfo_Inform (void* Handle, size_t Reserved); /*Default : Reserved=0*/
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Get */
    const(wchar_t)*     MediaInfo_GetI (void* Handle, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, MediaInfo_info_C InfoKind); /*Default : InfoKind=Info_Text*/
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Get */
    const(wchar_t)*     MediaInfo_Get (void* Handle, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(wchar_t)* Parameter, MediaInfo_info_C InfoKind, MediaInfo_info_C SearchKind); /*Default : InfoKind=Info_Text, SearchKind=Info_Name*/
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Set */
    size_t             MediaInfo_SetI (void* Handle, const(wchar_t)* ToSet, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, const(wchar_t)* OldParameter);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Set */
    size_t             MediaInfo_Set (void* Handle, const(wchar_t)* ToSet, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(wchar_t)* Parameter, const(wchar_t)* OldParameter);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Output_Buffer_Get */
    size_t             MediaInfo_Output_Buffer_Get (void* Handle, const(wchar_t)* Value);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Output_Buffer_Get */
    size_t             MediaInfo_Output_Buffer_GetI (void* Handle, size_t Pos);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Option */
    const(wchar_t)*     MediaInfo_Option (void* Handle, const(wchar_t)* Option, const(wchar_t)* Value);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::State_Get */
    size_t             MediaInfo_State_Get (void* Handle);
    /** @brief Wrapper for MediaInfoLib::MediaInfo::Count_Get */
    size_t             MediaInfo_Count_Get (void* Handle, MediaInfo_stream_C StreamKind, size_t StreamNumber); /*Default : StreamNumber=-1*/
}
else
{
    alias MediaInfoA_New               MediaInfo_New;
    alias MediaInfoA_New_Quick         MediaInfo_New_Quick;
    alias MediaInfoA_Delete            MediaInfo_Delete;
    alias MediaInfoA_Open              MediaInfo_Open;
    alias MediaInfoA_Open_Buffer       MediaInfo_Open_Buffer;
    alias MediaInfoA_Save              MediaInfo_Save;
    alias MediaInfoA_Close             MediaInfo_Close;
    alias MediaInfoA_Inform            MediaInfo_Inform;
    alias MediaInfoA_GetI              MediaInfo_GetI;
    alias MediaInfoA_Get               MediaInfo_Get;
    alias MediaInfoA_SetI              MediaInfo_SetI;
    alias MediaInfoA_Set               MediaInfo_Set;
    alias MediaInfoA_Output_Buffer_Get MediaInfo_Output_Buffer_Get;
    alias MediaInfoA_Output_Buffer_GetI MediaInfo_Output_Buffer_GetI;
    alias MediaInfoA_Option            MediaInfo_Option;
    alias MediaInfoA_State_Get         MediaInfo_State_Get;
    alias MediaInfoA_Count_Get         MediaInfo_Count_Get;
}

/** @brief A 'new' MediaInfo interface, return a Handle, don't forget to delete it after using it*/
void*              MediaInfoA_New (); /*you must ALWAYS call MediaInfo_Delete(Handle) in order to free memory*/
/** @brief A 'new' MediaInfo interface (with a quick init of useful options : "**VERSION**;**APP_NAME**;**APP_VERSION**", but without debug information, use it only if you know what you do), return a Handle, don't forget to delete it after using it*/
void*              MediaInfoA_New_Quick (const(char)* File, const(char)* Options); /*you must ALWAYS call MediaInfo_Delete(Handle) in order to free memory*/
/** @brief Delete a MediaInfo interface*/
void               MediaInfoA_Delete (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a filename)*/
size_t             MediaInfoA_Open (void* Handle, const(char)* File); /*you must ALWAYS call MediaInfo_Close(Handle) in order to free memory*/
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer) */
size_t             MediaInfoA_Open_Buffer (void* Handle, const(ubyte)* Begin, size_t Begin_Size, const(ubyte)* End, size_t End_Size); /*return Handle*/
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Init) */
size_t             MediaInfoA_Open_Buffer_Init (void* Handle, ulong File_Size, ulong File_Offset);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Continue) */
size_t             MediaInfoA_Open_Buffer_Continue (void* Handle, ubyte* Buffer, size_t Buffer_Size);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Continue_GoTo_Get) */
ulong   MediaInfoA_Open_Buffer_Continue_GoTo_Get (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (with a buffer, Finalize) */
size_t             MediaInfoA_Open_Buffer_Finalize (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Open (NextPacket) */
size_t             MediaInfoA_Open_NextPacket (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Save */
size_t             MediaInfoA_Save (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Close */
void               MediaInfoA_Close (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Inform */
const(char)*        MediaInfoA_Inform (void* Handle, size_t Reserved); /*Default : Reserved=MediaInfo_*/
/** @brief Wrapper for MediaInfoLib::MediaInfo::Get */
const(char)*        MediaInfoA_GetI (void* Handle, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, MediaInfo_info_C InfoKind); /*Default : InfoKind=Info_Text*/
/** @brief Wrapper for MediaInfoLib::MediaInfo::Get */
const(char)*        MediaInfoA_Get (void* Handle, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(char)* Parameter, MediaInfo_info_C InfoKind, MediaInfo_info_C SearchKind); /*Default : InfoKind=Info_Text, SearchKind=Info_Name*/
/** @brief Wrapper for MediaInfoLib::MediaInfo::Set */
size_t             MediaInfoA_SetI (void* Handle, const(char)* ToSet, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, const(char)* OldParameter);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Set */
size_t             MediaInfoA_Set (void* Handle, const(char)* ToSet, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(char)* Parameter, const(char)* OldParameter);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Output_Buffer_Get */
size_t             MediaInfoA_Output_Buffer_Get (void* Handle, const(char)* Value);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Output_Buffer_Get */
size_t             MediaInfoA_Output_Buffer_GetI (void* Handle, size_t Pos);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Option */
const(char)*        MediaInfoA_Option (void* Handle, const(char)* Option, const(char)* Value);
/** @brief Wrapper for MediaInfoLib::MediaInfo::State_Get */
size_t             MediaInfoA_State_Get (void* Handle);
/** @brief Wrapper for MediaInfoLib::MediaInfo::Count_Get */
size_t             MediaInfoA_Count_Get (void* Handle, MediaInfo_stream_C StreamKind, size_t StreamNumber); /*Default : StreamNumber=-1*/


version(UNICODE)
{
    /** @brief A 'new' MediaInfoList interface, return a Handle, don't forget to delete it after using it*/
    void*              MediaInfoList_New (); /*you must ALWAYS call MediaInfoList_Delete(Handle) in order to free memory*/
    /** @brief A 'new' MediaInfoList interface (with a quick init of useful options : "**VERSION**;**APP_NAME**;**APP_VERSION**", but without debug information, use it only if you know what you do), return a Handle, don't forget to delete it after using it*/
    void*              MediaInfoList_New_Quick (const(wchar_t)* Files, const(wchar_t)* Config); /*you must ALWAYS call MediaInfoList_Delete(Handle) in order to free memory*/
    /** @brief Delete a MediaInfoList interface*/
    void               MediaInfoList_Delete (void* Handle);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Open (with a filename)*/
    size_t             MediaInfoList_Open (void* Handle, const(wchar_t)* Files, const MediaInfo_fileoptions_C Options); /*Default : Options=MediaInfo_FileOption_Nothing*/
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Open (with a buffer) */
    size_t             MediaInfoList_Open_Buffer (void* Handle, const(ubyte)* Begin, size_t Begin_Size, const(ubyte)* End, size_t End_Size); /*return Handle*/
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Save */
    size_t             MediaInfoList_Save (void* Handle, size_t FilePos);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Close */
    void               MediaInfoList_Close (void* Handle, size_t FilePos);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Inform */
    const(wchar_t)*     MediaInfoList_Inform (void* Handle, size_t FilePos, size_t Reserved); /*Default : Reserved=0*/
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Get */
    const(wchar_t)*     MediaInfoList_GetI (void* Handle, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, MediaInfo_info_C InfoKind); /*Default : InfoKind=Info_Text*/
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Get */
    const(wchar_t)*     MediaInfoList_Get (void* Handle, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(wchar_t)* Parameter, MediaInfo_info_C InfoKind, MediaInfo_info_C SearchKind); /*Default : InfoKind=Info_Text, SearchKind=Info_Name*/
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Set */
    size_t             MediaInfoList_SetI (void* Handle, const(wchar_t)* ToSet, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, const(wchar_t)* OldParameter);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Set */
    size_t             MediaInfoList_Set (void* Handle, const(wchar_t)* ToSet, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(wchar_t)* Parameter, const(wchar_t)* OldParameter);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Option */
    const(wchar_t)*     MediaInfoList_Option (void* Handle, const(wchar_t)* Option, const(wchar_t)* Value);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::State_Get */
    size_t             MediaInfoList_State_Get (void* Handle);
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Count_Get */
    size_t             MediaInfoList_Count_Get (void* Handle, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber); /*Default : StreamNumber=-1*/
    /** @brief Wrapper for MediaInfoListLib::MediaInfoList::Count_Get */
    size_t             MediaInfoList_Count_Get_Files (void* Handle);
}
else
{
    alias MediaInfoListA_New               MediaInfoList_New;
    alias MediaInfoListA_New_Quick         MediaInfoList_New_Quick;
    alias MediaInfoListA_Delete            MediaInfoList_Delete;
    alias MediaInfoListA_Open              MediaInfoList_Open;
    alias MediaInfoListA_Open_Buffer       MediaInfoList_Open_Buffer;
    alias MediaInfoListA_Save              MediaInfoList_Save;
    //alias MediaInfoListA_Save_All          MediaInfoList_Save_All;
    alias MediaInfoListA_Close             MediaInfoList_Close;
    //alias MediaInfoListA_Close_All         MediaInfoList_Close_All;
    alias MediaInfoListA_Inform            MediaInfoList_Inform;
    //alias MediaInfoListA_Inform_All        MediaInfoList_Inform_All;
    alias MediaInfoListA_GetI              MediaInfoList_GetI;
    alias MediaInfoListA_Get               MediaInfoList_Get;
    alias MediaInfoListA_SetI              MediaInfoList_SetI;
    alias MediaInfoListA_Set               MediaInfoList_Set;
    alias MediaInfoListA_Option            MediaInfoList_Option;
    alias MediaInfoListA_State_Get         MediaInfoList_State_Get;
    alias MediaInfoListA_Count_Get         MediaInfoList_Count_Get;
    alias MediaInfoListA_Count_Get_Files   MediaInfoList_Count_Get_Files;
}

/* Warning : Deprecated, use MediaInfo_Option("Info_Version", "**YOUR VERSION COMPATIBLE**") instead */
const(char)*        MediaInfo_Info_Version ();


/** @brief A 'new' MediaInfoList interface, return a Handle, don't forget to delete it after using it*/
void*              MediaInfoListA_New (); /*you must ALWAYS call MediaInfoList_Delete(Handle) in order to free memory*/
/** @brief A 'new' MediaInfoList interface (with a quick init of useful options : "**VERSION**;**APP_NAME**;**APP_VERSION**", but without debug information, use it only if you know what you do), return a Handle, don't forget to delete it after using it*/
void*              MediaInfoListA_New_Quick (const(char)* Files, const(char)* Config); /*you must ALWAYS call MediaInfoList_Delete(Handle) in order to free memory*/
/** @brief Delete a MediaInfoList interface*/
void               MediaInfoListA_Delete (void* Handle);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Open (with a filename)*/
size_t             MediaInfoListA_Open (void* Handle, const(char)* Files, const MediaInfo_fileoptions_C Options); /*Default : Options=0*/
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Open (with a buffer) */
size_t             MediaInfoListA_Open_Buffer (void* Handle, const(ubyte)* Begin, size_t Begin_Size, const(ubyte)* End, size_t End_Size); /*return Handle*/
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Save */
size_t             MediaInfoListA_Save (void* Handle, size_t FilePos);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Close */
void               MediaInfoListA_Close (void* Handle, size_t FilePos);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Inform */
const(char)*        MediaInfoListA_Inform (void* Handle, size_t FilePos, size_t Reserved); /*Default : Reserved=0*/
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Get */
const(char)*        MediaInfoListA_GetI (void* Handle, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, MediaInfo_info_C InfoKind); /*Default : InfoKind=Info_Text*/
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Get */
const(char)*        MediaInfoListA_Get (void* Handle, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(char)* Parameter, MediaInfo_info_C InfoKind, MediaInfo_info_C SearchKind); /*Default : InfoKind=Info_Text, SearchKind=Info_Name*/
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Set */
size_t             MediaInfoListA_SetI (void* Handle, const(char)* ToSet, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, size_t Parameter, const(char)* OldParameter);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Set */
size_t             MediaInfoListA_Set (void* Handles, const(char)* ToSet, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber, const(char)* Parameter, const(char)* OldParameter);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Option */
const(char)*        MediaInfoListA_Option (void* Handle, const(char)* Option, const(char)* Value);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::State_Get */
size_t             MediaInfoListA_State_Get (void* Handle);
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Count_Get */
size_t             MediaInfoListA_Count_Get (void* Handle, size_t FilePos, MediaInfo_stream_C StreamKind, size_t StreamNumber); /*Default : StreamNumber=-1*/
/** @brief Wrapper for MediaInfoListLib::MediaInfoList::Count_Get */
size_t             MediaInfoListA_Count_Get_Files (void* Handle);
