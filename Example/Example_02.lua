
--====================================================================
local ffi =require("ffi")
local mediaInfo = require("ffi-mediaInfo");
--====================================================================

-- set filePath
local filePath ="SampleWav//Alarm6_01.wav"

--  print Mediainfo version  to console
print ( ffi.string(mediaInfo.MediaInfoA_Option(nil,"Info_Version", "") ));

-- create MediaInfo Instance
local mi = mediaInfo.MediaInfoA_New();

-- open target File
mediaInfo.MediaInfoA_Open (mi,filePath); 

-- for store
local fileExtention;
local completeName;
local fileName;
local fileSize;
local duration;
local format_;
local samplingRate;
local channel;
local bitDepth;

--get info
mediaInfo.MediaInfoA_Option(mi,"Inform", "General;%CompleteName%");
completeName = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));

mediaInfo.MediaInfoA_Option(mi,"Inform", "General;%FileName%");
fileName = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));

mediaInfo.MediaInfoA_Option(mi,"Inform", "General;%FileSize/String%")
fileSize = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));

mediaInfo.MediaInfoA_Option(mi,"inform","General;%FileExtension%");
fileExtention = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));

-- https://sourceforge.net/p/mediainfo/discussion/297610/thread/289c1915/
--====================================================================
if (   fileExtention == "wav" 
    or fileExtention == "mp3" 
    or fileExtention == "ogg" 
    or fileExtention == "flac" 
    or fileExtention == "m4a" 
    )
then 
    mediaInfo.MediaInfoA_Option(mi,"Inform", "Audio;%Duration/String1%");
    duration = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));
    
    mediaInfo.MediaInfoA_Option(mi,"Inform", "Audio;%Format%");
    format_ = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));

    mediaInfo.MediaInfoA_Option(mi,"Inform", "Audio;%SamplingRate/String%");
    samplingRate = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));

    mediaInfo.MediaInfoA_Option(mi,"Inform", "Audio;%Channel(s)%");
    channel = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));
        
    mediaInfo.MediaInfoA_Option(mi,"Inform", "Audio;%BitDepth/String%");
    bitDepth = ffi.string(mediaInfo.MediaInfoA_Inform (mi, 1));
end
--====================================================================

-- close 
mediaInfo.MediaInfoA_Close (mi);  

-- delete MediaInto instance
mediaInfo.MediaInfoA_Delete (mi);

--====================================================================
-- print to console
print ( "CompleteName:"  .. completeName);
print ( "Filename:"      .. fileName);
print ( "FileSize:"      .. fileSize);
print ( "FileExtention:" .. fileExtention);
print ( "Duration:"      .. duration);
print ( "Format:"        .. format_);
print ( "SampleingRate:" .. samplingRate);
print ( "Channel:"       .. channel);
print ( "BitDepth:"      .. bitDepth);

-- result
--====================================================================
-- MediaInfoLib - v0.7.90
-- CompleteName:sampleWav//Alarm6_01.wav
-- Filename:sampleWav//Alarm6_01
-- FileSize:548 KiB
-- FileExtention:wav
-- Duration:3 s 181 ms
-- Format:PCM
-- SampleingRate:44.1 kHz
-- Channel:2
-- BitDepth:16 bits
--====================================================================
