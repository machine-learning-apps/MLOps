---
layout: page
title: Dependency versions
permalink: /versions/
id: versions
description: GitHub Pages uses the following dependencies and versions
---

## GitHub Pages uses the following dependencies and versions:

{% comment %}
This capture and assign below is used to sort the dependencies without case. It produces a list, one line for each dependency like so:

    redcloth:1.1.0:RedCloth

The downcase'd name is first, followed by the version, followed by the original name.
Sorted by the first column, then the last column is used
{% endcomment %}

{% capture downcased_names %}
{% for version in site.github.versions %}{{ version[0] | downcase }}:{{version[1]}}:{{ version[0] }};{% endfor %}
{% endcapture %}
{% assign versions = downcased_names | split: ";" | sort %}

<table>
  <tr>
    <th>Dependency</th>
    <th>Version</th>
  </tr>
{% for dependency in versions %}
{% assign dependency_hash = dependency | strip | split: ":" %}
{% unless dependency_hash[0] %}{% continue %}{% endunless %}
  <tr>
    <td class="gem">
        {% if dependency_hash[0] == "ruby" %}
        {% assign link = "https://www.ruby-lang.org/en/downloads/" %}
        {% else %}
        {% assign link = "https://rubygems.org/gems/" | append: dependency_hash[2] %}
        {% endif %}
        <a href="{{ link }}">{{ dependency_hash[2] }}</a>
    </td>
    <td class="version">{{ dependency_hash[1] }}</td>
  </tr>
{% endfor %}
</table>

<p>For a history of dependency changes, see <a href="https://github.com/github/pages-gem/releases">the past releases</a>.</p>

## Programmatic access

Want a more programmatic way to keep your local version of Jekyll up to date? All dependencies are bundled within [the GitHub Pages Ruby gem](https://help.github.com/articles/using-jekyll-with-pages#installing-jekyll), or are available programmatically via [pages.github.com/versions.json](/versions.json)

<small>Last updated {{ site.time | date: "%Y-%m-%d %I%P %z" }}.</small>
