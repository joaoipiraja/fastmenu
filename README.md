# Fast Menu 🍛 🤖
 2nd Challenge - Mac CLI App
 
 ### Motivation 💡
 
 Help with my daily routine in my mother local business. That's why, i decided to create a SPM to generate menu by an input string using my skills in  machine learning (Core ML Framework). The results was pretty amazing: the NLP model had a great perfomance classifying 4 main dishes of the bento box
 
 ### Install 💻
 ```console
 
 cd /usr/local/bin
 sudo curl -OL https://github.com/joaoipiraja/fastmenu/releases/download/v1.0/fastmenu
 sudo chmod 755 fastmenu
 
  ```
 ### Run 💻
```bash
 
OVERVIEW: Generate your menus easier than ever

USAGE: fast-menu [--copy-to-paste-board] [--service-time <service-time>]

OPTIONS:
  --copy-to-paste-board   Execute menu script
  --service-time <service-time>
                          Time interval of service (default: 11:30 ~ 12:30)
  --version               Show the version.
  -h, --help              Show help information.
 
```

```bash

 swift run fastmenu
 swift run fastmenu --service-time '12:30 ~ 13:00' --copy-to-paste-board
 swift run fastmenu --copy-to-paste-board
 
```
###

[<img src="/Screenshots/1.png" width="75%"/>](1.png)
