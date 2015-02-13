<?php

/* 
 This view fragment represents a single product entry, based on the original
 HTML, which looked like the following

    <article class="product">
        <header>
            <a name="P002">Triangle Pendant</a>
        </header>
        <div class="productPhotos">
            <img src="images/trianglePendant1.jpg" /> 
            <img src="images/trianglePendant2.jpg" />
        </div>
        <div class="productInfo">
            <p>A beautiful triangle pendant, 1.5cm across. Personalised with your initial and on a 18cm sterling silver chain.</p>
            <p class="price">£20.00</p>
        </div>
    </article>
 */
?>
<article class="product">
    <header>
        <a name={id}>{name}</a>
    </header>
    <div class="productPhotos{photo_count}">
        {product_photos}
        <img src="images/{path}" alt="{label}"/> 
        {/product_photos}
    </div>
    <div class="productInfo">
        <p>{description}</p>
        <p class="price">{cost}</p>
    </div>
</article>