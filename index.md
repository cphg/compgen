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

## Assignments

Throughout the semester, there will be ~6 homework assignments. These assignments are typically programming assignments that involve implementing a method or algorithm or performing a data analysis. Assignments may also include written components or theoretical problems. The assignments will generally be assigned over the course of two weeks, but there is no fixed schedule and due dates will vary by assignment. Each assignment is worth 10% of the final grade.

Students should complete assignments individually. We want you to work together at the level of sharing ideas, concepts, or suggested functions or reading material. You should not share or seek out completed solutions to the assignments.

## Scribing

Each student will be assigned a single class session to serve as scribe. The role of the scribe is to take detailed notes for the class on the topic of the class session. This should include background preparation before the assigned class session, note-taking during the class session, expansion of related topics discussed in the class, and final polishing and writing up of the notes after the class session.

Other class members are welcome to also contribute to notes for any class session, but the primary responsibility for polishing and integrating the notes belongs to the scribe.

The notes should be submitted into the class scribe repository on GitHub (linked above).

At the end of the course, all class members will have access to a "book" of complied class notes, which will be public.

## Class participation

Students are expected to attend class. There is no textbook, but each lecture will have reading material posted. Students should read the lecture material before the lecture. You should plan to invest roughly 3 hours per week on reading the posted outside material. We will not have exams or test your reading, so it's on your own and this is our guideline to make sure you get the most benefit from the class. You should feel flexible to increase/decrease this moderately according to topics where you have greater or less interest. The lectures will be most useful if you do the reading before the accompanying lecture so that you can come prepared with some background to ask questions.

## Final presentation

The final presentation should integrate two or more computational methods, algorithms, or concepts from computational genomics. The presentations may focus on a particular application in the student's research area. Each student will give a 10-15 minute oral presentation during one of the last two class sessions. Students should think of the final presentation as roughly equivalent to one homework assignment, in terms of expected preparation.

## Office hours

Given the diversity of instructors in the course, we do not plan to hold regular office hours, but students should feel free to reach out to any instructor via e-mail to schedule a meeting. We will be available to meet individually with students as needed.

## Missing lectures

If you need to miss a lecture, we will address it on a case-by-case basis. Possible ways to make up missed lectures could be, for example, you can go through the slides and study the topic on your own, and contribute your notes to the scribe repository, or we may record a lecture for you to review on your own.

## Recordings

We do not intend to record lectures generally, but instructors may decide to record on a lecture-by-lecture basis, either for students who are missing or for other reasons. The University prohibits the recording of live class sessions unless all students have been informed that recording will occur and may be stored. Therefore, we notify that classes may be recorded at the discretion of the instructor. Any recording will follow UVA protocol, that is,  will be stored for instructional purposes with students enrolled in the same class during the same term, and may only be stored on University-owned password-protected sites.
