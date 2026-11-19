# Final Project: Build for Your Organization

For the last two weeks of the course, you build an automation for your own school or organization. Pick a real routine that you or your team does by hand, and use what you learned in Classes 1 to 4 to automate it.

> [!IMPORTANT]
> **Key dates**
>
> - **Tue Dec 8, 3:00 to 4:30pm ET, Demo Day:** everyone demos their automation to the cohort. Show what you have, even if it's not finished.
> - **Fri Dec 11:** submit your final project.

Complete the steps in order:

1. [Choose your problem](#1-choose-your-problem)
2. [Write your design doc](#2-write-your-design-doc)
3. [Build your automation](#3-build-your-automation)
4. [Demo it](#4-demo-it)
5. [Submit your project](#5-submit-your-project)

## What you need to deliver

| Requirement | What it is |
| --- | --- |
| A working automation | An n8n workflow that does a real task for your organization. |
| A design doc | A short document on why you built it and how it works. |
| A 5 to 10 minute demo | Shown live to the cohort on Demo Day, Tue Dec 8. |

> [!TIP]
> **Book office hours early.** A 20-minute session with a coach while you choose your problem can save you hours of building the wrong thing. Book again whenever you get stuck.
>
> <a href="https://schoolrunbook.fillout.com/schoolrunbook-office-hours" target="_blank" rel="noopener noreferrer">Book office hours</a>

## 1. Choose your problem

**Why:** the best projects start from a routine you know well. You already know how it works, where it goes wrong, and what "done" looks like.

**Steps:**

1. **Ideate:** think of a few tasks that you or your colleagues do regularly that you could automate. Good candidates are processes that are time-consuming, brittle, or pass data between many tools.
2. **Map them out:** write a few basic bullet points on how each task works. How long does it take? Where does the data flow? What might happen if the automation goes wrong?
3. **Pick a workflow:** consider building a small first version, then adding to it later to make it more complex.
4. **Meet with Ope:** set up time to discuss your project plan. Bring your notes; if you haven't picked one yet, you can decide together.

<p><a href="https://app.onecal.io/b/opebukola/schoolrunbook-demo" target="_blank" rel="noopener noreferrer">Book your final project discussion</a></p>

**Done when:** you've met with Ope and agreed on what you'll build.

## 2. Write your design doc

**Why:** writing the plan before you build makes you decide what each step does, and whether a person, a rule or AI does it. It also helps someone else on your team understand your automation.

Your design doc should explain **why** you're building this automation and **how** it works. Use any format you like. You can create a new project guide in your `SchoolRunbook projects` Claude Project, as in prework, or write it yourself.

Or use this prompt to have Claude help you write it:

```text
Help me write a one-page design doc for an automation I'm building for my organization. Ask me questions one at a time, then write it as a Claude Doc with these sections:

- The problem: how this is done by hand today, and what goes wrong.
- What the automation does, and what it doesn't do.
- The nodes in order, one line each.
- The rules it follows.
- Edge cases and preventing errors: what could go wrong, and how the automation handles it.

The design decisions are mine. Your job is to ask questions and write it up, not to decide for me.
```

**Done when:** someone who has never seen your workflow could read the doc and explain what it does and why.

## 3. Build your automation

**Why:** this is where you put the course together: connecting your tools, adding AI where it helps, and handling the cases real people will break.

**Steps:**

1. In the <a href="https://schoolrunbook.app.n8n.cloud/home/workflows" target="_blank" rel="noopener noreferrer">SchoolRunbook n8n workspace</a>, create a new workflow called `Final Project - [your name]`.
2. Build one node at a time, testing each one as you go.
3. Test the edge cases from your design doc. As we saw with Rosa's reference checks, the worst failures are silent.
4. Update your design doc if your plan changes while you build.

Use test data or sample data while you build. Don't put student or staff personal information into the shared workspace.

**Done when:** your workflow runs end to end on a realistic example.

## 4. Demo it

**Why:** showing your work to people who understand the problem is the best way to get useful feedback, and to see what everyone else built.

Demos are **required** for everyone, on **Tue Dec 8, 3:00 to 4:30pm ET**. If your automation isn't finished, demo what you have and tell us what's left.

Keep your demo to 5 to 10 minutes:

1. **The problem:** what you automated, and how it's done by hand today.
2. **Show it run:** run the workflow live and show the result.
3. **What broke:** one edge case or error you hit, and how you handled it.
4. **What's next:** what you'd add or change.

## 5. Submit your project

> [!IMPORTANT]
> **Submit by Friday, December 11.**
>
> Export your workflow as a JSON file, then <a href="https://forms.gle/tPscydtY3Nc3MCSE9" target="_blank" rel="noopener noreferrer">submit it using this form</a> with a link to your design doc. Make sure anyone with the link can view your design doc.
>
> <a href="project-1-ai-automation.html#export-workflow-json" target="_blank" rel="noopener noreferrer">Find instructions here on how to export your JSON file.</a>

## FAQs

### Can I use real school data?
Please use dummy data while you build and test. Don't put student or staff personal information into the shared workspace. Claude can help you generate dummy data.

### Which AI credentials should I use for the final project?
We recommend you keep using our n8n and AI credentials from the course. After the demo, you can export your workflow as a JSON file (you'll need it for your submission anyway), import it into your own n8n, and reconnect your school's credentials there.

### What does my school need to do before using n8n with real data?
At a minimum: sign n8n's Data Processing Agreement (like you would for Google Workspace), don't store personal information in n8n (keep it in Sheets or Drive), and set execution logs to delete automatically.

### Can I build my final project as a team?
Yes, you can build with a team. Each team member needs to submit individually.

### Where do I start?
Pick one painful, routine task in your school and build that end to end first. Add extras later. If your process uses several tools, copy them into one test Google Drive folder so you're not working on live files, then build one step at a time.

### Should I use an n8n form or a Google Form?
We recommend a Google Form. Your responses stay in your school's Google Workspace, and you can limit the form to people in your school's domain.

### How do I avoid mistakes in my automation?
Think about what might be missing, repeated or written differently in your data, and ask Claude to help you plan for each case. Match records using something unique, like an email address, rather than names. Add a check step before anything goes out, and start with drafts a person reviews instead of auto-sending.

### How can I see what my automation has done?
Have your workflow add a row to a log sheet each time it runs, with what it did and any problems it found. It's easier to check than going through emails or rerunning the workflow.

### Can Claude help with my final project?
Yes. Use your "SchoolRunbook projects" Project in Claude to plan and build your automation and to help write your design doc. The design decisions are yours. Claude is your co-builder.

### How do I submit, and what do I need for the certificate?
Submit by Friday, Dec 11. Export your workflow as a JSON file and submit it with a link to your design doc (make sure anyone with the link can view it). To earn the badge and certificate, finish and submit all project assignments and your final project.

### Can I still submit Projects 1 and 2 if the deadline has passed?
Yes. Each project page has a submission form, and you can still submit after the deadline.

## Getting help

Office hours run through Demo Day, and they're there for you to use. Book a time to:

- Talk through which problem to pick.
- Get feedback on your design doc before you build.
- Get unstuck on a node, a connection or an error.
- Do a practice run of your demo.

<a href="https://schoolrunbook.fillout.com/schoolrunbook-office-hours" target="_blank" rel="noopener noreferrer">Book office hours</a>, or email coaches@schoolrunbook.com.
