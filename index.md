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
  <div class="row align-items-baseline">
    <div class="col-2 fs-5 text-end">Grading:</div>
    <div class="col-10 ">
      <ul>
        <li>Homework assignments - 60% (6 assignments)</li>
        <li>Final presentation - 15% (&approx; 1 assignment)</li>
        <li>Class participation - 15%</li>
        <li>Scribing - 10% (1 assignment)</li>
      </ul>
    </div>
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

## Scribing

Each student will be assigned a single class session for which the student will serve as scribe. The role of the scribe is to take detailed notes for the class on the topic of the class session. This should include background preparation before the assigned class session, note-taking during the class session, expansion of related topics discussed in the class, and final polishing and writing up of the notes after the class session.

Other class members are welcome to also contribute to notes for any class session, but the primary responsibility for polishing and integrating the notes belongs to the scribe.

The notes should be submitted into the class scribe repository on GitHub (linked above).

At the end of the course, all class members will have access to a "book" of complied class notes.
## Assignments

Throughout the semester, there will be 6 homework assignments. These assignments are typically programming assignments that involve implementing a method or algorithm or performing a data analysis. Assignments may also include written components or theoretical problems. The assignments will generally be assigned over the course of two weeks, but there is no fixed schedule and due dates will vary by assignment. Each assignment is worth 10% of the final grade.

## Final presentation

The final presentation should integrate two or more computational methods, algorithms, or concepts from computational genomics. The presentations may focus on a particular application in the student's research area. Each student will give a 10-15 minute oral presentation during one of the last two class sessions. Students should think of the final presentation as roughly equivalent to one homework assignment, in terms of expected preparation.
