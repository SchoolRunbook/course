# Project 2: Reference Checks and Offers
> **Note:** this project runs across Class 3 and Class 4. In Class 3 we start the workflow together. In Class 4 we add offer letters.
>
> Finish everything up to offer letters before Class 4 on Tuesday, Nov 17 at 3:00pm ET.

Rosa is the HR Coordinator at InspireAwesomeness Academy, a charter network with three schools. She runs hiring for all three. In the spring, as hiring ramps up for the next school year, she may have a dozen or more candidates in the pipeline, tracked in a sheet that lists each candidate and their principal.

One time-consuming part of hiring is reference checks and offers. When a principal wants to move ahead with a candidate, Rosa emails the candidate and asks for three references. When the names come back, she writes to each reference with a link to the school's reference form. Some answer the same day. Others need two or three reminder emails and then a phone call, and Rosa keeps track of who she has chased using her email and a notes document.

All responses from the reference form land in a Google Sheet. When a candidate's references are complete, Rosa copies them into a document and lets the principal know. After reviewing the references, the principal emails Rosa to make an offer.

Rosa copies the offer letter template, fills in the candidate's name, role, campus, salary and start date, saves it as a PDF, uploads it to the e-signature tool and sends it. 

Your workflow will improve this process and eliminate the manual chasing and paperwork.

Complete the steps in order:

1. [Set up your sheet and form](#1-set-up-your-sheet-and-form)
2. [Start your project guide](#2-start-your-project-guide)
3. [Build the workflow](#3-build-the-workflow)
4. [Stretch projects (optional)](#4-stretch-projects-optional)

## 1. Set up your sheet and form

**Why:** your workflow reads and writes your own copy of Rosa's hiring sheet, and your test references are you, so every email the workflow sends lands in your inbox.

**Steps:**

1. [Click here to make a copy of the hiring tracker](https://docs.google.com/spreadsheets/d/15VPU52s-Pe6XDvi9zvHpn3HQitREueCdw79PlhV2__s/copy). Use the same Google account you'll use for the course.
2. Rename your copy `Rosa - Hiring Tracker - [your name]`.
3. On the Candidates tab, pick a candidate at the References stage to test with and enter your own Gmail address with a plus in their Email column, like `myname+candidate@gmail.com`. Plus addresses land in your own inbox, so you can play the candidate and their references without emailing anyone real.
4. [Click here to make a copy of the reference check form](https://docs.google.com/forms/d/1lb8JaSQpvPkBS_mF-zbeDhLVPwOerUVuntwwYlQz6Pc/copy). Then connect its responses to your sheet.
5. [Click here to make a copy of the offer letter template](https://docs.google.com/document/d/15MYEFBXs6t4bIkdnxqoG9xINoAi7obJqKbkLNfGLH6I/copy).
6. Copy the links to your sheet, the form and the template. You'll paste them into the prompt in step 2.

## 2. Start your project guide

**Why:** as in Project 1, Claude writes your project guide (Context, Design and Build tabs) and you build from it one milestone at a time. The prompt below holds Rosa's process and the details you'll need.

**Steps:**

1. In your `SchoolRunbook projects` project in Claude, start a new chat. Copy the prompt below, replace each `[paste link]` with your own links, and send it.

```text
Let's start my Reference Checks project. Its context is below.

---

## The problem

Rosa is the HR coordinator at a charter school network with three campuses: Northview High, Eastlake Middle and Westside Elementary. She runs hiring for all three. Today, reference checks and offers work like this:

1. A principal tells Rosa they want to move ahead with a candidate.
2. Rosa emails the candidate and asks for three references.
3. For each reference, she emails a link to the school's reference form.
4. She follows up with references who haven't answered: a reminder email, then a phone call.
5. Reference responses land in a Google Sheet. When a candidate's references are all in, Rosa copies them into a doc and lets the principal know.
6. The principal reviews the references and emails Rosa to make an offer.
7. Rosa fills in the offer letter template, saves it as a PDF and sends it for e-signature.

Rosa spends hours chasing references by hand, tracking who has answered in her inbox and a notes doc, and candidates wait on offers in the meantime.

## What the automation should do

The automation collects references, follows up on them, and sends offer letters once a principal approves, so Rosa no longer chases anyone by hand. Build it in this order:

1. Request references: when a candidate sends their references, email each reference a link to the reference form, already tied to that candidate.
2. Record responses: when a reference submits the reference form, record it on the candidate's row and update the count of references received.
3. File responses: when a candidate reaches the reference stage, create a Drive folder for them. As each reference response comes in from the form, copy it into a Google Doc of the candidate's references in that folder.
4. Send reminders: once a day, email references who haven't answered. If they still haven't answered after 4 days, flag them for Rosa to call. Stop reminders once they respond.
5. Send offer letters: when a principal approves a candidate, create the offer letter from the template with the candidate's details and send it for signature through Dropbox Sign. 

Rosa and the principals still decide who gets an offer.

## Details you'll need

- Hiring sheet: [paste link]
- Reference form: [paste link]
- The reference form asks for the Candidate ID. The link each reference gets should fill it in.
- Offer letter template: [paste link].
- Dropbox Sign: use test mode.
```

<ol start="2">
  <li>Claude creates your guide with a Context tab and asks you any questions it has. Answer them.</li>
  <li>Read the Context tab. Edit it yourself or ask Claude to change anything that's missing or wrong. When it looks right, tell Claude to move on.</li>
  <li>Claude adds a Design tab. Read it closely, especially how each response finds its candidate. When the design looks right, tell Claude you're ready to build, and it adds the Build tab.</li>
  <li>Copy the link to your guide, and add it to your SchoolRunbook project instructions in Claude.</li>
</ol>

## 3. Build the workflow

**Why:** you build Rosa's workflow one milestone at a time from your Build tab. 

**Steps:**

1. In the SchoolRunbook n8n workspace, create a new workflow called `Reference Checks - [your name]`.
2. Follow the Build tab one milestone at a time. Do the checks at the end of each milestone, then tell Claude what you saw.
3. Tell Claude when you're ready for the next milestone.

**Done when:** your test candidate's references each get an email tied to that candidate, every response lands on the candidate's row and is copied into the references doc in their Drive folder, references who don't answer get reminders and are flagged for Rosa to call, and an approved candidate gets an offer letter through Dropbox Sign.

## 4. Stretch projects (optional)

Finish the workflow first, then work on stretch projects. For each, send Claude its prompt, read the updated Design tab, and build it one milestone at a time.

### Summarize references for the principal

Copy this prompt and send it to Claude in your Reference Checks chat:

```text
When all of a candidate's references are in, put them in a doc for the principal with a short Claude summary based only on what the references said.
```

### Text references who haven't answered

Copy this prompt and send it to Claude in your Reference Checks chat:

```text
Let's text references who haven't answered their reminder emails, so Rosa has fewer calls to make. Help me pick a service for sending texts.
```


## Getting help

**Stuck?** Ask Claude for help, come to office hours, or email coaches@schoolrunbook.com.
