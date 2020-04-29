<!DOCTYPE html>
<html lang="{function.localeToHTML, userLang, defaultLang}" <!-- IF languageDirection -->data-dir="{languageDirection}" style="direction: {languageDirection};" <!-- ENDIF languageDirection --> >
<head>
   <title>{browserTitle}</title>
   {{{each metaTags}}}{function.buildMetaTag}{{{end}}}
   <link rel="stylesheet" type="text/css" href="{relative_path}/assets/client<!-- IF bootswatchSkin -->-{bootswatchSkin}<!-- END -->.css?{config.cache-buster}" />
   {{{each linkTags}}}{function.buildLinkTag}{{{end}}}
   <script>
      var RELATIVE_PATH = "{relative_path}";
      var config = JSON.parse('{{configJSON}}');
      var app = {
              template: "{template.name}",
              user: JSON.parse('{{userJSON}}')
      };
   </script>
   <!-- IF useCustomHTML -->
   {{customHTML}}
   <!-- END -->
   <!-- IF useCustomCSS -->
   <style>{{customCSS}}</style>
   <!-- END -->
</head>
<body class="{bodyClass} skin-<!-- IF bootswatchSkin -->{bootswatchSkin}<!-- ELSE -->noskin<!-- END -->">
   <input type="checkbox" class="openSidebarMenu" id="openSidebarMenu">
   <label for="openSidebarMenu" class="sidebarIconToggle">
      <div class="spinner diagonal part-1"></div>
      <div class="spinner horizontal"></div>
      <div class="spinner diagonal part-2"></div>
   </label>
   <div id="sidebarMenu">
      <ul class="sidebarMenuInner">
        <!-- IF config.loggedIn -->
          <div class="menu-profile">
	        <!-- IF user.uid -->
  	      {buildAvatar(user, "lg", true, "user-icon")}
  	      <!-- ENDIF user.uid -->
        </div>
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
            <li>
               <a component="header/profilelink/edit" href="{relative_path}/user/{user.userslug}/edit">
               <i class="fa fa-fw fa-edit"></i> <span>[[user:edit-profile]]</span>
               </a>
            </li>
            <li>
               <a component="header/profilelink/settings" href="{relative_path}/user/{user.userslug}/settings">
               <i class="fa fa-fw fa-gear"></i> <span>[[user:settings]]</span>
               </a>
            </li>
            <li>
               <a component="header/profilelink/settings" href="{relative_path}/user/{user.userslug}/chats">
               <i class="fa fa-comment-o fa-fw unread-count"></i> <span>[[user:chats]]</span>
               </a>
            </li>
					 <li component="user/logout" class="leftnavmenu">
						      <form method="post" action="{relative_path}/logout">
									<input type="hidden" name="_csrf" value="{config.csrf_token}">
									<input type="hidden" name="noscript" value="true">
										<i class="fa fa-fw fa-sign-out"></i>
                    <span> Logout</span>
								</form>
							</li>
         </ul>
         <!-- ELSE -->
         <ul id="main-nav" class="nav navbar-nav">
         <li><a href="{relative_path}/register">Register</a></li>
         <li><a href="{relative_path}/login">Login</a></li>
         </ul>
         <!-- ENDIF config.loggedIn -->
         
         
      </ul>
   </div>
   <nav class="navbar navbar-default navbar-fixed-top header" id="header-menu" component="navbar">
      <div class="container">
         <!-- IMPORT partials/menu.tpl -->
      </div>
   </nav>
   <div class="container" id="content">
   <!-- IMPORT partials/noscript/warning.tpl -->

