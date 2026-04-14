#show figure: set block(below: (2.0em))
#let numbered_eq(content) = math.equation(
    block: true,
    numbering: "(1)",
    content,
)

#let date = datetime.today()
#show table.cell.where(y: 0): set text(weight: "bold")

#let conf(
  course_code: [XYZ 123],
  course_title: [Course Title],
  course_color: gradient.linear(..color.map.plasma),
  authors: ("Allen Rakhamimov", "Additional Authors"),

  title: [Document Title],
  instructors: ("Professor 1", "Professor 2",),
  month: [datetime.now().month.repr:long],
  year: [2025],
  doc,
) = {
  set page(
    paper: "us-letter",
    margin: (1in),
  )
  
  set text(
    font: "New Computer Modern",
    size: 12pt
  )

  set par(
    leading: 1.30em
  )

  show link: url => underline(text(fill: rgb(0, 0, 255))[#url])
  
  let date = [#month #year]
  let left_head = [#course_code: #title]
  let course = [#course_code: #course_title]
  
  // Dynamic right header :)
  let right_head = [
    Joshua Davidov \
  ]
  
  // Course Title
  text(course_color, size: 24pt)[
    #box(course)
  ]
  v(1em, weak: true)

  for author in authors [
      #if author != authors.at(-1) [
        #author,   
      ] else [
        #author
      ]
    ]
  
  // Document Title
  place(
    horizon + center,
    text(size: 24pt)[#title] 
  )
  
  place(
    bottom + right,
    [
      #if instructors.len() > 1 [
        Instructors:
      ] else [
        Instructor:
      ]
      #for instructor in instructors [
        #if instructor != instructors.at(-1) [
          #instructor\
        ] else [
          #instructor
        ]
      ]
      
      #date
    ]
  )
  
  pagebreak()
  // Create header but only after title page
  counter(page).update(1)
  set page(
    numbering: "1",
    header: [
      #set text(10pt)
      #left_head
      #h(1fr) Davidov, et. al 2026
      #v(0.6em, weak: true)
      #line(length: 100%, stroke: 0.5pt)
    ],
  )
  doc
}
