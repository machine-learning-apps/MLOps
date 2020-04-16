---
layout: page
title: Community Generated Actions
permalink: /actions/
id: actions
description: List of Community generated actions
---

<ul class="gen-list" style="column-count: 2">
    {% for item in site.data.actions %}
    <li class="image-right" style="display: inline-block;">
      <img src="{{item.logo_url}}" alt="actions logo"/>
      <a href="{{item.marketplace_link}}"><h4>{{item.action_name}}</h4></a>
      <p>{{item.description}}</p>
      <p>docs</p>
    </li>
    {% endfor %}
</ul>


*See [the GitHub Actions help documentation](https://help.github.com/en/actions) for instructions on how to add actions to your workflow.*
