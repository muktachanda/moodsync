# moodsync

#### Contributors: Mukta Chanda, Arghya Roy, Anuhya Nallapati, Nandini Maroo

MoodSync is a mobile application developed using Flutter, Flask, and Python aimed at providing a platform for therapists and patients to collaborate in tracking and improving mental health. 

#### Features
##### Therapist View
- _Dashboard_: Therapists have access to a dashboard where they can track each patient's progress based on various filters such as anxiety, depression, at-risk, normal, etc.
- _Patient Progress Tracking_: Therapists can monitor the progress of each patient's sessions based on the number of sessions completed.
- _Detailed User View_: Clicking on each user provides a detailed view of the patient's progress visualization, mood words chosen in the daily mood check-in, and additional therapist notes.
- _Chat with Patients_: Therapists can communicate with patients through a chat feature within the app.
- _Risk Alert Notifications_: Therapists receive alerts in the notification bar if any patient sends messages indicating potential risks. This feature utilizes a Naive Bayes training model for risk detection.
  

#### Patient View
- _Spotify Authorization_: Patients can authorize access to their Spotify account. The app utilizes music history analysis to detect signs of depression.
- _Daily Mood Word Check-in_: Patients can perform a daily mood word check-in, which therapists can view.
- _Chat with Therapist_: Patients have the option to communicate with their therapist through a chat feature within the app.

#### Instructions to Run
To run moodsync on your device, follow these steps:

1. Clone the repository and `cd` into moodsync folder.
2. `cd backend`
3. `python routes.py`
4. `cd ..`
5. `flutter pub get`
6. `flutter run`