from flask import Flask, jsonify, request
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

messages = []

@app.route('/api/data', methods=['POST'])  # Ensure this route accepts only POST requests
def receive_message():
    if request.method == 'POST':
        content = request.json
        sender = content.get('sender')
        text = content.get('text')
        messages.append({'sender': sender, 'text': text})
        return jsonify({'success': True}), 200
    else:
        return jsonify({'success': False, 'error': 'Invalid method'}), 405

@app.route('/api/messages', methods=['GET'])
def get_messages():
    return jsonify(messages)

if __name__ == '__main__':
    app.run(debug=True)
