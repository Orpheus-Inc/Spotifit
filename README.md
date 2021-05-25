Original App Design Project
===

# Spotifit

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that generates a music playlist based on workout conditions specified by the user, custom tailored to their established music tastes

### App Evaluation
- **Category:** 
    - Music
    - Fitness
- **Mobile:**
    - Having a mobile audio experience in a dedicated app allows for a much more fluid user experience that is difficult to provide on a mobile webapp.
    - The app could take advantage of iPhone sensors to provide dynamic feedback for a workout
- **Story:**
    - Many people use Spotify to listen to music, so developing this app would extend the functionality of Spotify to help people use it when exercising
    - Spotifit helps users create different playlists of different energy and/or pace for different activities or milestones.
    - For example, no one likes getting a good rhythm to a song while jogging, and then tripping over the beat when the next song is way slower or faster. Spotifit aims to combat this problem.
- **Market:** 
    - The primary audience of this app will be anyone who likes to exercise while listening to music.
    - Spotifit will help them create music playlists that fit their desired workout preferences.
- **Habit:**
    - The users can use this app once they doing fitness, which is based on their fitness frequency. 
    - The app will create playlist for the users and the users will not create any playlist for this app. 
- **Scope:**
    - It will be challenging to implement more dynamic, workout focused functionality however the core functionality is readily available through Spotify's API. We can choose to further customize the retrieved data depending on time.
    - It's core functionality is very clear and extended functionality has a lot of development potential

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
- [X] User can navigate between Feed, Playlists, and Search screens
- [X] User can login/logout with their personal Spotify account
- [ ] User can create a playlist using the following parameters:
    - BPM (for running it would be cadence)
    - Energy level (how pumped the playlist should be)
- [ ] User can stream music from the playlists, within the app
- [ ] User can view other user’s generated playlists on a feed

**Optional Nice-to-have Stories**

- [ ] User can browse the playlists they have made using the app
- [ ] User can edit/delete playlists made using the app
- [ ] User can duplicate playlists made using the app
- [ ] User can hear an example song for the BPM currently selected
- [ ] User's can add tags (workout/routine) to their playlists
- [ ] Playlists in feed display BPM/energy/tags
- [ ] Users can select genre(s) for songs in the list

### 2. Screen Archetypes

* Login Screen
    * User can login/logout with their personal Spotify account
* Home Feed
    * User can view a feed of playlists
* Playlist Creation
    * User can create a playlist using the following parameters:
        * BPM (for running it would be cadence)
        * Energy level (how pumped the playlist should be)
* Music Streaming
    *  User can stream music from the playlists, within the app
* User Playlists
    * User can browse their previously generated playlists
* Modify Playlists
    * User can modify or delete playlists
* Search 
    * User can search playlists for tags

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home Feed
* User Playlists
* Search

**Flow Navigation** (Screen to Screen)

* Login Screen
  => Home Feed Screen
* Home Feed Screen
   => Music Streaming (if user clicks on a public playlist)
* Creation
   => Music Streaming (assume user immdiately wants to use playlist)
* Music Streaming
  => Previous page (i.e., if they were on the Home page go there, if User Playlists go there, etc.)
* User Playlists
  => None
* Modifying
  => User Playlists (after modifying/deleting a playlist)
* Search
  => None

## Wireframes
![Hand drawn basic wireframe](https://i.imgur.com/edwEdCM.jpg)

### [BONUS] Digital Wireframes & Mockups

[Figma Digital Mockup](https://www.figma.com/file/eFrCBZD8mWIlIaO1uSPE0c/Spotifit?node-id=0%3A1)

### [BONUS] Interactive Prototype

[Interactive Prototype](https://www.figma.com/proto/eFrCBZD8mWIlIaO1uSPE0c/Spotifit?node-id=7%3A4&scaling=scale-down&page-id=0%3A1)

GIF Walkthrough:

![Interactive Prototype](https://raw.githubusercontent.com/sundries-hub/LifeReviewFile/master/uPic/Kapture%202021-05-10%20at%2021.26.50.gif)

## Schema 
### Models
#### Playlist

   | Property   | Type   | Description |
   | ---------- | ------ | ----------- |
   | playlistId | String | unique id for each playlist (default field) |
   | playlistName | String | name of playlist |
   | creator | Pointer to User| playlist creator |
   | coverImage | File | cover image for playlist |
   | tags | Array | list of tags on playlist (genres, etc.) |
   |createdAt | DateTime | date when playlist is created (default field) |
   | songs | Array | list of songs in playlist |
   
#### User

   | Property   | Type   | Description |
   | ---------- | ------ | ----------- |
   | userId | String | unique id for each user |

   
### Networking
#### List of network requests by screen
* Login Screen
    * (Read/GET) Query user's Spotify account
* Home Feed Screen 
    * (Read/GET) Fetch playlists for a user's home feed
* Playlist Creation
    * (Create/POST) Create a new playlist object
* Music Streaming
    * (Read/GET) Spotify song
* User Playlists
    * (Read/GET) Get all playlists where user is creator
* Modify Playlist
    * (Update/PUT) Changing a user's playlist
    * (Delete) Delete existing playlist
* Search
    * (Read/GET) Retrieve playlists based on search query

#### [OPTIONAL:] Existing API Endpoints
##### Spotify Web API
- Base URL - [https://api.spotify.com](https://api.spotify.com)

   HTTP Verb | Endpoint | Description
   ----------|----------|------------
    `GET`    | TBD | TBD
    `GET`    | TBD | TBD
    `GET`    | TBD   | TBD
    `GET`    | TBD | TBD
    

#### Progress Unit 8

![unit8](https://raw.githubusercontent.com/sundries-hub/LifeReviewFile/master/uPic/Kapture%202021-05-24%20at%2023.14.44.gif)

