---
layout: default
title: 首页
permalink: /
---

# 📚 文章分类归档

## 全部文章目录
{% assign posts_by_year = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}

{% for year in posts_by_year %}
### {{ year.name }} 年
<ul>
  {% assign posts_by_month = year.items | group_by_exp: "post", "post.date | date: '%m'" %}
  {% for month in posts_by_month %}
  <li><strong>{{ month.name }} 月</strong>
    <ul>
      {% for post in month.items %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <span style="color:#999; font-size:0.9em;">{{ post.date | date: "%m-%d" }}</span>
      </li>
      {% endfor %}
    </ul>
  </li>
  {% endfor %}
</ul>
{% endfor %}
