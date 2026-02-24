<div style="text-align: center; margin-bottom: 2rem;">
  <img src="/assets/title.svg" alt="Micro-Learning" style="max-width: 100%; height: auto;"/>
</div>

<div style="text-align: center; margin-bottom: 2rem;">
  <p><em>Curated insights for the curious mind</em></p>
</div>

<ul>
{% for post in site.posts %}
  <li>
    <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
    <p>{{ post.excerpt }}</p>
    <small>{{ post.date | date: "%B %d, %Y" }}</small>
  </li>
{% endfor %}
</ul>
