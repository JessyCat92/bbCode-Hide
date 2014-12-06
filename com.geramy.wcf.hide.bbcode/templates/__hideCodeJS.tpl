<script data-relocate="true">
    //<![CDATA[
    window.onload = function () {
        hideData = { };

        $.each($(".show[data-like-needed='1']"), function () {
            var parentElement = $(this).parent();
            var searchID = null;
            while (true) {
                if (parentElement.attr("id")) {
                    if (parentElement.attr("id").substring(0, 4) == "post") {
                        searchID = parentElement.attr("id");
                        break;
                    }
                }
                parentElement = parentElement.parent();
            }
            parentElement.find(".dislikeButton").click(function () {
                var searchHideId = $(this).attr("data-search-Hide-ID");
                var isActive = $(this).find('a').hasClass("active");
                if (searchHideId) {
                    $(".show[data-search-Hide-ID='" + searchHideId + "']").html(
                            ''
                    );
                    $(".show[data-search-Hide-ID='" + searchHideId + "']").hide();
                    $(".show[data-search-Hide-ID='" + searchHideId + "']").parent().find('.notshow').show();
                }

            });
            parentElement.find(".likeButton").click(function () {
                var searchHideId = $(this).attr("data-search-Hide-ID");
                var isActive = $(this).find('a').hasClass("active");
                if (!isActive) {
                    if (searchHideId) {
                        $(".show[data-search-Hide-ID='" + searchHideId + "']").html(
                                hideData[searchHideId]
                        );
                        $(".show[data-search-Hide-ID='" + searchHideId + "']").show();
                        $(".show[data-search-Hide-ID='" + searchHideId + "']").parent().find('.notshow').hide();
                    }
                }
                else {
                    if (searchHideId) {
                        $(".show[data-search-Hide-ID='" + searchHideId + "']").html(
                                ''
                        );
                        $(".show[data-search-Hide-ID='" + searchHideId + "']").hide();
                        $(".show[data-search-Hide-ID='" + searchHideId + "']").parent().find('.notshow').show();
                    }
                }
            });
            $(this).attr("data-search-Hide-ID", searchID);
            hideData[searchID] = $(this).html();
            var likeButton = parentElement.find(".likeButton");
            likeButton.attr("data-search-Hide-ID", searchID);
            var disLikeButton = parentElement.find(".dislikeButton");
            disLikeButton.attr("data-search-Hide-ID", searchID);
            if (!likeButton.find('a').hasClass("active")) {
                $(this).html('');
                $(this).hide();
            }
            else {
                $(this).parent().find('.notshow').hide();
                $(this).show();
            }

        });
    };
    //]]>
</script>