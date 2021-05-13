//
//  Mp3Encoder.hpp
//  FirstStudyCode
//
//  Created by zhangyuhui on 2021/5/10.
//

#ifndef Mp3Encoder_hpp
#define Mp3Encoder_hpp

#include <stdio.h>
#include "lame.h"
class Mp3Encoder {
private:
    FILE* pcmFile;
    FILE* mp3File;
    lame_t lameClient;
    
public:
    Mp3Encoder();
    ~Mp3Encoder();
    int Init(const char* pcmFilePath, const char *mp3FilePath, int
             sampleRate, int channels, int bitRate);
    void Encode();
    void Destory();
};

#endif /* Mp3Encoder_hpp */
