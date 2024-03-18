> The Diataxis framework really helps you create something that could bring a new developer on board quickly, and ADR helps ensure the thinking behind architecture decisions is easy to understand.

# https://diataxis.fr/


In Diátaxis, each of these modes (or types) answers to a different user need,
fulfills a different purpose and requires a different approach to its creation.


| **Tutorials**          | **How-to Guides**    |
| Learning-Oriented      | Task-Oriented        |
| ---------------------- | -------------------- |
| **Explaination**       | **Reference**        |
| Understanding-Oriented | Information-Oriented |

# https://discuss.python.org/t/adopting-the-diataxis-framework-for-python-documentation/15072

Hello,
On the Docs meeting, everyone was in favor of adopting the Diátaxis framework for
Python documentation. Let me explain what that means to me so we can get a rough
consensus and start work.

Everyone who wants to work on docs editing you should read the Diátaxis docs. They’re
short and (as you’d expect) well written, and will probably answer your questions
if you have any.

The main point, for me, is to keep the target audience in mind when writing docs.
There are four kinds of target audience, and thus four kinds of docs.
The first goal should be to avoid mixing them, rather than to cover all four quadrants.
Mixing them confuses all readers; not including the HOWTO guide or the tutorial just
means those readers will go to Stack Overflow or Real Python instead.

Another point, from "How to use Diátaxis" (the last section, but a very important one),
is Work one step at a time. Adopting Diátaxis doesn’t mean we need to restructure the
existing docs now. Rather, it should allow us to find small tasks for anyone who wants
to help. That currently seems to be a bottleneck – "improve the docs" is so vast and
directionless that we can’t seem to get anything started. But if we adopt a framework
for the big picture, we can small steps toward it.

So, here’s the proposal: Let’s adopt Diátaxis as a guide for Python docs, and start improving.
Anyone against?


# https://diataxis.fr/how-to-use-diataxis/

Tutorial
  Installing nbchkr
  Writing an assignment
  Releasing an assignment
  Releasing solutions
  Checking student assignments and generating feedback
  Tutorials on building real-world applications with Encore.
How to:
  install
  See how to build a fully fledged cloud backend with Encore, in 5 minutes
  write a source assignment
  release an assignment
  solve an assignment
  check a submission
  handle a submission in the wrong format
  contribute
  release
Explanation
  why use nbchkr?
  why use automated checking?
  Why Encore? Learn about what problems Encore solves and the philosophy behind it.
Reference
  Bibliography
  Changelog
  Source code
  
Tutorials - get started with practical steps
Explanations - understand important topics

https://django-axes.readthedocs.io/en/latest/
   1_requirements
   2_installation
   3_usage
   4_configuration
   5_customization
   6_integration
   7_architecture
   8_reference
   9_development
   10_changelog
   
  
https://about.gitlab.com/handbook/business-technology/data-team/documentation/#documentation-types

Tutorials 🔍
A tutorial:

- is learning-oriented
- allows the newcomer to get started
- is a lesson
Analogy: teaching a small child how to cook

How-to guides 🏁
A how-to guide:

- is goal-oriented
- shows how to solve a specific problem
- is a series of steps
Analogy: a recipe in a cookery book

Explanation 💡
An explanation:

- is understanding-oriented
- explains
- provides background and context
Analogy: an article on culinary social history

Reference 📚
A reference guide:

- is information-oriented
- describes the machinery
- is accurate and complete
Analogy: a reference encyclopaedia article

🛠🏁 Indicates this is a how-to guide probably for somebody on the data team. An example would be how to provision somebody in Snowflake
💻📚 Indicates this is a reference for our user persona. An example would be the tips and tricks section for working in Sisense
🌎💡 Indicates this is an explanation for all personas. An example would be the charter of the data team.

tutorials should "teach" but howto should "describe"

https://rixx.de/blog/writethedocs-2017-what-nobody-tells-you-about-documentation/

- Tutorials are done with a teacher
- How tos are studied
- Reference contain only schematics and the such
- Explanations are required to explain, y'know, why and how the plane stays up

https://discuss.python.org/t/adopting-the-diataxis-framework-for-python-documentation/15072/15

reference, tutorial and cookbook 
explanation - "theory of operation" / overview?

only split pages when it makes sense and avoid creating (up to) four pages for each topic;
make the fact that there are other related pages (and what they cover) more evident and consistent throughout the docs


https://docs.djangoproject.com/en/4.0/#how-the-documentation-is-organized

- **Tutorials** take you by the hand through a series of steps to create a web application. Start here if you’re new to Django or web application development. Also look at the "First steps".
- **Topic guides** discuss key topics and concepts at a fairly high level and provide useful background information and explanation.
- **Reference guides** contain technical reference for APIs and other aspects of Django’s machinery. They describe how it works and how to use it but assume that you have a basic understanding of key concepts.
- **How-to guides** are recipes. They guide you through the steps involved in addressing key problems and use-cases. They are more advanced than tutorials and assume some knowledge of how Django works.
