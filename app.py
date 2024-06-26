from fastapi import FastAPI
from transformers import pipeline

app = FastAPI()

# Initialize the text generation pipeline
pipe = pipeline("text2text-generation", model="google/flan-t5-small")

@app.get("/")
def home():
    return {"message": "Hello World"}

@app.get("/generate")
def generate(text: str):
    # Use the pipeline to generate text from given input text
    output = pipe(text)
    # Return the generated text in JSON response
    return {"output": output[0]['generated_text']}
