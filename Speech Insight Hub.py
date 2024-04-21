import speech_recognition as sr
import pyttsx3
import time
import google.generativeai as genai

r = sr.Recognizer()

# Converting text to speech
def SpeakText(command):
    engine = pyttsx3.init()
    engine.say(command)
    engine.runAndWait()

print("Enter your goals : ")
goal = input()

print("Press 1 to speak : ")
a = int(input())

if a == 1 :
    # Exception handling to handle exceptions at the runtime
    try:
        # use the microphone as source for input.
        with sr.Microphone() as source2:
            
            r.adjust_for_ambient_noise(source2, duration=0.2)

            # Start time to measure 10 seconds
            start_time = time.time()

            while time.time() - start_time < 200:
                audio2 = r.listen(source2)

                # Using Google to recognize audio
                MyText = r.recognize_google(audio2)
                MyText = MyText.lower()

                print(MyText)
                print("\n")
                SpeakText(MyText)

    except sr.RequestError as e:
        print("Could not request results; {0}".format(e))

    except sr.UnknownValueError:
        print("Unknown error occurred")
        

story1 = MyText + "Can you summarize my day in two sentences ? List down what can I do to improve my day ? And list down the things that i did well today."
story2= "My goals are to " + goal + "Can you honestly rate my day on a scale of 0.00 to 10.00 purely based off my goals?"
final = story1 + story2

genai.configure(api_key="AIzaSyDcjmTXw4FKfV2Tid8cvme-dLbHLl1U_ek")

# Set up the model
generation_config = {
  "temperature": 0.9,
  "top_p": 1,
  "top_k": 1,
  "max_output_tokens": 2048,
}

safety_settings = [
  {
    "category": "HARM_CATEGORY_HARASSMENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_HATE_SPEECH",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
]

model = genai.GenerativeModel(model_name="gemini-1.0-pro",
                              generation_config=generation_config,
                              safety_settings=safety_settings)

convo = model.start_chat(history=[])

convo.send_message(final)
print(convo.last.text)