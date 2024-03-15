<!-- BEGIN CONTENT WRAPPER -->
<div class="content">
	<div class="container">
		<div class="row">

			<!-- BEGIN MAIN CONTENT -->
			<div class="main col-sm-8">
				<div id="blog-listing" class="list-style clearfix">
					<div class="row">

                        <h3 style="margin-bottom : 1%">Filtering Article with tag: $Tag.Title</h3>
                        <% loop $ArticlesWithTag %>
                            <div class="item col-md-6">
                                <div class="image">
                                    <a href="$Link">
                                        <span class="btn btn-default">Read More</span>
                                    </a>
                                    $Photo.CroppedImage(242,156)
                                </div>
                                <div class="tag"><i class="fa fa-file-text"></i></div>
                                <div class="info-blog">
                                    <ul class="top-info">
                                        <li><i class="fa fa-calendar"></i>$Date.Long</li>
                                        <li><i class="fa fa-comments-o"></i> 2</li>
                                        <li><i class="fa fa-tags"></i> $CategoriesList</li>
                                    </ul>
                                    <h3>
                                        <a href="$Link">$Title</a>
                                    </h3>
                                    <p>
                                    <% if $Teaser%>
                                        $Teaser
                                    <% else %>
                                        $Content.FirstSentence
                                    <% end_if %>
                                    </p>
                                </div>
                            </div>
                        <% end_loop %>
					</div>
				</div>

			</div>
			<!-- END MAIN CONTENT -->


			<!-- BEGIN SIDEBAR -->
			<%-- <div class="sidebar gray col-sm-4">

				<h2 class="section-title">Categories</h2>
				<ul class="categories">
					<% loop $Categories %>
                    <li><a href="$Link">$Title <span>($Articles.count)</span></a></li>
                    <% end_loop %>
				</ul>

                <h2 class="section-title">Tags</h2>
				<ul class="tags">
					<% loop $Tags %>
                    <li><a href="$Link">$Title <span>($Articles.count)</span></a></li>
                    <% end_loop %>
				</ul>

				<!-- BEGIN ARCHIVES ACCORDION -->
				<h2 class="section-title">Archives</h2>
				<div id="accordion" class="panel-group blog-accordion">
					<div class="panel">
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<ul>
                                    <% loop $ArchiveDates %>
									<li><a href="$Link">$MonthName $Year ($ArticleCount)</a></li>
                                    <% end_loop %>
								</ul>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<div class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" class="collapsed">
									<i class="fa fa-chevron-right"></i> 2013 (6)
								</a>
							</div>
						</div>
						<div id="collapseTwo" class="panel-collapse collapse">
							<div class="panel-body">
								<ul>
									<li><a href="#">May (1)</a></li>
									<li><a href="#">April (2)</a></li>
									<li><a href="#">March (1)</a></li>
									<li><a href="#">February (2)</a></li>
									<li><a href="#">January (1)</a></li>
								</ul>
							</div>
						</div>
					</div>

					<div class="panel">
						<div class="panel-heading">
							<div class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseThree" class="collapsed">
									<i class="fa fa-chevron-right"></i> 2012 (5)
								</a>
							</div>
						</div>
						<div id="collapseThree" class="panel-collapse collapse">
							<div class="panel-body">
								<ul>
									<li><a href="#">April (1)</a></li>
									<li><a href="#">March (1)</a></li>
									<li><a href="#">February (2)</a></li>
									<li><a href="#">January (1)</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- END  ARCHIVES ACCORDION -->


				<!-- BEGIN TAGS -->
				<h2 class="section-title">Regions</h2>
				<ul class="tags col-sm-12">
					<% loop $Regions %>
                        <li><a href="$ArticlesLink">$Title <span>($Articles.count)</span></a></li>
                    <% end_loop %>
				</ul>
				<!-- BEGIN TAGS -->


				<!-- BEGIN LATEST NEWS -->
				<h2 class="section-title">Latest News</h2>
				<ul class="latest-news">
					<li class="col-md-12">
						<div class="image">
							<a href="blog-detail.html"></a>
							<img src="http://placehold.it/100x100" alt="" />
						</div>

						<ul class="top-info">
							<li><i class="fa fa-calendar"></i> July 30, 2014</li>
						</ul>

						<h3><a href="blog-detail.html">How to get your dream property for the best price?</a></h3>
					</li>
					<li class="col-md-12">
						<div class="image">
							<a href="blog-detail.html"></a>
							<img src="http://placehold.it/100x100" alt="" />
						</div>

						<ul class="top-info">
							<li><i class="fa fa-calendar"></i> July 24, 2014</li>
						</ul>

						<h3><a href="blog-detail.html">7 tips to get the best mortgage.</a></h3>
					</li>
					<li class="col-md-12">
						<div class="image">
							<a href="blog-detail.html"></a>
							<img src="http://placehold.it/100x100" alt="" />
						</div>

						<ul class="top-info">
							<li><i class="fa fa-calendar"></i> July 05, 2014</li>
						</ul>

						<h3><a href="blog-detail.html">House, location or price: What's the most important factor?</a></h3>
					</li>
				</ul>
				<!-- END LATEST NEWS -->

			</div> --%>
			<!-- END SIDEBAR -->

		</div>
	</div>
</div>