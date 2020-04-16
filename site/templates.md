---
layout: page
title: Community Generated Templates
permalink: /templates/
id: templates
description: List of community generated templates
---

<ul class="gen-list" style="column-count: 2">
    {% for item in site.data.templates %}
    <li class="image-right">
      <img src="{{ item.logo_url }}" alt="actions logo"/>
      <a href="{{ item.getting_started_link }}"><h4>{{item.template_name}}</h4></a>
      <p>{{item.description}}</p>
      <p><a href="{{ repo_url }}">docs</a></p>
    </li>
    {% endfor %}
</ul>


*See [the GitHub Template help documentation](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template) for instructions on how to use a template for your repo.*