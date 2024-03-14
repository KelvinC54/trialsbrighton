<!-- BEGIN PAGE TITLE/BREADCRUMB -->
<% include Banner %>
<!-- END PAGE TITLE/BREADCRUMB -->

<!-- BEGIN CONTENT -->
<div class="content">
    <div class="container">
        <div class="row">
            <div class="main col-sm-8">
                <% with $Region %>
                    <div class="blog-main-image">
                        $Photo.SetWidth(750)
                    </div>
                    <p>$Description</p>
                <% end_with %>
            </div>

            <div class="sidebar gray col-sm-4">
                <h2 class="section-title">Regions</h2>
                <ul class="categories subnav">
                    <% loop $Regions %>
                    <li class="$LinkingMode">
                        <a href="$Link" class="$LinkingMode">$Title</a>
                    </li>
                    <% end_loop %>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->