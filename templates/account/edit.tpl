<div class="account">
	<!-- IF breadcrumbs.length -->
<ol class="breadcrumb" itemscope="itemscope" itemprop="breadcrumb" itemtype="http://schema.org/BreadcrumbList">
	{{{each breadcrumbs}}}
	<li<!-- IF @last --> component="breadcrumb/current"<!-- ENDIF @last --> itemscope="itemscope" itemprop="itemListElement" itemtype="http://schema.org/ListItem" <!-- IF @last -->class="active"<!-- ENDIF @last -->>
		<meta itemprop="position" content="@index" />
		<!-- IF !@last --><a href="{breadcrumbs.url}" itemprop="item"><!-- ENDIF !@last -->
			<span itemprop="name">
				{breadcrumbs.text}
				<!-- IF @last -->
				<!-- IF !feeds:disableRSS -->
				<!-- IF rssFeedUrl --><a target="_blank" href="{rssFeedUrl}" itemprop="item"><i class="fa fa-rss-square"></i></a><!-- ENDIF rssFeedUrl --><!-- ENDIF !feeds:disableRSS -->
				<!-- ENDIF @last -->
			</span>
		<!-- IF !@last --></a><!-- ENDIF !@last -->
	</li>
	{{{end}}}
</ol>
<!-- ENDIF breadcrumbs.length -->


<div class="cover" component="account/cover" style="background-image: url({cover:url}); background-position: {cover:position};">
	<div class="avatar-wrapper" data-uid="{uid}">
		<!-- IF picture -->
		<img src="{picture}" class="avatar avatar-xl avatar-rounded" />
		<!-- ELSE -->
		<div class="avatar avatar-xl avatar-rounded" style="background-color: {icon:bgColor};" title="{username}">{icon:text}</div>
		<!-- ENDIF picture -->
		<i component="user/status" class="fa fa-circle status {status}" title="[[global:{status}]]"></i>

		<!-- IF loggedIn -->
		<!-- IF !isSelf -->
		<button class="btn-morph fab <!-- IF isFollowing -->heart<!-- ELSE -->plus<!-- ENDIF isFollowing -->" title="<!-- IF isFollowing -->[[global:unfollow]]<!-- ELSE -->[[global:follow]]<!-- ENDIF isFollowing -->">
			<span>
				<span class="s1"></span>
				<span class="s2"></span>
				<span class="s3"></span>
			</span>
		</button>
		<!-- ENDIF !isSelf -->
		<!-- ENDIF loggedIn -->
	</div>

	<div class="container">
		<div class="btn-group account-fab bottom-sheet">
	<button type="button" class="fab dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		<i class="fa fa-ellipsis-v"></i>
	</button>
	<ul class="dropdown-menu dropdown-menu-right">
		<!-- IF loggedIn -->
		<!-- IF !isSelf -->
		<!-- IF !banned -->
		<!-- IF !config.disableChat -->
		<li class="<!-- IF !hasPrivateChat -->hidden<!-- ENDIF !hasPrivateChat -->">
			<a component="account/chat" href="#">[[user:chat_with, {username}]]</a>
		</li>
		<li>
			<a component="account/new-chat" href="#">[[user:new_chat_with, {username}]]</a>
		</li>
		<!-- ENDIF !config.disableChat -->
		<li>
			<a component="account/flag" href="#">[[user:flag-profile]]</a>
		</li>
		<li>
			<a component="account/block" href="#"><!-- IF !../isBlocked -->[[user:block_user]]<!-- ELSE -->[[user:unblock_user]]<!-- END --></a>
		</li>
		<li class="divider"></li>
		<!-- ENDIF !banned -->
		<!-- ENDIF !isSelf -->
		<!-- ENDIF loggedIn -->
		<li>
			<a href="{config.relative_path}/user/{userslug}" class="inline-block" id="profile">[[user:profile]]</a>
		</li>
		<!-- IF showHidden -->
		<li><a href="{config.relative_path}/user/{userslug}/edit">[[user:edit]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/settings">[[user:settings]]</a></li>
		<!-- ENDIF showHidden -->

		<!-- IF !isSelf -->
		<!-- IF canBan -->
		<li class="<!-- IF banned -->hide<!-- ENDIF banned -->">
			<a component="account/ban" href="#">[[user:ban_account]]</a>
		</li>
		<li class="<!-- IF !banned -->hide<!-- ENDIF !banned -->">
			<a component="account/unban" href="#">[[user:unban_account]]</a>
		</li>
		<!-- ENDIF canBan -->
		<!-- IF isAdmin -->
		<li>
			<a component="account/delete" href="#" class="">[[user:delete_account]]</a>
		</li>
		<!-- ENDIF isAdmin -->
		<!-- ENDIF !isSelf -->

		<li class="divider"></li>
		<li><a href="{config.relative_path}/user/{userslug}/following">[[user:following]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/followers">[[user:followers]]</a></li>
		<!-- IF showHidden -->
		<li><a href="{config.relative_path}/user/{userslug}/blocks">[[user:blocks]]</a></li>
		<!-- ENDIF showHidden -->
		<li class="divider"></li>
		<li><a href="{config.relative_path}/user/{userslug}/topics">[[global:topics]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/posts">[[global:posts]]</a></li>
		<!-- IF !reputation:disabled -->
		<li><a href="{config.relative_path}/user/{userslug}/best">[[global:best]]</a></li>
		<!-- ENDIF !reputation:disabled -->
		<li><a href="{config.relative_path}/user/{userslug}/groups">[[global:header.groups]]</a></li>

		<!-- IF showHidden -->
		<li><a href="{config.relative_path}/user/{userslug}/categories">[[user:watched_categories]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/bookmarks">[[user:bookmarks]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/watched">[[user:watched]]</a></li>
		<li><a href="{config.relative_path}/user/{userslug}/ignored">[[user:ignored]]</a></li>
		<!-- IF !reputation:disabled -->
		<li><a href="{config.relative_path}/user/{userslug}/upvoted">[[global:upvoted]]</a></li>
		<!-- IF !downvote:disabled -->
		<li><a href="{config.relative_path}/user/{userslug}/downvoted">[[global:downvoted]]</a></li>
		<!-- ENDIF !downvote:disabled -->
		<!-- ENDIF !reputation:disabled -->
		<li><a href="{config.relative_path}/user/{userslug}/uploads">[[global:uploads]]</a></li>
		<!-- ENDIF showHidden -->

		{{{each profile_links}}}
		<!-- IF @first -->
		<li class="divider"></li>
		<!-- ENDIF @first -->
		<li id="{profile_links.id}" class="plugin-link <!-- IF profile_links.public -->public<!-- ELSE -->private<!-- ENDIF profile_links.public -->"><a href="{config.relative_path}/user/{userslug}/{profile_links.route}"><!-- IF ../icon --><i class="fa fa-fw {profile_links.icon}"></i> <!-- END -->{profile_links.name}</a></li>
		{{{end}}}
	</ul>
</div>


		<!-- IF allowCoverPicture -->
		<!-- IF canEdit -->
		<div class="controls">
			<span class="upload"><i class="fa fa-fw fa-4x fa-upload"></i></span>
			<span class="resize"><i class="fa fa-fw fa-4x fa-arrows"></i></span>
			<span class="remove"><i class="fa fa-fw fa-4x fa-times"></i></span>
		</div>
		<div class="save">[[groups:cover-save]] <i class="fa fa-fw fa-floppy-o"></i></div>
		<div class="indicator">[[groups:cover-saving]] <i class="fa fa-fw fa-refresh fa-spin"></i></div>
		<!-- ENDIF canEdit -->
		<!-- ENDIF allowCoverPicture -->
	</div>
</div>

	<!-- IF sso.length --><div><!-- ENDIF sso.length -->
		<div class="row">
			<div class="col-md-2 col-sm-4">
				<div class="account-picture-block text-center">
					<div class="row">
						<div class="col-xs-12 hidden-xs">
							<!-- IF picture -->
							<img id="user-current-picture" class="avatar avatar-xl avatar-rounded" src="{picture}" />
							<!-- ELSE -->
							<div class="avatar avatar-xl avatar-rounded" style="background-color: {icon:bgColor};">{icon:text}</div>
							<!-- ENDIF picture -->
						</div>
					</div>
					<ul class="list-group">
						<!-- IF allowProfilePicture -->
						<a id="changePictureBtn" href="#" class="list-group-item">[[user:change_picture]]</a>
						<!-- ENDIF allowProfilePicture -->
						<!-- IF !username:disableEdit -->
						<a href="{config.relative_path}/user/{userslug}/edit/username" class="list-group-item">[[user:change_username]]</a>
						<!-- ENDIF !username:disableEdit -->
						<!-- IF !email:disableEdit -->
						<a href="{config.relative_path}/user/{userslug}/edit/email" class="list-group-item">[[user:change_email]]</a>
						<!-- ENDIF !email:disableEdit -->
						<!-- IF canChangePassword -->
						<a href="{config.relative_path}/user/{userslug}/edit/password" class="list-group-item">[[user:change_password]]</a>
						<!-- ENDIF canChangePassword -->
						{{{each editButtons}}}
						<a href="{config.relative_path}{editButtons.link}" class="list-group-item">{editButtons.text}</a>
						{{{end}}}
					</ul>

					<!-- IF config.requireEmailConfirmation -->
					<!-- IF email -->
					<!-- IF isSelf -->
					<a id="confirm-email" href="#" class="btn btn-warning <!-- IF email:confirmed -->hide<!-- ENDIF email:confirmed -->">[[user:confirm_email]]</a><br/><br/>
					<!-- ENDIF isSelf -->
					<!-- ENDIF email -->
					<!-- ENDIF config.requireEmailConfirmation -->

					<!-- IF allowAccountDelete -->
					<!-- IF isSelf -->
					<a id="deleteAccountBtn" href="#" class="btn btn-danger">[[user:delete_account]]</a><br/><br/>
					<!-- ENDIF isSelf -->
					<!-- ENDIF allowAccountDelete -->

				</div>
			</div>

			<div class="<!-- IF !sso.length -->col-md-9 col-sm-8<!-- ELSE -->col-md-5 col-sm-4<!-- ENDIF !sso.length -->">
				<div>
					<form class='form-horizontal'>

						<div class="control-group">
							<label class="control-label" for="inputFullname">[[user:fullname]]</label>
							<div class="controls">
								<input class="form-control" type="text" id="inputFullname" placeholder="[[user:fullname]]" value="{fullname}">
							</div>
						</div>
						<!-- IF allowWebsite -->
						<div class="control-group">
							<label class="control-label" for="inputWebsite">[[user:website]]</label>
							<div class="controls">
								<input class="form-control" type="text" id="inputWebsite" placeholder="http://..." value="{website}">
							</div>
						</div>
						<!-- ENDIF allowWebsite -->

						<div class="control-group">
							<label class="control-label" for="inputLocation">[[user:location]]</label>
							<div class="controls">
								<input class="form-control" type="text" id="inputLocation" placeholder="[[user:location]]" value="{location}">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="inputBirthday">[[user:birthday]]</label>
							<div class="controls">
								<input class="form-control" id="inputBirthday" value="{birthday}" placeholder="mm/dd/yyyy">
							</div>
						</div>

						<div class="control-group">
							<label class="control-label" for="grouptitle">[[user:grouptitle]]</label>
							<div class="controls">

								<select class="form-control" id="groupTitle" data-property="groupTitle" <!-- IF allowMultipleBadges --> size="{groupSelectSize}" multiple<!-- ENDIF allowMultipleBadges -->>
									{{{each groups}}}
									<!-- IF groups.userTitleEnabled -->
									<option value="{groups.displayName}" <!-- IF groups.selected -->selected<!-- ENDIF groups.selected -->>{groups.userTitle}</option>
									<!-- ENDIF groups.userTitleEnabled -->
									{{{end}}}
									<option value="">[[user:no-group-title]]</option>
								</select>
								<!-- IF allowMultipleBadges -->
								<span>[[user:group-order-help]]</span>
								<i role="button" component="group/order/up" class="fa fa-chevron-up"></i> <i role="button" component="group/order/down" class="fa fa-chevron-down"></i>
								<!-- ENDIF -->
							</div>
						</div>

						<!-- IF allowAboutMe -->
						<div class="control-group">
							<label class="control-label" for="inputAboutMe">[[user:aboutme]]</label> <small><label id="aboutMeCharCountLeft"></label></small>
							<div class="controls">
								<textarea class="form-control" id="inputAboutMe" rows="5">{aboutme}</textarea>
							</div>
						</div>
						<!-- ENDIF allowAboutMe -->

						<!-- IF allowSignature -->
						<!-- IF !disableSignatures -->
						<div class="control-group">
							<label class="control-label" for="inputSignature">[[user:signature]]</label> <small><label id="signatureCharCountLeft"></label></small>
							<div class="controls">
								<textarea class="form-control" id="inputSignature" rows="5">{signature}</textarea>
							</div>
						</div>
						<!-- ENDIF !disableSignatures -->
						<!-- ENDIF allowSignature -->

						<input type="hidden" id="inputUID" value="{uid}"><br />

						<div class="form-actions">
							<a id="submitBtn" href="#" class="btn btn-primary">[[global:save_changes]]</a>
						</div>

					</form>
				</div>

				<hr class="visible-xs visible-sm"/>
			</div>

			<!-- IF sso.length -->
			<div class="col-md-5 col-sm-4">
				<label class="control-label">[[user:sso.title]]</label>
				<div class="list-group">
					{{{each sso}}}
					<div class="list-group-item">
						<!-- IF ../deauthUrl -->
						<a class="btn btn-default btn-xs pull-right" href="{../deauthUrl}">[[user:sso.dissociate]]</a>
						<!-- END -->
						<a href="{../url}" target="<!-- IF ../associated -->_blank<!-- ELSE -->_top<!-- ENDIF ../associated -->">
							<!-- IF ../icon --><i class="fa {../icon}"></i><!-- ENDIF ../icon -->
							<!-- IF ../associated -->[[user:sso.associated]]<!-- ELSE -->[[user:sso.not-associated]]<!-- ENDIF ../associated -->
							{../name}
						</a>
					</div>
					{{{end}}}
				</div>
			</div>
			<!-- ENDIF sso.length -->
		</div>
	<!-- IF sso.length --></div><!-- ENDIF sso.length -->
</div>


