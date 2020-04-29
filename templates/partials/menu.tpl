			<div class="navbar-header">
				<button type="button" class="navbar-toggle pull-left hidden" id="mobile-menu">
					<span component="notifications/icon" class="notification-icon fa fa-fw fa-bell-o unread-count" data-content="{unreadCount.notification}"></span>
					<i class="fa fa-lg fa-fw fa-bars"></i>
				</button>
				<button type="button" class="navbar-toggle hidden" id="mobile-chats hidden">
					<span component="chat/icon" class="notification-icon fa fa-fw fa-comments unread-count" data-content="{unreadCount.chat}"></span>
					<i class="fa fa-lg fa-comment-o"></i>
				</button>

				<!-- IF brand:logo -->
				<a href="<!-- IF brand:logo:url -->{brand:logo:url}<!-- ELSE -->{relative_path}/<!-- ENDIF brand:logo:url -->">
					<img alt="{brand:logo:alt}" class="{brand:logo:display} forum-logo" src="{brand:logo}?{config.cache-buster}" />
				</a>
				<!-- ENDIF brand:logo -->

				<div component="navbar/title" class="visible-xs hidden">
					<span></span>
				</div>
			</div>

			<div id="nav-dropdown" class="hidden-xs">
				<!-- IF !maintenanceHeader -->
				<!-- IF config.loggedIn -->

				<ul id="logged-in-menu" class="nav navbar-nav navbar-right">
					<li class="notifications dropdown text-center hidden-xs" component="notifications">
						<a href="{relative_path}/notifications" title="[[global:header.notifications]]" class="dropdown-toggle" data-toggle="dropdown" id="notif_dropdown" data-ajaxify="false" role="button">
							<i component="notifications/icon" class="fa fa-fw fa-bell-o unread-count" data-content="{unreadCount.notification}"></i>
						</a>
						<ul class="dropdown-menu" aria-labelledby="notif_dropdown">
							<li>
								<ul component="notifications/list" class="notification-list">
									<li class="loading-text">
										<a href="#"><i class="fa fa-refresh fa-spin"></i> [[global:notifications.loading]]</a>
									</li>
								</ul>
							</li>
							<li class="notif-dropdown-link"><a href="#" class="mark-all-read">[[notifications:mark_all_read]]</a></li>
							<li class="notif-dropdown-link"><a href="{relative_path}/notifications">[[notifications:see_all]]</a></li>
						</ul>
					</li>

					<!-- IF !config.disableChat -->
					<li class="chats dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="{relative_path}/user/{user.userslug}/chats" title="[[global:header.chats]]" id="chat_dropdown" component="chat/dropdown" data-ajaxify="false" role="button">
							<i component="chat/icon" class="fa fa-comment-o fa-fw unread-count" data-content="{unreadCount.chat}"></i> <span class="visible-xs-inline">[[global:header.chats]]</span>
						</a>
						<ul class="dropdown-menu" aria-labelledby="chat_dropdown">
							<li>
								<ul component="chat/list" class="chat-list chats-list">
									<li class="loading-text">
										<a href="#"><i class="fa fa-refresh fa-spin"></i> [[global:chats.loading]]</a>
									</li>
								</ul>
							</li>
							<li class="notif-dropdown-link"><a href="#" class="mark-all-read" component="chats/mark-all-read">[[modules:chat.mark_all_read]]</a></li>
							<li class="notif-dropdown-link"><a href="{relative_path}/user/{user.userslug}/chats">[[modules:chat.see_all]]</a></li>
						</ul>
					</li>
					<!-- ENDIF !config.disableChat -->

					<li id="user_label" class="dropdown">
						<label for="user-control-list-check" class="dropdown-toggle" data-toggle="dropdown" id="user_dropdown" title="[[global:header.profile]]" role="button">
							{buildAvatar(user, "md", true)}
							<span id="user-header-name" class="visible-xs-inline">{user.username}</span>
						</label>
						<input type="checkbox" class="hidden" id="user-control-list-check" aria-hidden="true">
						<ul id="user-control-list" component="header/usercontrol" class="dropdown-menu" aria-labelledby="user_dropdown">
							<li>
								<a component="header/profilelink" href="{relative_path}/user/{user.userslug}">
									<i component="user/status" class="fa fa-fw fa-circle status {user.status}"></i> <span component="header/username">{user.username}</span>
								</a>
							</li>
							<li role="presentation" class="divider"></li>
							<li>
								<a href="#" class="user-status" data-status="online">
									<i class="fa fa-fw fa-circle status online"></i><span <!-- IF user.online -->class="bold"<!-- ENDIF user.online -->> [[global:online]]</span>
								</a>
							</li>
							<li>
								<a href="#" class="user-status" data-status="away">
									<i class="fa fa-fw fa-circle status away"></i><span <!-- IF user.away -->class="bold"<!-- ENDIF user.away -->> [[global:away]]</span>
								</a>
							</li>
							<li>
								<a href="#" class="user-status" data-status="dnd">
									<i class="fa fa-fw fa-circle status dnd"></i><span <!-- IF user.dnd -->class="bold"<!-- ENDIF user.dnd -->> [[global:dnd]]</span>
								</a>
							</li>
							<li>
								<a href="#" class="user-status" data-status="offline">
									<i class="fa fa-fw fa-circle status offline"></i><span <!-- IF user.offline -->class="bold"<!-- ENDIF user.offline -->> [[global:invisible]]</span>
								</a>
							</li>
							<li role="presentation" class="divider"></li>
							<li>
								<a component="header/profilelink/edit" href="{relative_path}/user/{user.userslug}/edit">
									<i class="fa fa-fw fa-edit"></i> <span>[[user:edit-profile]]</span>
								</a>
							</li>
              <li role="presentation" class="divider"></li>
							<li component="user/logout">
								<form method="post" action="{relative_path}/logout">
									<input type="hidden" name="_csrf" value="{config.csrf_token}">
									<input type="hidden" name="noscript" value="true">
									<button type="submit" class="btn btn-link">
										<i class="fa fa-fw fa-sign-out"></i><span> [[global:logout]]</span>
									</button>
								</form>
							</li>
							<li>
								<a component="header/profilelink/settings" href="{relative_path}/user/{user.userslug}/settings">
									<i class="fa fa-fw fa-gear"></i> <span>[[user:settings]]</span>
								</a>
							</li>
							<!-- IF showModMenu -->
							<li role="presentation" class="divider"></li>
							<li class="dropdown-header">[[pages:moderator-tools]]</li>
							<li>
								<a href="{relative_path}/flags">
									<i class="fa fa-fw fa-flag"></i> <span>[[pages:flagged-content]]</span>
								</a>
							</li>
							<li>
								<a href="{relative_path}/post-queue">
									<i class="fa fa-fw fa-list-alt"></i> <span>[[pages:post-queue]]</span>
								</a>
							</li>
							<li>
								<a href="{relative_path}/ip-blacklist">
									<i class="fa fa-fw fa-ban"></i> <span>[[pages:ip-blacklist]]</span>
								</a>
							</li>
							<!-- ENDIF showModMenu -->
						</ul>
					</li>

				</ul>
				<!-- ELSE -->
				<ul id="logged-out-menu" class="nav navbar-nav navbar-right">
					<!-- IF allowRegistration -->
					<li>
						<a href="{relative_path}/register">
							<i class="fa fa-pencil fa-fw hidden-sm hidden-md hidden-lg"></i>
							<span>[[global:register]]</span>
						</a>
					</li>
					<!-- ENDIF allowRegistration -->
					<li>
						<a href="{relative_path}/login">
							<i class="fa fa-sign-in fa-fw hidden-sm hidden-md hidden-lg"></i>
							<span>[[global:login]]</span>
						</a>
					</li>
				</ul>
				<!-- ENDIF config.loggedIn -->
				<!-- IF config.searchEnabled -->
				<ul class="nav navbar-nav navbar-right">
					<li>
						<form id="search-form" class="navbar-form navbar-right hidden-xs" role="search" method="GET">
							<button id="search-button" type="button" class="btn btn-link"><i class="fa fa-search fa-fw" title="[[global:header.search]]"></i></button>
							<div class="hidden" id="search-fields">
								<div class="form-group">
									<input autocomplete="off" type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">
									<a href="#"><i class="fa fa-gears fa-fw advanced-search-link"></i></a>
								</div>
								<button type="submit" class="btn btn-default hide">[[global:search]]</button>
							</div>
						</form>
						<ul id="quick-search-results" class="dropdown-menu quick-search-results hidden">
							<!-- IMPORT partials/quick-search-results.tpl -->
						</ul>
					</li>
					<li class="visible-xs" id="search-menu">
						<a href="{relative_path}/search">
							<i class="fa fa-search fa-fw"></i> [[global:search]]
						</a>
					</li>
				</ul>
				<!-- ENDIF config.searchEnabled -->

				<ul class="nav navbar-nav navbar-right hidden-xs">
					<li>
						<a href="#" id="reconnect" class="hide" title="[[global:reconnecting-message, {config.siteTitle}]]">
							<i class="fa fa-check"></i>
						</a>
					</li>
				</ul>

				<ul class="nav navbar-nav navbar-right pagination-block visible-lg visible-md">
					<li class="dropdown">
						<a><i class="fa fa-angle-double-up pointer fa-fw pagetop"></i></a>
						<a><i class="fa fa-angle-up pointer fa-fw pageup"></i></a>

						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<span class="pagination-text"></span>
						</a>

						<a><i class="fa fa-angle-down pointer fa-fw pagedown"></i></a>
						<a><i class="fa fa-angle-double-down pointer fa-fw pagebottom"></i></a>

						<div class="progress-container">
							<div class="progress-bar"></div>
						</div>

						<ul class="dropdown-menu" role="menu">
							<li>
  								<input type="text" class="form-control" id="indexInput" placeholder="[[global:pagination.enter_index]]">
  							</li>
						</ul>
					</li>
				</ul>

        <!-- IF config.showSiteTitle -->
				<div class="headline">
          <a href="<!-- IF title:url -->{title:url}<!-- ELSE -->{relative_path}/<!-- ENDIF title:url -->">
					<h4 id="headlinetext">
            ~ SECRET-INTERNET.CLUB ~   
          </h4>
				  </a>
        </div>
				<!-- ENDIF config.showSiteTitle -->

				<ul id="main-nav" class="nav navbar-nav">
					{{{each navigation}}}
					<!-- IF function.displayMenuItem, @index -->
					<li class="{navigation.class}">
						<a class="navigation-link" href="{navigation.route}" title="{navigation.title}" <!-- IF navigation.id -->id="{navigation.id}"<!-- ENDIF navigation.id --><!-- IF navigation.properties.targetBlank --> target="_blank"<!-- ENDIF navigation.properties.targetBlank -->>
							<!-- IF navigation.iconClass -->
							<i class="fa fa-fw {navigation.iconClass}" data-content="{navigation.content}"></i>
							<!-- ENDIF navigation.iconClass -->

							<!-- IF navigation.text -->
							<span class="{navigation.textClass}">{navigation.text}</span>
							<!-- ENDIF navigation.text -->
						</a>
					</li>
					<!-- ENDIF function.displayMenuItem -->
					{{{end}}}
				</ul>
        

				<!-- ELSE -->
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="{relative_path}/login">
							<i class="fa fa-sign-in fa-fw hidden-sm hidden-md hidden-lg"></i>
							<span>[[global:login]]</span>
						</a>
					</li>
				</ul>
				<!-- ENDIF !maintenanceHeader -->
			</div>
<script type="text/javascript">
   function WordShuffler(holder,opt){
    var that = this;
    var time = 0;
    this.now;
    this.then = Date.now();
    
    this.delta;
    this.currentTimeOffset = 0;
    
    this.word = null;
    this.currentWord = null;
    this.currentCharacter = 0;
    this.currentWordLength = 0;
  
  
    var options = {
      fps : 20,
      timeOffset : 5,
      textColor : '#ebebeb',
      fontSize : "50px",
      useCanvas : false,
      mixCapital : false,
      mixSpecialCharacters : false,
      needUpdate : true,
      colors : [
        '#c9c9c9'
      ]
    }
  
    if(typeof opt != "undefined"){
      for(key in opt){
        options[key] = opt[key];
      }
    }
  
  
    
    this.needUpdate = true;
    this.fps = options.fps;
    this.interval = 1000/this.fps;
    this.timeOffset = options.timeOffset;
    this.textColor = options.textColor;
    this.fontSize = options.fontSize;
    this.mixCapital = options.mixCapital;
    this.mixSpecialCharacters = options.mixSpecialCharacters;
    this.colors = options.colors;
  
     this.useCanvas = options.useCanvas;
    
    this.chars = [
      'A','B','C','D',
      'E','F','G','H',
      'I','J','K','L',
      'M','N','O','P',
      'Q','R','S','T',
      'U','V','W','X',
      'Y','Z'
    ];
    this.specialCharacters = [
 	    '!','%',
      '&','/','(',')',
      '=','?','_','<',
      '>','^','°','*',
      '#','-',':',';','~'
    ];
  
    if(this.mixSpecialCharacters){
      this.chars = this.chars.concat(this.specialCharacters);
    }
  
    this.getRandomColor = function () {
      var randNum = Math.floor( Math.random() * this.colors.length );
      return this.colors[randNum];
    }
  
    //if Canvas
   
    this.position = {
      x : 0,
      y : 50
    }
  
    //if DOM
    if(typeof holder != "undefined"){
      this.holder = holder;
    }
  
    if(!this.useCanvas && typeof this.holder == "undefined"){
      console.warn('Holder must be defined in DOM Mode. Use Canvas or define Holder');
    }
  
  
    this.getRandCharacter = function(characterToReplace){    
      if(characterToReplace == " "){
        return ' ';
      }
      var randNum = Math.floor(Math.random() * this.chars.length);
      var lowChoice =  -.5 + Math.random();
      var picketCharacter = this.chars[randNum];
      var choosen = picketCharacter.toLowerCase();
      if(this.mixCapital){
        choosen = lowChoice < 0 ? picketCharacter.toLowerCase() : picketCharacter;
      }
      return choosen;
      
    }
  
    this.writeWord = function(word){
      this.word = word;
      this.currentWord = word.split('');
      this.currentWordLength = this.currentWord.length;
  
    }
  
    this.generateSingleCharacter = function (color,character) {
      var span = document.createElement('span');
      span.style.color = color;
      span.innerHTML = character;
      return span;
    }
  
    this.updateCharacter = function (time) {
      
        this.now = Date.now();
        this.delta = this.now - this.then;
  
         
  
        if (this.delta > this.interval) {
          this.currentTimeOffset++;
        
          var word = [];
  
          if(this.currentTimeOffset === this.timeOffset && this.currentCharacter !== this.currentWordLength){
            this.currentCharacter++;
            this.currentTimeOffset = 0;
          }
          for(var k=0;k<this.currentCharacter;k++){
            word.push(this.currentWord[k]);
          }
  
          for(var i=0;i<this.currentWordLength - this.currentCharacter;i++){
            word.push(this.getRandCharacter(this.currentWord[this.currentCharacter+i]));
          }
  
  
          if(that.useCanvas){
            c.clearRect(0,0,stage.x * stage.dpr , stage.y * stage.dpr);
            c.font = that.fontSize + " sans-serif";
            var spacing = 0;
            word.forEach(function (w,index) {
              if(index > that.currentCharacter){
                c.fillStyle = that.getRandomColor();
              }else{
                c.fillStyle = that.textColor;
              }
              c.fillText(w, that.position.x + spacing, that.position.y);
              spacing += c.measureText(w).width;
            });
          }else{
  
            if(that.currentCharacter === that.currentWordLength){
              that.needUpdate = false;
            }
            this.holder.innerHTML = '';
            word.forEach(function (w,index) {
              var color = null
              if(index > that.currentCharacter){
                color = that.getRandomColor();
              }else{
                color = that.textColor;
              }
              that.holder.appendChild(that.generateSingleCharacter(color, w));
            }); 
          }
          this.then = this.now - (this.delta % this.interval);
        }
    }
  
    this.restart = function () {
      this.currentCharacter = 0;
      this.needUpdate = true;
    }
  
    function update(time) {
      time++;
      if(that.needUpdate){
        that.updateCharacter(time);
      }
      requestAnimationFrame(update);
    }
  
    this.writeWord(this.holder.innerHTML);
  
  
    console.log(this.currentWord);
    update(time);
  }
  
  
  
  
  var headlinetext = document.getElementById('headlinetext');
  var text = document.getElementById('text');
  var shuffler = document.getElementById('shuffler');
  
  var headText = new WordShuffler(headlinetext,{
    textColor : '#ebebeb',
    timeOffset : 3,
    mixCapital : true,
    mixSpecialCharacters : true
  });
  </script>