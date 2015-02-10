<?php

/* 
 * This view snippet is used to represent a single product
 */
?>
<div class="product">
    <header><a name={prodID}>{prodName}</a></header>
    <div class="productPhotos">{prodImages}</div>
    <div class="productInfo">
        <p>{prodDesc}</p>
        <p class="price">{prodPrice}</p>
    </div>
</div>
