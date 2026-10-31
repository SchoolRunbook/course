# Project 2: Reference Checks and Offers
> **Note:** this project runs across Class 3 and Class 4. In Class 3 we build the reference requests together. In Class 4 we add offer letters and monitoring.
>
> Finish steps 1 to 4 before Class 4 on Tuesday, Nov 17 at 3:00pm ET.

Rosa is the HR Coordinator at InspireAwesomeness Academy, a charter network with three schools. She runs hiring for all three. When a principal wants to move ahead with a candidate, Rosa asks for three references, emails each one a link to the school's reference form, and chases the ones who don't answer, keeping track in her inbox and a notes doc. Once the references are in, the principal decides, and Rosa prepares and sends the offer letter by hand.

Your workflow takes over the chasing and the paperwork: reference requests go out as soon as a candidate names their references, every response lands on the candidate's row, and offer letters go out for signature from a template. Rosa and the principals still decide who gets an offer.

Complete the steps in order:

1. [Set up your sheet and forms](#1-set-up-your-sheet-and-forms)
2. [Start your project guide](#2-start-your-project-guide)
3. [Build the reference requests](#3-build-the-reference-requests)
4. [Send reminders](#4-send-reminders)
5. [Send offer letters](#5-send-offer-letters)
6. [Add monitoring](#6-add-monitoring)
7. [Stretch projects (optional)](#7-stretch-projects-optional)

## 1. Set up your sheet and forms

**Why:** your workflow reads and writes your own copy of Rosa's hiring sheet, and your test references are you, so every email the workflow sends lands in your inbox.

**Steps:**

1. Open [Rosa - Hiring Tracker (starter)](#) (link to come) and click **Make a copy**. Use the same Google account you'll use for the course.
2. Rename your copy `Rosa - Hiring Tracker - [your name]`.
3. Make copies of the candidate references form and the reference form (links to come), and connect each one's responses to your sheet.
4. Copy the links to your sheet and both forms. You'll paste them into the prompt in step 2.

## 2. Start your project guide

**Why:** as in Project 1, Claude writes your project guide (Context, Design and Build tabs) and you build from it one milestone at a time. The prompt below holds Rosa's process and the details you'll need.

**Steps:**

1. In your `SchoolRunbook projects` project in Claude, start a new chat. Copy the prompt below, replace each `[paste link]` with your own links and `myname` with your Gmail address, and send it.

```text
Let's start my Reference Checks project. Its context is below.

---

## The problem

Rosa is the HR coordinator at a charter school network with three campuses: Northview High, Eastlake Middle and Westside Elementary. She runs hiring for all three. Today, reference checks and offers work like this:

1. A principal tells Rosa they want to move ahead with a candidate.
2. Rosa sends the candidate a form asking for three references.
3. For each reference, she emails a link to the school's reference form.
4. She chases references who haven't answered: a reminder email or two, then a phone call.
5. Responses land in a Google Sheet. When a candidate's references are all in, she copies them into a doc and lets the principal know.
6. The principal reviews them and emails Rosa to make an offer.
7. Rosa fills in the offer letter template, saves it as a PDF and sends it for e-signature.

Candidates wait on offers while Rosa chases references by hand, tracking who has answered in her inbox and a notes doc.

## What the automation should do first

Reference requests go out as soon as a candidate names their references, and every response shows up on the candidate's row.

1. When a candidate submits the references form, email each reference a link to the reference form, already tied to that candidate.
2. When a reference submits the reference form, record it on the candidate's row and update the count of references received.

Rosa still decides who moves forward. We'll add reminders and offer letters later.

## Details you'll need

- Hiring sheet: [paste link], my copy. The Candidates tab has one row per candidate. Use the sheet's own headers.
- Candidate references form: [paste link]. Responses land in the References Submitted tab.
- Reference form: [paste link]. Responses land in the Reference Responses tab.
- Both forms ask for the Candidate ID. The links Rosa sends should fill it in.
- Emails go out from my Gmail. My test references use my own address with a plus, like myname+ref1@gmail.com.

## Scope: keep it small

- No AI in the workflow.
- No reminders, summaries or offer letters yet.
- Don't email candidates or principals.
- Use the fewest nodes that do the job.
```

<ol start="2">
  <li>Claude creates your guide with a Context tab and asks you any questions it has. Answer them.</li>
  <li>Read the Context tab. Edit it yourself or ask Claude to change anything that's missing or wrong. When it looks right, tell Claude to move on.</li>
  <li>Claude adds a Design tab. Read it closely, especially how each response finds its candidate. When the design looks right, tell Claude you're ready to build, and it adds the Build tab.</li>
  <li>Copy the link to your guide, and add it to your SchoolRunbook project instructions in Claude.</li>
</ol>

## 3. Build the reference requests

**Why:** this is the part we build in Class 3: requests go out on their own, and Rosa can see at a glance how many references are back for each candidate.

**Steps:**

1. In the SchoolRunbook n8n workspace, create a new workflow called `Reference Checks - [your name]`.
2. Follow the Build tab one milestone at a time. Do the checks at the end of each milestone, then tell Claude what you saw.
3. Test it by submitting the candidate references form yourself, then answering each reference email as the reference.

**Done when:** each test reference gets one email with a link that already names the candidate, and each response you submit shows up on the right candidate's row with the count going up by one.

## 4. Send reminders

**Why:** chasing references is where Rosa loses the most time.

**Steps:**

1. In the same chat, send Claude this:

```text
Let's add reminders. Once a day, email references who haven't answered after three days. If they still haven't answered two days after a reminder, flag them for Rosa to call. Make it easy to test without waiting days.
```

<ol start="2">
  <li>Read the updated Design tab, then build the new milestone the same way as the others.</li>
</ol>

**Done when:** a reference who hasn't answered gets one reminder, is flagged after the second wait, and gets nothing more once they respond.

## 5. Send offer letters

**Why:** once a principal approves, Rosa fills in the same letter by hand for every hire. We build this together in Class 4.

**Steps:**

1. In the same chat, send Claude this:

```text
Let's send offer letters. When a principal approves a candidate, create the offer letter from this template, [paste link], and send it for signature through Dropbox Sign's API in test mode. Help me decide how the approval reaches the workflow.
```

<ol start="2">
  <li>Read the updated Design tab, then build the new milestone the same way as the others.</li>
</ol>

## 6. Add monitoring

**Why:** a workflow that fails quietly is worse than no workflow: Rosa thinks the reminders went out, and they didn't. We build this together in Class 4.

**Steps:**

1. In the same chat, send Claude this:

```text
Let's add monitoring. Alert me when a run fails, or when a candidate has waited on references for more than a week.
```

<ol start="2">
  <li>Read the updated Design tab, then build the new milestone the same way as the others.</li>
</ol>

## 7. Stretch projects (optional)

Finish steps 1 to 6 first, then pick one. For each, send Claude its prompt, read the updated Design tab, and build it one milestone at a time.

### Summarize references for the principal

Copy this prompt and send it to Claude in your Reference Checks chat:

```text
When all of a candidate's references are in, put them in a doc for the principal with a short Claude summary based only on what the references said.
```

## Getting help

**Stuck?** Go back to the same Claude chat, say which milestone you're on, and paste the error message or a screenshot of your canvas. If you come back later, start a new chat in the project and paste your guide's link; Claude will pick up where you left off.

Still stuck? Come to office hours, or email coaches@schoolrunbook.com.
