Original App Design Project - README Template
===

# My Watchbox

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

With My Watchbox, you can keep track of what movies and shows you have watched, or are currently watching! You can even write notes and ratings for each movie or show. My Watchbox also suggests locations of where you can watch a movie or show near you.

Next time your friends ask you for a movie suggestion, be prepared with My Watchbox!

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Entertainment
- **Mobile:**
    - this is more than just a glorified website, since it will store information about the user that they may want to check and update often
    - it will include a map/location feature, and can also use real-time features
- **Story:**
    - this app is not too valuable, more just for entertainment and fun
    - I think my friends and peers would appreciate this product
- **Market:**
    - the potential user base is very large and diverse, since many people watch movies/shows
    - this could provide some value to many people, but probably only a niche group of people would highly value it (people who really enjoy movies/shows)
    - the audience is not very well-defined, and is fairly broad
- **Habit:**
    - the app will probably not be addictive, but will be used repeatedly
        * it will probably have high retention rate, since users will not want to lose the movie/show details that they spent time entering into the app
    - the average user will create a lot, since they will enter in the details of what they are watching
- **Scope:**
    - this should be technically challenging
    - it will be interesting to build, with tableviews, editing, and location features
    - the base application is fairly clearly defined

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* user can create a new movie/show entry
    * write a note
    * add a rating
* user can scroll through the list of previously-created movie/show entry previews
* user can click an entry to view all of the entry details
* movie/show entries are saved even when exitting and re-opening the app

**Optional Nice-to-have Stories**

* user can search for a movie/show and see where it is being shown nearby
* user can search for a movie/show and see how other people have rated it (based on IMDb or another database)

### 2. Screen Archetypes

- [ ] List Feed 
* user can scroll through the list of previously-created movie/show entry previews
* movie/show entries are saved even when exitting and re-opening the app
* user can click an entry to view all of the entry details
- [ ] Entry Details
* view all of the entry details
- [ ] New Entry
* user can create a new movie/show entry
- [ ] Where-to-watch Search
* user can search for a movie/show and see where it is being shown nearby
- [ ] Movie/Show Search
* user can search for a movie/show and see how other people have rated it (based on IMDb or another database)

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home (List Feed)
* Where-to-watch Search
* Movie/Show Search

**Flow Navigation** (Screen to Screen)

- [ ] List Feed
* => Create
* => Entry Details
* ...
- [ ] New Entry
* => List Feed

## Wireframes

![](https://github.com/alam7989/My-Watchbox/blob/main/My_Watchbox_Wireframe.jpeg)

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

## Checklist
### Sprint 1: Achieve Required/Must-have Functionalities
- [X] Create View Controller for the List Feed page
- [X] Create View Controller for the New Entry page
- [X] Implement the basic features of the List Feed page
    - [X] Some scrollable view (ex. table view) displaying a preview for each previously-created entry, where each entry preview displays:
        - [X]  Movie/Show title
        - [X]  User-given rating
- [X] Implement the New Entry page
    - [X] Take user input for:
        - [X] Movie/Show title
        - [X] User-given rating
        - [X] User's notes (optional)
- [X] Implement navigation betweeen List Feed and New Entry pages
    - [X] From List Feed: tap "New" to flow to New Entry page
    - [X] From New Entry:
        - [X] tap "Cancel" to flow back to List Feed page
        - [X] tap "Done" to add entry information to local information store/database, and flow back to List Feed page
- [X] Create View Controller for Entry Details page
- [X] Populate Entry Details page
    - [X] Movie/Show title
    - [X] User-given rating
    - [X] User's Notes
- [X] Implement navigation between List Feed and Entry Details pages
    - [X] From List Feed: tap on an entry preview to flow to the Entry Details page (populated with the details of the selected entry)
    - [X] From Entry Details: tap on "back" to flow back to the List Feed page

### Sprint 2: Achieve Stretch Functionalities
- [ ] Create View Controller for Where-to-watch or Movie/Show search page
- [ ] Implement Where-to-watch or Movie/Show search page
    - [ ] Take in user input from a search bar
    - [ ] Make calls to an API to get information about the user's query
    - [ ] Populate page with returned information
- [ ] Implement navigation between List Feed and Where-to-watch or Movie/Show search page
