# Project 3: Reference Checks

Rosa is the HR Coordinator at InspireAwesomeness Academy, a charter network with three schools. When a principal wants to move ahead with a candidate, Rosa asks the candidate for three references, emails each reference a link to the school's reference form, and tells the principal once all three have answered.

Rosa has built a basic automation for this workflow. It works when everyone behaves as expected. However, there are some cases she missed: people resubmit forms, mistype names, etc. Your task is to help Rosa make her automation more robust and reliable. 

Complete the steps in order:

1. [Get started](#1-get-started)
2. [Set up and run Branch 1](#2-set-up-and-run-branch-1)
3. [Set up and run Branch 2](#3-set-up-and-run-branch-2)
4. [Break it](#4-break-it)
5. [Fix it](#5-fix-it)
6. [Rerun every test](#6-rerun-every-test)

> [!IMPORTANT]
> **Your team builds one workflow together.** One person builds and shares their screen. Everyone else helps decide what to do.
>
> **Design your fixes yourselves.** First, try designing the fix yourself. Discuss amongst yourselves what logic you would change to fix it. Then, if you need you can check the hint and ask Claude for help. 

## 1. Get started

**Why:** everyone starts from the same working workflow

**What you have:** you've been provided with your team's tracker link called **Rosa - Hiring Tracker - Set #**. The tracker has five tabs:

- **Start here:** links to your team's two forms (B3 and B4) and to the tracker itself (B5).
- **Candidates:** Rosa's tracker. Rosa keeps the **Status** column up to date by hand.
- **Reference Requests:** every response to the Candidate References form lands here.
- **Reference Responses:** every response to the Reference Check form lands here.
- **Tests:** the tests you'll run today, with what should happen.

**The starter workflow has two branches:**

- **Branch 1, a candidate sends their references:** this reads the Reference Requests tab, then sends one email to each of the three references. It also marks requests that are processed so that they don't get resent. 
- **Branch 2, a reference responds:** reads the Reference Responses tab, finds every response with the same candidate name, counts them, and emails Rosa when the count reaches 3.

**The Processed column:** both response tabs have one, and the sample rows are already marked. It's how the workflow knows which form submissions it has already handled.

**Steps:**

<p><a href="reference-checks-starter.json" download="Reference Checks - Starter.json" style="display:inline-block; padding:0.7em 1em; border:1px solid var(--links); border-radius:6px; background:var(--links); color:var(--bg); font-weight:600; text-decoration:none;">Download the starter workflow (.json)</a></p>

1. The builder downloads the starter workflow above.
2. In the <a href="https://schoolrunbook.app.n8n.cloud/home/workflows" target="_blank" rel="noopener noreferrer">SchoolRunbook n8n workspace</a>, create a new workflow, click the **three dots (⋯)** beside its name and choose **Import → From file**. Rename it `Reference Checks - Team [number]`.

**Plus addresses:** anything sent to `yourname+anything@gmail.com` lands in your own inbox. The builder plays Rosa and all the references this way, and no real person gets emailed.


## 2. Set up and run Branch 1

**Why:** get one branch working end to end 

**Steps:**

1. Open **New candidate references** and connect your Google account. Under **Document**, paste your tracker's link (Start here, B5). Under **Sheet**, choose the **Reference Requests** tab.
2. Click **Fetch Test Event**. The node shows a green check, and the output shows the rows from your Reference Requests tab.
3. Open **Email each reference** and connect your Google account. In the Message box, replace `PASTE YOUR REFERENCE CHECK FORM LINK HERE` with the Reference Check form link (Start here, B4).
4. Open **Mark request processed**, connect your Google account, and paste your tracker's link (Start here, B5) under **Document**. The rest of the node is already set up. If a warning icon shows beside **Values to Update**, click it, then click the refresh icon.
_Once you complete the steps above, you are ready to run the first test. In your "Tests" tab, you will run the first test which is a "normal" workflow._ 
5. **Normal 1:** open the Candidate References form (Start here, B3) and submit it as Jordan Ellis, with Jordan's email (Candidates, C2). For the three references, use any names and your own plus addresses, like `yourname+ref1@gmail.com`, `+ref2` and `+ref3`.
6. Click **Execute workflow** and choose **New candidate references**.

**Done when:** three reference emails for Jordan arrive in the builder's inbox, and Jordan's row in Reference Requests is marked Processed.

## 3. Set up and run Branch 2

**Why:** Branch 2 is the half Rosa relies on to know when a candidate is ready for the principal.

**Steps:**

1. Open **New reference response** and connect your Google account. Under **Document**, paste your tracker's link (Start here, B5). Under **Sheet**, choose the **Reference Responses** tab.
2. Click **Fetch Test Event**. The node shows a green check, and the output shows the rows from your Reference Responses tab.
3. Open **Mark response processed**, connect your Google account, and paste your tracker's link (Start here, B5) under **Document**. The rest of the node is already set up. As in Branch 1, refresh **Values to Update** if it shows a warning.
4. Open **Get responses for candidate**, connect your Google account, and paste your tracker's link (Start here, B5) under **Document**. The rest of the node is already set up.
5. Open **Email Rosa** and connect your Google account. Replace `PUT-YOUR-PLUS-ADDRESS-FOR-ROSA-HERE` with the builder's email plus `+rosa`, like `yourname+rosa@gmail.com`.
6. **Normal 2:** Priya Raman already has 2 of 3 responses. Submit the Reference Check form (Start here, B4) with `Priya Raman` as the candidate name. Any reference name and email will do.
7. Click **Execute workflow** and choose **New reference response**.

**Done when:** Rosa's email for Priya arrives, and both normal cases on the Tests tab do what the **What should happen** column says.

## 4. Break it

**Why:** a workflow that works on the normal case can still do the wrong thing, sometimes without any error.

Full test steps are on the **Tests** tab.

| Break | What happens in real life |
| --- | --- |
| 1. A reference submits twice | They aren't sure their first answer went through, so they fill in the form again. |
| 2. A reference types the candidate name differently | For example, they type "Jordon Ellis" instead of "Jordan Ellis." |
| 3. A candidate resubmits the form | They think their first submission didn't go through. |
| 4. A candidate corrects one email (harder) | One reference's email bounced, so Rosa asks them to fix it and resubmit. |
| 5. Two candidates share a reference | A former principal is a reference for two teachers who both applied. |
| 6. A withdrawn candidate submits | They took another job, but still send their references. |

**Steps:**

1. Start with the break your team has been assigned. When you've fixed it, pick a second break.
2. Before you run each test, predict what will happen. Who gets an email? What does Rosa see?
3. Run the test and write what actually happened in the **Starter result** column. Was it obvious something went wrong, or silent?

## 5. Fix it

**Why:** this is the work of making an automation robust. Decide what should happen, then change the workflow so it does.

**Steps:**

1. As a team, decide what the workflow should do differently. Some fixes belong in the workflow, some in the form, and some need a person.
2. Change the workflow, then rerun the same test.
3. Write what happened in the **After your fix** column.

Try designing your fix first. If you're stuck, open a hint.

<details>
<summary><strong>Hint: the workflow forgets what it sent (breaks 3, 4 and 5)</strong></summary>

The Processed column remembers form rows, not references. A resubmitted form is a new row, so the workflow treats it as new. Add a tab that logs each reference email sent, and check it before sending. Think carefully about what makes a request unique. Test break 5 after you fix break 3.

When a Google Sheets lookup finds nothing, the node outputs no items and the workflow stops. Turn on **Settings → Always Output Data** on that node to keep going.

</details>

<details>
<summary><strong>Hint: people type names (break 2)</strong></summary>

Branch 2 matches responses on a name the reference typed. Don't make them type it: send each reference a link with the candidate's name already filled in.

1. Open the Reference Check form editor, using the editor link your TA posted with your tracker. Click the **three dots (⋮)** and choose **Get pre-filled link**.
2. Type `CANDIDATE` as the candidate name, click **Get link**, then **Copy link**.
3. Paste the link into **Email each reference** and replace `CANDIDATE` with `{{ encodeURIComponent($json.candidateName) }}`.

</details>

<details>
<summary><strong>Hint: the workflow counts rows, not people (break 1)</strong></summary>

Three rows doesn't mean three references. Look at what **Count responses** counts, and what it could count instead.

</details>

<details>
<summary><strong>Hint: the workflow ignores Rosa's tracker (break 6)</strong></summary>

Rosa marks withdrawn candidates on the Candidates tab, but Branch 1 never looks there. Check the candidate's Status before sending anything. Who keeps that column up to date, and what happens if they don't?

</details>

## 6. Rerun every test

**Why:** fixes can collide. A fix for one break can quietly cause another, so check them all.

**Steps:**

1. Rerun every test on the Tests tab, including the normal cases.
2. To rerun a test, first delete the rows it added, or clear their Processed cells (column J in Reference Requests, column H in Reference Responses).
3. Be ready to show one break before and after your fix when we come back to the main room.

**Done when:** every test you fixed does what the **What should happen** column says, and the normal cases still work.

## Getting help

**Stuck?** Design your fix as a team first. Then check the hint, ask Claude, or use **Ask for Help** in Zoom.

After class, <a href="https://schoolrunbook.fillout.com/schoolrunbook-office-hours" target="_blank" rel="noopener noreferrer">book office hours</a>, or email coaches@schoolrunbook.com.
