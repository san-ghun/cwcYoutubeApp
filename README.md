# cwcYoutubeApp

[![Build Status](https://app.bitrise.io/app/a72bd9d616b02e76/status.svg?token=xO9QzjkRPLhb0xyVPobZ1A&branch=main)](https://app.bitrise.io/app/a72bd9d616b02e76)

is a demo app to practice iOS development with Swift UIKit, YouTube API, Git with Github, and Bitrise.

Assume that the user has knowledge to create and handle API Key from Google Cloud Platform and API from YouTube API.  
- The demo app requires to input API Key as text that allows user to access to YouTube data API v3, the app stores API key internally only, and only uses to call API to get Video data from YouTube.   
- The app also requires YouTube Playlist ID, which can be found from URL of the Playlist, user can input the Playlist ID as text.

---

- Objective
  - [x] Practice and learn how to manage project with Issues and Pull requests feature in Github
  - [x] Learn what is CI/CD and Practice how to manage and work with by using the Bitrise
  - [ ] Deploy the App with Ad Hoc as method of distribution

---

### To build in your Mac

1. Git clone the repository to the targeted path or directory in your Mac.
2. Open the project with Xcode.
3. Go to "File >> Add Packages", and add the "[youtube-ios-player-helper](https://github.com/youtube/youtube-ios-player-helper)".
  - To search the package, enter the URL, https://github.com/youtube/youtube-ios-player-helper
  - You can find more information from the package repository page and the YouTube Data API v3 Documentation page.

---

TODO: - 10-cwcYoutubeApp
- Keep the demo app as non published project, and let's assume users have knowledge to input API_KEY and YouTube Video List ID for their own.
- Have to find out better and best way to handling secrets in app. [reference](https://nshipster.com/secrets/)
- Might be good idea to present an application introducing brand or channel with their Youtube video. 

Tags: `MVC`, `UIKit`, `Storyboard`, `View Life cycle`, `API`, `YouTube data API v3`, `Networking`, `JSON`, `CI/CD`, `Bitrise`, `Swift Package`, `YouTubeiOSPlayerHelper`, `Codable`, `URL(string:)`, `URLSession.shared`, `.dataTask()`, `JSONDecoder()`, `dataTask.resume()`, `UITableView`, `Custom TableViewCell`, `prepare(for segue: )`, `WebViews`, `Hugging priority in UIKit`, `DateFormatter()`, `Singleton`, `protocol`, `delegate`, `Delegate Protocol Pattern`, `JSONDecoder`, `dequeueReusableCell`, `DispatchQueue.main.async`, `JSONDecoder()`, `decoder.dateDecodingStrategy = .iso8601`, `dataTask.resume()`, `decoder.container()`, `container.decode()`, `container.nestedContainer()`, `git submodule`, `.gitmodules`, `Singleton`, `storyboard.instantiateViewController()`, `UIView.window.makeKeyAndVisible()`

Tips:
- Use [NSDateFormatter.com](NSDateFormatter.com) to find proper DateFormatter easy.
- Remeber that modifying UI should be thrown to the Main thread, so use `DispatchQueue.main.` when you code some network work or any works that done in background thread.
- Everytime, consider that I am handling UI related job or not, so might have to use `DispatchQueue` in proper situation.
- When using `URLSession.dataTask()`, don't forget to start data task by `dataTask.resume()`.
- ...
