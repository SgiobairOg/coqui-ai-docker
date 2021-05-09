# syntax=docker/dockerfile:1
FROM python:3.8

RUN apt-get update && apt-get install -y sudo git

WORKDIR /usr/src/app

RUN git clone https://github.com/coqui-ai/TTS.git .

RUN make system-deps
RUN make install
CMD python TTS/server/server.py --model_name tts_models/en/vctk/sc-glow-tts --vocoder_name vocoder_models/en/vctk/hifigan_v2