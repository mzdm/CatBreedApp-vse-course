## Project info
- Final semestral project for [4IT532: Introduction to iOS development](https://insis.vse.cz/auth/katalog/syllabus.pl?predmet=181554) VŠE course.
- Requirements: build an app for to fetch from [developers.thecatapi.com](https://developers.thecatapi.com/), display breed images and details. Open wikipedia page for the breed if available.
- Based on the Skeleton project by STRV guys: https://github.com/strvcom/ios-vse-summer-semester-2023
- Design inspirations:
    - https://dribbble.com/shots/14973110-Pet-Adoption-Mobile-App
    - https://dribbble.com/shots/7337529-Pet-Sharing-App

## Setup - Env variables

This project uses `.xcconfig` files to manage environment variables so API keys etc. are not exposed. Please follow these steps to configure it:

1. **Create a new .xcconfig file**: In Xcode, navigate to `File > New > File`, then select `Configuration Settings File` under `iOS > Other` and name this file `Secrets.xcconfig`.

2. **Add your API key to the .xcconfig file**: Open `Secrets.xcconfig` and add your API key as follows:

   ```
   API_KEY = YOUR_API_KEY
   ```

   Replace `YOUR_API_KEY` with your actual API key.

## Issues encountered
- In detail view there is NavBarTitle from the previous view, could not find a way to remove it
