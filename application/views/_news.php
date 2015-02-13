<?php

/* 
 This view fragment represents a single news entry, based on the original
 HTML, which looked like the following

    <aside class="news">
        <article>
           <h2>news title</h2>
           <p>news text</p>
           <time>Posted on 17th March, 2014</time>
        </article>
    </aside>

 */
?>
<aside class="news">
   <article>
      <h2>{title}</h2>
      <p>{content}</p>
      <time>Posted on {last_modified}</time>
   </article>
</aside>

