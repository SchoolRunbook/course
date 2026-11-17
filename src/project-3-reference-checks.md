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
7. [Stretch: a candidate resubmits](#7-stretch-a-candidate-resubmits)

> [!IMPORTANT]
> **Your team builds one workflow together.** One person builds and shares their screen. Everyone else helps decide what to do.
>
> **Design your fixes yourselves.** First, try designing the fix yourself. Discuss amongst yourselves what logic you would change to fix it. Then, if you need you can check the hint and ask Claude for help. 

## 1. Get started

**Why:** everyone starts from the same working workflow

**What you have:** you've been provided with your team's tracker link called **Rosa - Hiring Tracker - Team #**. The tracker has five tabs:

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
3. Open **Email each reference** and connect your Google account.
4. In the same node's Message box, replace `PASTE YOUR REFERENCE CHECK FORM LINK HERE` with the Reference Check form link (Start here, B4). The email still sends if you skip this, just without the link.
5. Open **Mark request processed**, connect your Google account, and paste your tracker's link (Start here, B5) under **Document**. The rest of the node is already set up. If a warning icon shows beside **Values to Update**, click it, then click the refresh icon. Leave the other fields under **Values to Update** empty.
   
_Once you complete the steps above, you are ready to run the first test. In your "Tests" tab, you will run the first test which is a "normal" workflow._ 

6. **Normal 1:** open the Candidate References form (Start here, B3) and submit it as Jordan Ellis, with Jordan's email (Candidates, C2). For the three references, use any names and your own plus addresses, like `yourname+ref1@gmail.com`, `+ref2` and `+ref3`.
7. Click **Execute workflow** and choose **New candidate references**.

**Done when:** three reference emails for Jordan arrive in the builder's inbox, each with a link to the Reference Check form, and Jordan's row in Reference Requests is marked Processed.

## 3. Set up and run Branch 2

**Why:** Branch 2 is the half Rosa relies on to know when a candidate is ready for the principal.

**Steps:**

1. Open **New reference response** and connect your Google account. Under **Document**, paste your tracker's link (Start here, B5). Under **Sheet**, choose the **Reference Responses** tab.
2. Click **Fetch Test Event**. The node shows a green check, and the output shows the rows from your Reference Responses tab.
3. Open **Mark response processed**, connect your Google account, and paste your tracker's link (Start here, B5) under **Document**. The rest of the node is already set up. As in Branch 1, refresh **Values to Update** if it shows a warning, and leave the other fields empty.
4. Open **Get responses for candidate**, connect your Google account, and paste your tracker's link (Start here, B5) under **Document**. The rest of the node is already set up.
5. Open **Email Rosa** and connect your Google account. In the **To** field, replace `PUT-YOUR-PLUS-ADDRESS-FOR-ROSA-HERE` with the builder's email plus `+rosa`, like `yourname+rosa@gmail.com`.
6. **Normal 2:** Priya Raman already has 2 of 3 responses. Submit the Reference Check form (Start here, B4) with `Priya Raman` as the candidate name. Any reference name will do; for the email, use a plus address like `yourname+ref4@gmail.com`.
7. Click **Execute workflow** and choose **New reference response**.

**Done when:** Rosa's email for Priya arrives, and both normal cases on the Tests tab do what the **What should happen** column says.

## 4. Break it

**Why:** a workflow that works on the normal case can still do the wrong thing, sometimes without any error.

You will be fixing 2 errors in the workflow. It's fine if you don't finish Break 2. Full test steps are on the **Tests** tab.

| Break | What happens in real life |
| --- | --- |
| 1. A reference submits twice | They aren't sure their first answer went through, so they fill in the form again. |
| 2. A reference types the candidate name differently | For example, they type "Jordon Ellis" instead of "Jordan Ellis." |

**Steps:**

1. Start with Break 1. Before you run it, predict what will happen. Who gets an email? What does Rosa see?
2. Run the test and write what actually happened in the **Starter result** column. Was it obvious something went wrong, or silent?

## 5. Fix it

**Why:** this is the work of making an automation robust. Decide what should happen, then change the workflow so it does.

**Steps:**

1. As a team, decide what the workflow should do differently. Some fixes belong in the workflow, some in the form, and some need a person.
2. Change the workflow, then rerun the same test.
3. Write what happened in the **After your fix** column.
4. Move on to Break 2 and repeat steps 4 and 5.

Try designing your fix first. If you're stuck, open a hint.

<details>
<summary><strong>Hint: the workflow counts rows, not people (break 1)</strong></summary>

Three rows doesn't mean three references. Look at what **Count responses** counts, and what it could count instead.

When you change what **Count responses** counts, its output field gets a new name. Update **All three in?** to check the new field, or it never fires and Rosa never gets her email.

</details>

<details>
<summary><strong>Hint: people type names (break 2)</strong></summary>

Branch 2 matches responses on a name the reference typed. Don't make them type it: send each reference a link with the candidate's name already filled in.

1. Open the Reference Check form editor, using the editor link your TA posted with your tracker. Click the **three dots (⋮)** and choose **Pre-fill form**.
2. Type `CANDIDATE` as the candidate name, click **Get link**, then **Copy link**.
3. Paste the link into **Email each reference** and replace `CANDIDATE` with `{{ encodeURIComponent($json.candidateName) }}`. Keep the `encodeURIComponent` part: without it, names with a space or an accent, like Tomás Rivera, break the link.

The reference can still edit the filled-in name. What does this fix, and what doesn't it?

To test your fix, submit a new candidate on the Candidate References form and run Branch 1 first, so the reference emails go out with the new link. Jordan's emails from Normal 1 still have the old one.

</details>

## 6. Rerun every test

**Why:** fixes can collide. A fix for one break can quietly cause another, so check them all.

**Steps:**

1. Rerun every test on the Tests tab you've worked on, including the normal cases.
2. To rerun a test, first delete the rows it added, in every tab including any you've added. Delete the whole row; don't just clear the cells. A blank row looks like a new request and crashes Branch 1.
3. Keep the workflow inactive and run each branch with **Execute workflow**. An active workflow checks the forms every minute and sends emails between your tests.
4. Be ready to show one break before and after your fix when we come back to the main room.

**Done when:** every test you fixed does what the **What should happen** column says, and the normal cases still work.

## 7. Stretch: a candidate resubmits

**Why:** the Processed column remembers form rows, not references. A resubmitted form is a new row, so the workflow emails all three references again.

**Steps:**

1. Run **Break 3** from the Tests tab and write the starter result.
2. Design and build your fix, then rerun Break 3.
3. Run **Break 4** as a check on your fix: the candidate changes one reference email and resubmits. Only the corrected reference should get an email.
4. Rerun the normal cases. A fix that blocks too much can stop Normal 1 from working.

<details>
<summary><strong>Hint: the workflow forgets what it sent (break 3)</strong></summary>

Keep a log of every reference email sent, and check it before sending.

1. Add a **Sent log** tab to your tracker with columns for the candidate email and the reference email.
2. Before **Email each reference**, add a Google Sheets node that reads the Sent log. Turn on **Settings → Always Output Data**: the log starts empty, and without this setting an empty read stops the workflow.
3. Add a **Merge** node that combines the references with the log, matching on candidate email and reference email together, and keeps only the references that aren't in the log. Use a Merge node here, not a lookup followed by an If node.
4. After **Email each reference**, add a Google Sheets node that appends each reference you emailed to the Sent log.

Why match on candidate and reference email together, not just the reference email? Think about a principal who is a reference for two candidates.

</details>

## Getting help

**Stuck?** Design your fix as a team first. Then check the hint, ask Claude, or use **Ask for Help** in Zoom.

After class, <a href="https://schoolrunbook.fillout.com/schoolrunbook-office-hours" target="_blank" rel="noopener noreferrer">book office hours</a>, or email coaches@schoolrunbook.com.
