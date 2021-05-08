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
* User can login/logout with their personal Spotify account
* User can create a playlist using the following parameters:
    * BPM (for running it would be cadence)
    * Energy level (how pumped the playlist should be)
* User can stream music from the playlists, within the app

**Optional Nice-to-have Stories**

* User can browse the playlists they have made using the app
* User can edit/delete playlists made using the app
* User can duplicate playlists made using the app
* User can hear an example song for the BPM currently selected
* User's can add tags (workout/routine) to their playlists
* User can view other user’s generated playlists on a feed
* Playlists in feed display BPM/energy/tags
* Users can select genre(s) for songs in the list

### 2. Screen Archetypes

* Login Screen
    * User can login/logout with their personal Spotify account
* Feed
    * User can view a feed of playlists
* Creation
    * User can create a playlist using the following parameters:
        * BPM (for running it would be cadence)
        * Energy level (how pumped the playlist should be)
* Music Streaming
    *  User can stream music from the playlists, within the app
* User Playlists
    * User can browse their previously generated playlists
* Modifying
    * User can modify or delete playlists
* Search
    * User can search playlists for tags

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home (Feed)
* User Playlists
* Search

**Flow Navigation** (Screen to Screen)

* Login Screen
  => Home (Feed) Screen
* Home (Feed) Screen
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
![Hand drawn basic wireframe](https://user-images.githubusercontent.com/45127818/117525267-3da29900-af76-11eb-8ec9-6499b8eb9371.jpg)


### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
