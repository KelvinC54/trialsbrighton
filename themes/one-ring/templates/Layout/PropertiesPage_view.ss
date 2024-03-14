<style>
    .photo-viewer {
        position: relative;
        width: 710px; /* Adjust the width as per your photo size */
        margin: 0 auto; /* Center the photo viewer horizontally */
    }

    .current-photo {
        display: block;
        max-width: 100%;
        height: auto;
    }

    .prev-photo,
    .next-photo {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: transparent;
        border: none;
        font-size: 24px;
        cursor: pointer;
    }

    .prev-photo {
        left: 0;
    }

    .next-photo {
        right: 0;
    }

    .agent-card {
        display: flex;
        align-items: center;
        border: 1px solid #ccc; /* Optional: Add border for styling */
        padding: 10px;
        width: 100%; /* Make the card span the entire width */
        box-sizing: border-box; /* Ensure padding is included in width calculation */
    }

    .agent-card img {
        max-width: 100px; /* Adjust this as needed */
        margin-right: 20px; /* Adjust this as needed */
    }

    .agent-details {
        flex-grow: 1;
    }

    .contact-button {
        display: inline-block;
        padding: 8px 20px;
        background-color: #ffe77a; /* Adjust the color as needed */
        color: black;
        text-decoration: none;
        border-radius: 5px;
        margin-top: 10px;
    }

    .facility-cards {
        display: flex;
        flex-wrap: wrap;
        justify-content: space-between;
    }

    .facility-card {
        flex-basis: calc(33.33% - 10px); /* 33.33% width for each card, minus margin */
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        display: flex;
        align-items: center;
    }

    /* Optional: To adjust the spacing between the cards */
    .facility-card:nth-child(3n + 1) {
        margin-right: 10px;
    }

    .facility-card:nth-child(3n) {
        margin-left: 10px;
    }

    /* Adjust styles as needed */
    .facility-card h4 {
        margin: 0 0 0 10px;
    }

    /* Optional: Adjust icon styles */
    .facility-card i {
        font-size: 24px;
        color: #007bff; /* Adjust icon color */
    }


</style>

<!-- BEGIN CONTENT WRAPPER -->
<div class="content">
	<div class="container">
		<div class="row">

			<!-- BEGIN MAIN CONTENT -->
			<div class="main col-sm-8">

                <%-- <div class="blog-main-image">
                    <% with $PrimaryPhoto.SetWidth(710) %>
                        <img src="$URL" width="$Width" height="$Height" class="my-custom-class">
                    <% end_with %>
					<div class="tag"><i class="fa fa-file-text"></i></div>
				</div> --%>
                <% with $Property %>
                    <div class="blog-main-image photo-viewer">
                        <button class="prev-photo">&lt;</button>
                        <img src="$PrimaryPhoto.URL" alt="$PrimaryPhoto.Title" width="710" height="auto" class="current-photo">
                        <button class="next-photo">&gt;</button>
                        <% if $FeaturedOnHomepage %>
                            <div class="tag" style="background-color: #ffe77a; color: black;"><i class="fa fa-file-text"></i> Featured On Homepage</div>
                        <% end_if %>
                    </div>

                    <div class="blog-bottom-info" style="margin-top:2%;">
                        <ul>
                            <li><i class="fa fa-calendar"></i> $Created.Long</li>
                            <li><i class="fa fa-bed"></i> $Bedrooms Bedroom(s)</li>
                            <li><i class="fa fa-bath"></i> $Bathrooms Bathroom(s)</li>
                        </ul>
                    </div>

                    <h1 class="blog-title" style="margin-bottom:1%; margin-top:2%;">$Address No. $AdrressNumber</h1>
                    <h2 class="">$ $PricePerNight</h2>
                <% end_with %>

				<div class="post-content">
                    <% with $Property %>
                        <h2 class="section-title" style="margin-top:7%;">Property Detail</h2>

                        <table style="width: 50%; border-collapse: collapse;">
                            <tbody>
                                <tr>
                                    <th>Title</th>
                                    <td></td>
                                    <td> $Title</td>
                                </tr>
                                <tr>
                                    <th>Address</th>
                                    <td></td>
                                    <td> $Address</td>
                                </tr>
                                <tr>
                                    <th>Address Number</th>
                                    <td></td>
                                    <td> $AdrressNumber</td>
                                </tr>
                                <tr>
                                    <th>City</th>
                                    <td></td>
                                    <td> $City</td>
                                </tr>
                                <tr>
                                    <th>Tipe</th>
                                    <td></td>
                                    <td> $PropertyType</td>
                                </tr>
                                <tr>
                                    <th>Transaksi</th>
                                    <td></td>
                                    <td> $TransactionType</td>
                                </tr>
                                    <tr>
                                    <th>Kamar Tidur</th>
                                    <td></td>
                                    <td> $Bedrooms</td>
                                </tr>
                                </tr>
                                    <tr>
                                    <th>Kamar Mandi</th>
                                    <td></td>
                                    <td> $Bathrooms</td>
                                </tr>
                            </tbody>
                        </table>

                        <h2 class="section-title" style="margin-top:7%;">Description</h2>
                        $Description
                    <% end_with %>

                    <h2 class="section-title" style="margin-top:2%;">Facilities</h2>
                    <div class="facility-cards">
                        <% loop $Facilities %>
                            <div class="facility-card">
                                <img src="$Icon.URL" alt="$Title Icon">
                                <h4>$Title</h4>
                            </div>
                        <% end_loop %>
                        <!-- Add more facility cards as needed -->
                    </div>


                    <h2 class="section-title" style="margin-top:2%;">Agent Contact</h2>
                    <% loop $Agents %>
                        <div class="agent-card" style="margin-top:1%;">
                            <img src="$ProfilePicture.URL" alt="Agent Photo">
                            <div class="agent-details">
                                <h3>$Name</h3>
                                <p>$Description</p>
                                <a target="_blank" href="https://wa.me/$NoTelepon" class="contact-button">Contact Agent</a>
                            </div>
                        </div>
                    <% end_loop %>
				</div>

				<div class="share-wraper col-sm-12 clearfix" style="margin-top:3%;">
					<h5>Share this Property :</h5>
					<ul class="social-networks">
						<li><a target="_blank" href="http://www.facebook.com/sharer.php?s=100&amp;p%5Burl%5D=http%3A%2F%2Fwww.wiselythemes.com%2Fhtml%2Fcozy%2Fblog-detail.html%3Ffb%3Dtrue&amp;p%5Bimages%5D%5B0%5D=http%3A%2F%2Fwww.wiselythemes.com%2Fhtml%2Fcozy%2Fimages%2Fnews-img1.jpg&amp;p%5Btitle%5D=Cozy%20Blog%20Post"><i class="fa fa-facebook"></i></a></li>
						<li><a target="_blank" href="https://twitter.com/intent/tweet?url=http://www.wiselythemes.com/html/cozy/blog-detail.html&amp;text=Cozy%20Blog%20Post"><i class="fa fa-twitter"></i></a></li>
						<li><a target="_blank" href="https://plus.google.com/share?url=http://www.wiselythemes.com/html/cozy/blog-detail.html"><i class="fa fa-google"></i></a></li>
						<li><a target="_blank" href="http://pinterest.com/pin/create/button/?url=http://www.wiselythemes.com/html/cozy/blog-detail.html&amp;description=Cozy%20Blog%20Post&amp;media=http%3A%2F%2Fwww.wiselythemes.com%2Fhtml%2Fcozy%2Fimages%2Fnews-img1.jpg"><i class="fa fa-pinterest"></i></a></li>
						<li><a href="mailto:?subject=Check%20out%20this%20blog%20post%20from%20Cozy%20Real%20Estate!&amp;body=http://www.wiselythemes.com/html/cozy/blog-detail.html"><i class="fa fa-envelope"></i></a></li>
					</ul>

					<a class="print-button" href="javascript:window.print();">
						<i class="fa fa-print"></i>
					</a>
				</div>
			</div>
			<!-- END MAIN CONTENT -->

			<!-- BEGIN SIDEBAR -->
			<div class="sidebar gray col-sm-4">

				<h2 class="section-title">Categories</h2>
				<ul class="categories">
					<li><a href="#">Business <span>(2)</span></a></li>
					<li><a href="#">Commercial <span>(1)</span></a></li>
					<li><a href="#">Land <span>(3)</span></a></li>
					<li><a href="#">Loans <span>(2)</span></a></li>
					<li><a href="#">News and Updates <span>(6)</span></a></li>
					<li><a href="#">Properties for Sale <span>(1)</span></a></li>
					<li><a href="#">Real Estate <span>(1)</span></a></li>
				</ul>

				<!-- BEGIN ARCHIVES ACCORDION -->
				<h2 class="section-title">Archives</h2>
				<div id="accordion" class="panel-group blog-accordion">
					<div class="panel">
						<div class="panel-heading">
							<div class="panel-title">
								<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="">
									<i class="fa fa-chevron-right"></i> 2014 (15)
								</a>
							</div>
						</div>
						<div id="collapseOne" class="panel-collapse collapse in">
							<div class="panel-body">
								<ul>
									<li><a href="#">July (3)</a></li>
									<li><a href="#">June (4)</a></li>
									<li><a href="#">May (1)</a></li>
									<li><a href="#">April (2)</a></li>
									<li><a href="#">March (3)</a></li>
									<li><a href="#">February (1)</a></li>
									<li><a href="#">January (1)</a></li>
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
				<h2 class="section-title">Tags</h2>
				<ul class="tags col-sm-12">
					<li><a href="#">Apartments</a></li>
					<li><a href="#">Residential</a></li>
					<li><a href="#">News</a></li>
					<li><a href="#">Real estate</a></li>
					<li><a href="#">Land</a></li>
					<li><a href="#">Business</a></li>
					<li><a href="#">Villas</a></li>
					<li><a href="#">Loans</a></li>
					<li><a href="#">Commercial</a></li>
					<li><a href="#">Rent</a></li>
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

			</div>
			<!-- END SIDEBAR -->
		</div>
	</div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const photos = [
            "$Property.PrimaryPhoto.URL",
            "$Property.Photo2.URL",
            "$Property.Photo3.URL",
            "$Property.Photo4.URL",
            "$Property.Photo5.URL"
        ];

        let currentPhotoIndex = 0;
        const photoElement = document.querySelector('.photo-viewer img');

        function showPhoto(index) {
            photoElement.src = photos[index];
        }

        showPhoto(currentPhotoIndex);

        document.querySelector('.prev-photo').addEventListener('click', function () {
            currentPhotoIndex = (currentPhotoIndex - 1 + photos.length) % photos.length;
            showPhoto(currentPhotoIndex);
        });

        document.querySelector('.next-photo').addEventListener('click', function () {
            currentPhotoIndex = (currentPhotoIndex + 1) % photos.length;
            showPhoto(currentPhotoIndex);
        });
    });
</script>
