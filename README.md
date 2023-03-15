<p align="center">
<img height="150" alt="uptube" src="https://user-images.githubusercontent.com/87763388/225467017-d0111820-9a89-40af-9f0e-8d4dcd422b82.png">
</p>

## UpTube

This project was developed as the final project, of the UpSkills 2022 - Class 1 - Javascript Frontend React, alongside with two other colleagues of mine.
UpTube is a video sharing platform with a social networking component. Our goal was to develop a full-stack system consisting of a progressive web application in React.JS, supported by an Express.js backend and a MySQL relational database.

This project was meant to simulate a real-world work scenario where a client requires a tailor-made solution, but only knows the functionalities they want implemented and the technologies they want to use.

In the beginning of this project, the client had already created a set of mockups in collaboration with a design team, which were aligned with their requirements and had to be strictly followed. However, there were some flaws that could only be detected during implementation, so we had several opportunities to meet with "the client" (during weekly sprints) to provide progress updates and ask functional questions about the application. 


## Reference

- [Methodology](#Methodology)
- [System requirements](#SystemRequirements)
- [Authentication](#Authentication)
- [Video Listing](#VideoListing)
- [User Channels](#UserChannels)
- [Video Uploading and ffmpeg](#VideoUploadingandffmpeg)
- [Technologies](#Technologies)
- [Homepage Mockup](#HomepageMockup)


## Methodology

We employed Scrum methodology with weekly sprints to manage our work on this project. Our work was organized into the following phases:

- Planning and functional specification
- MySQL Workbench database structure
- Specification of the API structure - routes/endpoints and respective parameters
- Implementation of the main application functionalities, including login, registration, home page, video upload, and profile
- Two interim progress updates with the client
- Project delivery and final presentation

By following this structured approach, we were able to deliver a high-quality solution that met the client's expectations. Our methodology allowed us to stay on track and make adjustments as needed, resulting in a successful outcome for all involved.

## System Requirements

At our video sharing platform, we ensured a reliable and efficient connection to a relational database for storing and retrieving large amounts of data, including user accounts, videos, playlists, comments, and other important aspects of the platform's functionality. We also implemented an email notification system for keeping users informed of important events and updates, as well as in-platform notifications for new content and updates.

To ensure easy accessibility and usability on both desktop and mobile devices, we designed the platform with a responsive layout. We took into account the importance of mobile devices in today's internet traffic and thoroughly tested the platform to ensure that it looks and works great on a variety of different devices and screen sizes.

## Authentication

We have developed an authentication system that provides a secure and seamless experience for users. We implemented the system using the popular middleware, Passport, which allowed for a secure login process. Users can access their account by entering their email address and password on the login page. To create an account, users can register by providing their name, email address, and password, and possibly additional fields such as date of birth or location.

We also implemented a password recovery feature, which enables users to reset their password by entering their email address and following a link sent to that address. Users can edit their profile information, such as their name or profile picture, within the platform, ensuring that their information is up-to-date. Our authentication system was designed with the user's privacy and security in mind, while ensuring a user-friendly experience. By leveraging the power of Passport, the authentication process was streamlined, allowing users to easily access their accounts and the content they have created or subscribed to.

## Video Listing

Our goal was to provide users with a range of features that help them explore, manage, and enjoy video content. To achieve this, we have implemented a robust listing system that comprises a personalized homepage, highlighting videos based on user preferences and interactions with the platform. We have also incorporated a trending videos section, showcasing popular videos across the platform.

The playlist feature allows users to create and customize lists of videos based on their interests. Users can create playlists with titles, descriptions, and public links, and can also edit and delete playlists as needed. Videos can be added and removed from playlists, and playlists can be private, public and/or shared with friends who can edit them as well. Private playlists are visible only to the user who created them, while public playlists are viewable by anyone on the platform. Shared playlists enable users to collaborate with others and create a playlist together.

Users have their own channels where they can upload, manage, and showcase their videos. These channels also enable users to engage with their followers and access video analytics.

Our search function enables users to search for videos by title, keywords, or tags.

To make it easier for users to discover videos on specific topics, we have implemented tags. These are keywords or phrases added to videos to make them easier to find.

Lastly, we keep track of users' viewing history, enabling them to resume watching previously watched videos. This feature provides a convenient and personalized viewing experience for our users.

## User Channels

Our channel customization options include editing the banner, avatar, and name. Users can also feature playlists or videos of their choice on their channel and add favorite channels.

Our channel listing system enables users to easily navigate and view videos and playlists. Subscribers and subscriptions are also displayed on the channel page, allowing users to keep track of their followers and those they follow.

To help users track their channel's performance, we provide a range of channel statistics, including views, subscribers, and engagement metrics. These insights can help users better understand their audience and improve their content strategy.

Lastly, our achievement system offers badges and rewards for various milestones and accomplishments, such as reaching a certain number of subscribers or views. Achievements can be displayed on the channel page, serving as a testament to the user's dedication and success on the platform.

Overall, these features were designed to empower our users to customize and showcase their channels, while also providing valuable insights and rewards for their efforts.

## Video Uploading and ffmpeg

As a video sharing platform, we rely on FFmpeg, a powerful open-source software library, to process multimedia content such as video and audio files. With FFmpeg, we are able to encode, decode, transcode, and stream media content with ease and efficiency.

Using FFmpeg, we offer a streamlined video uploading process that automatically generates video thumbnails and compresses and converts videos to a consistent format. We assign a unique, randomly generated ID to each uploaded video to ensure efficient management and access.

Our platform also allows users to input video data such as title and description, and extract metadata such as the video's length and upload date. Users can also add subtitles to their videos for accessibility purposes, and relevant tags to make it easier for others to discover their content through search and recommendations.

Overall, our use of FFmpeg and other technologies enables us to provide a seamless and enjoyable video viewing experience for our users.

## Video Page

Our video page is designed to provide users with a seamless and engaging viewing experience. At the core of the page are the standard video playback controls, including play/pause, volume, and fullscreen. Additionally, users can leave comments to share their thoughts or feedback on the video.

To help users discover related content, the page also displays a list of related videos based on the current video being viewed. This feature is powered by our recommendation algorithm, which analyzes user viewing habits and interactions to suggest videos that might be of interest.

The page also displays important video metrics such as view count, as well as the number of likes and dislikes the video has received. These metrics provide insight into the video's popularity and help users gauge its overall reception. Additionally, users can report videos that violate our community guidelines or terms of service by clicking the "Report" button.

Overall, our video page provides a robust set of features to enhance the video viewing experience, while also promoting community engagement and adherence to our platform's standards.

## Technologies

- XAMPP
- Maria DB
- Node
- React
- Postman

## Homepage Mockup

(You may see the remaining mockups in the mockups folder)

<img width="1600" alt="Homepage" src="https://user-images.githubusercontent.com/87763388/225467203-6bf6b796-3660-4476-8dee-c66f002c2b05.png">


