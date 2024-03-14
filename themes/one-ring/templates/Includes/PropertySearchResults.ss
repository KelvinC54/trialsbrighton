<style>
    .form-field {
        margin-bottom: 11%; /* Adjust as needed */
    }

    .form-field-inner {
        margin-top: 0%; /* Adjust as needed */
    }
</style>
<!-- BEGIN PROPERTY LISTING -->
<div id="property-listing" class="list-style clearfix"> <!-- Inject "grid-style1" for grid view-->
    <div class="row">
        <% if $Results %>
            <h3>Showing $Results.PageLength results ($Results.getTotalItems total)</h3>
            <br>
            <% loop $Results %>
            <div class="item col-md-4"><!-- Set width to 4 columns for grid view mode only -->
                <div class="image">
                    <a href="$Link">
                        <span class="btn btn-default"><i class="fa fa-file-o"></i> Details</span>
                    </a>
                    $PrimaryPhoto.CroppedImage(760,670)
                </div>
                <div class="price">
                    <span>$PricePerNight.Nice</span>
                    <p>per night
                    <p>
                </div>
                <div class="info">
                    <h3>
                        <a href="$Link">$Title</a>
                        <small>$Address No. $AdrressNumber</small>
                        <small>$City</small>
                        <%-- <small>Available $AvailableStart.Nice - $AvailableEnd.Nice</small> --%>
                    </h3>
                    <p>$Description.LimitSentences(2)</p>

                    <ul class="amenities">
                        <li><i class="icon-bedrooms"></i> $Bedrooms</li>
                        <li><i class="icon-bathrooms"></i> $Bathrooms</li>
                    </ul>
                </div>
            </div>
            <% end_loop %>
        <% else %>
            <h3>There are no properties that match your search</h3>
        <% end_if %>
    </div>
</div>
<!-- END PROPERTY LISTING -->

<!-- BEGIN PAGINATION -->
<% if $Results.MoreThanOnePage %>
    <div class="pagination">
        <% if $Results.NotFirstPage %>
        <ul id="previous col-xs-6">
            <li><a href="$Results.PrevLink"><i class="fa fa-chevron-left"></i></a></li>
        </ul>
        <% end_if %>
        <ul class="hidden-xs">
            <% loop $Results.PaginationSummary(4) %>
                <li <% if $CurrentBool %> class="active" <% end_if %>><a href="$Link">$PageNum</a></li>
            <% end_loop %>
        </ul>
        <% if $Results.NotLastPage %>
        <ul id="next col-xs-6">
            <li><a href="$Results.NextLink"><i class="fa fa-chevron-right"></i></a></li>
        </ul>
        <% end_if %>
    </div>
<% end_if %>
<!-- END PAGINATION -->
