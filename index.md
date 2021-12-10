---
layout: default
title: "welcome"
---

## Course information

{% assign course = site.data.course_information.course %}
{% assign ilist = "" %}
{% capture ilist %}{% for i in course.instructors -%}
  +{% if i.url != "" and i.url != null %}<a href="{{i.url}}">{{i.name}}</a>{% else %}{{i.name}}
  {% endif %} 
  {%- endfor %}{% endcapture %}



<div class="container">
  <div class="row align-items-baseline">
    <div class="col-2 text-end fs-5">Course:</div>
    <div class="col-6">{{ course.number }}: {{ course.title }}</div>
</div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Term:</div>
    <div class="col-6">{{ course.term }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Instructors:</div>
    <div class="col-6 ">{{ ilist | remove_first: "+"| split: "+" | array_to_sentence_string: '' }}</div>
  </div>  
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Times:</div>
    <div class="col-6 ">{{ course.times }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Location:</div>
    <div class="col-6 ">{{ course.location }}</div>
  </div>
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Description:</div>
    <div class="col-10 ">{{ course.description }}</div>
  </div>  
</div>

## Lectures

<table class="table">
  <thead>
    <tr>
      <th scope="col" width="2%">#</th>
      <th scope="col" width="3%">Date</th>
      <th scope="col" width="55%">General topic</th>
      <th scope="col" width="15%">Instructor</th>
      <th scope="col" width="25%">Resources</th>
    </tr>
  </thead>
  <tbody>
    {% for l in site.data.lectures.lectures %}
    {% if l.section != null and l.section != current_section %}
    {% assign current_section = l.section %}
    <tr>
      <th colspan="5" class="bg-secondary"><h3 class="text-light">{{ current_section }}</h3></th>
    </tr>
    {% endif %}
    <tr>
      <th scope="row">{{ forloop.index }}</th>
      <td>{{ l.date }}</td>
      <td><h5 class="">{{ l.topic }}</h5><span class="text-secondary">{{ l.details }}</span></td>
      <td>{{ l.instructor }}</td>
      <td>
        {% if r.links != "" %}<ul class="m-0 p-0">{% for r in l.links %}{% if r.url != "" and r.url != null %}
          <li class="text-secondary"><a href="{{ r.url }}">{{r.title}}</a></li>{% endif %}{% endfor %}</ul>{% endif %}
      </td>
    </tr>
    {% endfor %}
  </tbody>
</table>