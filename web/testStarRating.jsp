<!DOCTYPE html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="css/rating.min.css">
    </head>
    <body>
    <main class="o-content">
        <div class="o-container">
            <div class="o-section">
                <div id="shop"></div>
            </div>
            <div class="o-section">
                <div id="github-icons"></div>
            </div>
        </div>
    </main>
    <script src="js/rating.min.js"></script>
    <script>
        (function() {
            'use strict';
            // SHOP ELEMENT
            var shop = document.querySelector('#shop');
            // DUMMY DATA
            var data = [
                {
                    rating: 3
                }
            ];
            // INITIALIZE
            (function init() {
                for (var i = 0; i < data.length; i++) {
                    addRatingWidget(buildShopItem(data[i]), data[i]);
                }
            })();

            // BUILD SHOP ITEM
            function buildShopItem(data) {
                var shopItem = document.createElement('div');

                var html = '' +
                    '<ul class="c-rating"></ul>';

                shopItem.classList.add('c-shop-item');
                shopItem.innerHTML = html;
                shop.appendChild(shopItem);

                return shopItem;
            }

            // ADD RATING WIDGET
            function addRatingWidget(shopItem, data) {
                var ratingElement = shopItem.querySelector('.c-rating');
                var currentRating = data.rating;
                var maxRating = 5;
                var callback = function(rating) { alert("You have rated "+rating + "stars"); };
                var r = rating(ratingElement, currentRating, maxRating, callback);
            }

        })();

    </script>
</body>
</html>