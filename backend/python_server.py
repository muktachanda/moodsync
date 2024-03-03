import pickle

with open('VotingClassifier.pkl', 'rb') as f:
    model = pickle.load(f)

with open('tfidf.pkl', 'rb') as f:
    vectorizer = pickle.load(f)

def sui2risk(word):
    if word == "suicide":
        return "risk"
    elif word == "non-suicide":
        return "not_risk"
    else:
        return word


def finetune(sui):
    return [sui2risk(s) for s in sui]

import requests

# Make a GET request to the API endpoint
url = 'http://localhost:5000/api/messages'
response = requests.get(url)

# Check if the request was successful (status code 200)
if response.status_code == 200:
    # Parse the JSON response
    data = response.json()
    print(data)  # Display the fetched data
else:
    print('Failed to fetch messages:', response.status_code)

import json

#with open("msg.json", "r") as file:
    #data = json.load(file)

# x =  vectorizer.fit_transform(x).toarray()

texts = []
for text in data:
    texts.append(text["text"])

# from sklearn.feature_extraction.text import TfidfVectorizer
# vectorizer = TfidfVectorizer(min_df=50,max_features=5000)
    
    
inputs = vectorizer.transform(texts).toarray()

predictions = model.predict(inputs)
print("User inputs:")
print(texts)
print("Predictions:")
print(finetune(predictions))

def post_predictions(predictions):
    # Define the URL
    url = 'http://localhost:5000/api/predictions'

    # Prepare the data to be sent in the request body
    data = {'predictions': predictions}

    # Set the content type to JSON
    headers = {'Content-Type': 'application/json'}

    try:
        # Send the POST request
        response = requests.post(url, json=data, headers=headers)

        # Check if the request was successful (status code 200)
        if response.status_code == 200:
            print("Predictions posted successfully.")
        else:
            print(f"Failed to post predictions. Status code: {response.status_code}")

    except requests.exceptions.RequestException as e:
        # Handle any exceptions
        print(f"Error posting predictions: {e}")

post_predictions(finetune(predictions))
print("Posted predictions to the server.")

