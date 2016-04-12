(function(window, $) {
    tabSet = $('#matchday-tab-links').scrollTabs();
    $('.matchday-tab-set #matchday-tab-links a').on('click', function(e) {
        var currentAttrValue = $(this).attr('href');
        $('.matchday-tab-set ' + currentAttrValue).show().siblings().hide();
        $(this).parent('li').addClass('matchday-selected').siblings().removeClass('matchday-selected');
        e.preventDefault();
    });
})(this, this.jQuery);