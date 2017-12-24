function readOutLoud(message) {
  var speech = new SpeechSynthesisUtterance();

  speech.text = message;
  speech.volume = 1;
  speech.rate = 1;
  speech.pitch = 1;
  speech.lang = 'zh-TW'
  
  window.speechSynthesis.speak(speech);
}

readOutLoud('你好')
speechSynthesis.getVoices()
var speech = new SpeechSynthesisUtterance(), speak = (msg) => {
  speech.text = msg;
  speechSynthesis.speak(speech);
}
speech.volume = 1;
speech.rate = 1;
speech.pitch = 1;
speech.lang = 'zh-TW';
speak('你好')