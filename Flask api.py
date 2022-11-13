
from flask import Flask, jsonify
from flask import request
import librosa
from pydub import AudioSegment
import ffmpeg
app = Flask(__name__)

@app.route('/',methods = ['GET','POST'])
def calcluateBPM():
	if request.method == 'POST':
		src = request.files['src']
		return 'file uploaded '

	if request.method == 'GET':
		d = {}
		src 
		try:
			y, sr = librosa.load(src)
		except:
			print("Unable to find file") 
		original_tempo, beat_frames = librosa.beat.beat_track(y=y, sr=sr)
		d['bpm']= '{:2f}'.format(original_tempo)
		return d
	

if __name__ == "__main__":
    app.run(debug=True)
