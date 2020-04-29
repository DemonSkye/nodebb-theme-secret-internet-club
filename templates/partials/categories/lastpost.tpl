<div class="card" style="border-color: {../bgColor}">
	{{{each ./posts}}}
	<!-- IF @first -->
	<div component="category/posts">
			<a href="{config.relative_path}/user/{../user.userslug}">{buildAvatar(posts.user, "sm", true)}</a>
			<div class="title">
			    <a href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">{../topic.title}</a>
			    - <small class="timeago" title="{../timestampISO}"></small>
			</div>
		<div class="post-content">
			{../content}
		</div>
	</div>
	<!-- ENDIF @first -->
	{{{end}}}

	<!-- IF !../posts.length -->
	<div component="category/posts">
		<div class="post-content">
			[[category:no_new_posts]]
		</div>
	</div>
	<!-- ENDIF !../posts.length -->
</div>

