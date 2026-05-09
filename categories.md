---
layout: default
title: 分类
---

# 笔记分类

{% assign cats = site.Notes | group_by: 'category' %}
{% for cat in cats %}
  {% if cat.name != "" %}
  ## {{ cat.name }}
  <ul>
    {% for note in cat.items %}
    <li><a href="{{ note.url }}">{{ note.title }}</a></li>
    {% endfor %}
  </ul>
  {% endif %}
{% endfor %}
