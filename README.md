# cwcYoutubeApp

---

[![Build Status](https://app.bitrise.io/app/a72bd9d616b02e76/status.svg?token=xO9QzjkRPLhb0xyVPobZ1A&branch=main)](https://app.bitrise.io/app/a72bd9d616b02e76)

---

TODO: - 10-cwcYoutubeApp
- Keep the demo app as non published project, and let's assume users have knowledge to input API_KEY and YouTube Video List ID for their own.
- Have to find out better and best way to handling secrets in app. [reference](https://nshipster.com/secrets/)
- Might be good idea to present an application introducing brand or channel with their Youtube video. 

Tags: `MVC`, `UIKit`, `Storyboard`, `View Life cycle`, `API`, `YouTube data API v3`, `Networking`, `JSON`, `CI/CD`, `Bitrise`, `Swift Package`, `YouTubeiOSPlayerHelper`, `Codable`, `URL(string:)`, `URLSession.shared`, `.dataTask()`, `JSONDecoder()`, `dataTask.resume()`, `UITableView`, `Custom TableViewCell`, `prepare(for segue: )`, `WebViews`, `Hugging priority in UIKit`, `DateFormatter()`, `Singleton`, `protocol`, `delegate`, `Delegate Protocol Pattern`, `JSONDecoder`, `dequeueReusableCell`, `DispatchQueue.main.async`, `JSONDecoder()`, `decoder.dateDecodingStrategy = .iso8601`, `dataTask.resume()`, `decoder.container()`, `container.decode()`, `container.nestedContainer()`, `git submodule`, `.gitmodules`

Tips:
- Use [NSDateFormatter.com](NSDateFormatter.com) to find proper DateFormatter easy.
- Remeber that modifying UI should be thrown to the Main thread, so use `DispatchQueue.main.` when you code some network work or any works that done in background thread.
- Everytime, consider that I am handling UI related job or not, so might have to use `DispatchQueue` in proper situation.
- When using `URLSession.dataTask()`, don't forget to start data task by `dataTask.resume()`.
- ...
