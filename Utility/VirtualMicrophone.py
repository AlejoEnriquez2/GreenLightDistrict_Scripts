from pydub import AudioSegment
from pydub.playback import play

audioPath = 'media/audio.mp3'

while True:
    audio = AudioSegment.from_mp3(audioPath)
    play(audio)
