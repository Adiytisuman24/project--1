from PIL import Image
import sounddevice as sd

# Save a photo file
image = Image.open("photo.jpg")
image.save("photo.jpg", "JPEG")

# Save a video file
# You'll need to use a library such as OpenCV to handle the video data
# and then use the method `cv2.imwrite()` to save the video file

# Save an audio file
recording = sd.rec(int(5 * fs), samplerate=fs, channels=2)
sd.wait()
sd.play(recording)
sd.wait()

# use soundfile library to save the audio file
import soundfile as sf
sf.write('audio.wav',recording,fs)
