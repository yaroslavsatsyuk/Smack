# Smack

A chatting app featuring real-time messaging, using MongoDB as database and Heroku as server.<br/>

### Features
<ul>
<li>Real-time sending and receiving messages in any channels.<br/></li>
<li>Users can create account with their favourite avatar and randomized background color.<br/></li>
<li>Users can create new channels with desired name and description for the channels.<br/></li>
<li>Channels with unread messages will be displayed with bolded-font.<br/></li>
<li>Display user profile on pop-up view.<br/></li>
</ul>

### Libraries
<ul>
<li>Used UITableView to display messages and channels.<br/></li>
<li>Used UICollectionView to display avatar options.<br/></li>
<li>Used NotificationCenter to monitor user login status and channels status.<br/></li>
<li>Used UISwipeGestureRecognizer to display and dismiss main menu.<br/></li>
</ul>

### Cocoapods
<ul>
<li>Used Alamofire to receive data in JSON format from server.<br/></li>
<li>Used SwiftyJSON to easily access data as a dictionary.<br/></li>
<li>Used Socket.IO-Client-Swift to handle incoming and outgoing signal for new message and new channel from server.<br/></li>
<li>Used SWRevealViewController to display a sliding view controller as the main menu.<br/></li>
</ul>

### Preview 
<a href="https://imgur.com/tvhPRL9"><img src="https://i.imgur.com/tvhPRL9.gif" title="source: imgur.com" /></a>
