# HTML Quick Reference

```html
<!-- ============ DOCUMENT STRUCTURE ============ -->
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Page Title</title>
  <meta name="description" content="Page summary for search results">
  <link rel="canonical" href="https://example.com/page">
  <link rel="stylesheet" href="styles.css">
</head>
<body></body>
</html>

<!-- ============ SEMANTIC LAYOUT ============ -->
<header></header>       <!-- introductory content for page/section -->
<nav></nav>              <!-- navigation links block -->
<main></main>            <!-- primary content, one per page -->
<article></article>      <!-- standalone, syndicatable content -->
<section></section>      <!-- thematic grouping, usually with its own heading -->
<aside></aside>           <!-- tangential content, e.g. sidebar -->
<footer></footer>        <!-- closing content for page/section -->

<!-- ============ TEXT CONTENT ============ -->
<h1>Top-level heading</h1>          <!-- one per page ideally -->
<h2>Subheading</h2>
<p>Paragraph text.</p>
<ul><li>Unordered item</li></ul>
<ol><li>Ordered item</li></ol>
<dl><dt>Term</dt><dd>Definition</dd></dl>
<blockquote cite="https://source.example">Quoted text</blockquote>
<a href="/page" target="_blank" rel="noopener noreferrer">Link</a>
<strong>Important (bold + semantic)</strong>
<em>Emphasized (italic + semantic)</em>
<code>inline code</code>
<pre><code>preformatted code block</code></pre>

<!-- ============ FORMS ============ -->
<form action="/submit" method="post">
  <fieldset>
    <legend>Personal Info</legend>
    <label for="name">Name</label>
    <input type="text" id="name" name="name" required>

    <label for="email">Email</label>
    <input type="email" id="email" name="email" required>

    <label for="pass">Password</label>
    <input type="password" id="pass" name="pass" minlength="8" required>

    <label for="age">Age</label>
    <input type="number" id="age" name="age" min="0" max="120">

    <label for="bday">Birthday</label>
    <input type="date" id="bday" name="bday">

    <label for="plan">Plan</label>
    <select id="plan" name="plan">
      <option value="free">Free</option>
      <option value="pro" selected>Pro</option>
    </select>

    <label for="bio">Bio</label>
    <textarea id="bio" name="bio" rows="4"></textarea>

    <label><input type="checkbox" name="terms" required> I agree</label>
    <label><input type="radio" name="tier" value="a"> Tier A</label>
    <label><input type="radio" name="tier" value="b"> Tier B</label>
  </fieldset>
  <button type="submit">Submit</button>
  <button type="reset">Reset</button>
</form>

<!-- Common input types -->
<input type="text">
<input type="email">
<input type="password">
<input type="number" min="0" max="10" step="1">
<input type="tel" pattern="[0-9]{10}">
<input type="url">
<input type="search">
<input type="date">
<input type="time">
<input type="color">
<input type="range" min="0" max="100">
<input type="file" accept="image/*">
<input type="hidden" name="csrf" value="token">

<!-- ============ TABLES ============ -->
<table>
  <caption>Table caption</caption>
  <thead>
    <tr><th scope="col">Col A</th><th scope="col">Col B</th></tr>
  </thead>
  <tbody>
    <tr><td>Value</td><td>Value</td></tr>
  </tbody>
  <tfoot>
    <tr><td colspan="2">Footer note</td></tr>
  </tfoot>
</table>

<!-- ============ MEDIA ============ -->
<img src="photo.jpg" alt="Description" width="800" height="600" loading="lazy">
<img src="decorative.jpg" alt="">  <!-- decorative: alt is empty, not omitted -->

<picture>
  <source media="(min-width: 800px)" srcset="large.jpg">
  <source media="(max-width: 799px)" srcset="small.jpg">
  <img src="small.jpg" alt="Description">
</picture>

<video src="clip.mp4" controls width="640" height="360">
  <track kind="captions" src="captions.vtt" srclang="en" label="English">
</video>

<audio src="track.mp3" controls></audio>

<!-- ============ ACCESSIBILITY / ARIA (fallback only) ============ -->
<button aria-expanded="false" aria-controls="menu-id">Menu</button>
<div id="menu-id" role="menu" hidden></div>
<div role="alert">Error message announced immediately</div>
<nav aria-label="Breadcrumb"></nav>
<span aria-hidden="true">👍</span>  <!-- purely decorative icon, hide from AT -->

<!-- ============ MODERN ELEMENTS ============ -->
<details>
  <summary>Click to expand</summary>
  <p>Hidden content, no JS needed.</p>
</details>

<dialog id="modal">
  <p>Modal content</p>
  <button onclick="document.getElementById('modal').close()">Close</button>
</dialog>

<template id="row-template">
  <tr><td class="name"></td></tr>
</template>

<!-- Web Component usage (defined via customElements.define) -->
<rating-stars value="4"></rating-stars>

<!-- ============ SCRIPT LOADING ============ -->
<script src="app.js" defer></script>   <!-- DOM-dependent, ordered -->
<script src="analytics.js" async></script>  <!-- independent, unordered -->
```
