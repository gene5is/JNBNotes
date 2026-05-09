
# 目录

## 数学

- [信号](https://gene5is.github.io/JNBNotes/Notes/Math/signals/signals)

---
layout: default
title: 文章目录
---

# 全部文章

{% assign posts_by_year = site.posts | group_by_exp: "post", "post.date | date: '%Y'" %}

{% for year in posts_by_year %}
## {{ year.name }} 年
<ul>
  {% for post in year.items %}
  <li>
    <a href="{{ post.url }}">{{ post.title }}</a>
    <small>{{ post.date | date: "%m-%d" }}</small>
  </li>
  {% endfor %}
</ul>
{% endfor %}
