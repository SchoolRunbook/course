# Project 3: Reference Checks

Rosa is the HR Coordinator at InspireAwesomeness Academy, a charter network with three schools: Northview High, Eastlake Middle and Westside Elementary. When a principal wants to move ahead with a candidate, Rosa asks the candidate for three references, emails each reference a link to the school's reference form, and tells the principal once all three have answered.

Someone has already automated this for Rosa. The workflow works when everyone behaves as expected. Real people don't: they resubmit forms, mistype names and change their plans. Today your team finds out how the workflow breaks, then makes it robust.

Complete the steps in order:

1. [Set up your team's workflow](#1-set-up-your-teams-workflow)
2. [Run the normal cases](#2-run-the-normal-cases)
3. [Break it](#3-break-it)
4. [Fix it](#4-fix-it)
5. [Rerun every test](#5-rerun-every-test)

> [!IMPORTANT]
> **Your team builds one workflow together.** One person builds and shares their screen. Everyone else helps decide what to do.
>
> **Decide your fixes yourselves.** You can ask Claude for help with mechanics, like an n8n expression or how a node's settings work. Don't ask Claude how to fix a break.

## 1. Set up your team's workflow

**Why:** everyone starts from the same working workflow, so your time goes to breaking and fixing it.

**What you have:** your TA posts a link to your team's copy of **Rosa - Hiring Tracker** in your breakout room chat. It has five tabs:

- **Start here:** links to your team's two forms.
- **Candidates:** Rosa's tracker. Rosa keeps the **Status** column up to date by hand.
- **Reference Requests:** every response to the Candidate References form lands here.
- **Reference Responses:** every response to the Reference Check form lands here.
- **Tests:** the tests you'll run today, with what should happen.

**Steps:**

<p><a href="reference-checks-starter.json" download="Reference Checks - Starter.json" style="display:inline-block; padding:0.7em 1em; border:1px solid var(--links); border-radius:6px; background:var(--links); color:var(--bg); font-weight:600; text-decoration:none;">Download the starter workflow (.json)</a></p>

1. The builder downloads the starter workflow above.
2. In the <a href="https://schoolrunbook.app.n8n.cloud/home/workflows" target="_blank" rel="noopener noreferrer">SchoolRunbook n8n workspace</a>, create a new workflow, click the **three dots (⋯)** beside its name and choose **Import → From file**. Rename it `Reference Checks - Team [number]`.
3. Open each Google Sheets node, connect your Google account, and choose your team's tracker and tab:
   - **New candidate references:** the **Reference Requests** tab.
   - **New reference response** and **Get responses for candidate:** the **Reference Responses** tab.
4. Open both Gmail nodes and connect your Google account.
5. In **Email each reference**, replace `PASTE YOUR REFERENCE CHECK FORM LINK HERE` with the Reference Check form link from the **Start here** tab.
6. In **Email Rosa**, replace `PUT-YOUR-PLUS-ADDRESS-FOR-ROSA-HERE` with the builder's email plus `+rosa`, like `yourname+rosa@gmail.com`.

**Plus addresses:** anything sent to `yourname+anything@gmail.com` lands in your own inbox. The builder plays Rosa and all the references this way, and no real person gets emailed.

**The starter workflow has two branches:**

- **Branch 1, a candidate sends their references:** a new row in Reference Requests starts it. **Split references** turns the one response into three items, and **Email each reference** sends each one the form link.
- **Branch 2, a reference responds:** a new row in Reference Responses starts it. It finds every response with the same candidate name, counts them, and emails Rosa when the count reaches 3.

**Done when:** no node shows a warning.

## 2. Run the normal cases

**Why:** you need to see the workflow working before you can tell when it's broken.

**Steps:**

1. **Normal 1:** open the Candidate References form from **Start here** and submit it as Jordan Ellis, using Jordan's email from the Candidates tab. For the three references, use any names and your own plus addresses, like `yourname+ref1@gmail.com`, `+ref2` and `+ref3`.
2. In n8n, click **Execute workflow** and choose **New candidate references**. Three reference emails arrive in the builder's inbox.
3. **Normal 2:** Priya Raman already has 2 of 3 responses. Open the Reference Check form and submit it as her third reference, Nina Brooks, with `Priya Raman` as the candidate name.
4. Click **Execute workflow** and choose **New reference response**. Rosa's email arrives.

**Done when:** both normal cases on the Tests tab do what the **What should happen** column says.

## 3. Break it

**Why:** a workflow that works on the normal case can still do the wrong thing, sometimes without any error.

Each break is something real people do. Full test steps are on the **Tests** tab.

| Break | What happens in real life |
| --- | --- |
| 1. A reference submits twice | They aren't sure their first answer went through, so they fill in the form again. |
| 2. A reference types the name differently | They type "Jordon Ellis" instead of "Jordan Ellis." |
| 3. A candidate resubmits the form | They think their first submission didn't go through. |
| 4. A candidate corrects one email (harder) | One reference's email bounced, so Rosa asks them to fix it and resubmit. |
| 5. Two candidates share a reference | A former principal is a reference for two teachers who both applied. |
| 6. A withdrawn candidate submits | They took another job, but still send their references. |

**Steps:**

1. Your TA assigns your team's first break. Pick a second one your team finds interesting.
2. Before you run each test, predict what will happen. Who gets an email? What does Rosa see?
3. Run the test and write what actually happened in the **Starter result** column. Was it obvious something went wrong, or silent?

## 4. Fix it

**Why:** this is the work of making an automation robust. Decide what should happen, then change the workflow so it does.

**Steps:**

1. As a team, decide what the workflow should do differently. Some fixes belong in the workflow, some in the form, and some need a person.
2. Change the workflow, then rerun the same test.
3. Write what happened in the **After your fix** column.

Try designing your fix first. If you're stuck, open a hint.

<details>
<summary><strong>Hint: the workflow forgets what it sent (breaks 3, 4 and 5)</strong></summary>

Nothing records which references have already been emailed, so every run starts fresh. Add a tab that logs each email sent, and check it before sending. Think carefully about what makes a request unique. Test break 5 after you fix break 3.

When a Google Sheets lookup finds nothing, the node outputs no items and the workflow stops. Turn on **Settings → Always Output Data** on that node to keep going.

</details>

<details>
<summary><strong>Hint: people type names (break 2)</strong></summary>

Branch 2 matches responses on a name the reference typed. Don't make them type it: send each reference a link with the candidate's name already filled in.

1. Open the Reference Check form editor (link on **Start here**), click the **three dots (⋮)** and choose **Get pre-filled link**.
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

## 5. Rerun every test

**Why:** fixes can collide. A fix for one break can quietly cause another, so check them all.

**Steps:**

1. Rerun every test on the Tests tab, including the normal cases.
2. To rerun a test, first delete the rows it added.
3. Be ready to show one break before and after your fix when we come back to the main room.

**Done when:** every test you fixed does what the **What should happen** column says, and the normal cases still work.

## Getting help

**Stuck?** Use **Ask for Help** in Zoom, or ask Claude about mechanics like expressions and node settings.

After class, <a href="https://schoolrunbook.fillout.com/schoolrunbook-office-hours" target="_blank" rel="noopener noreferrer">book office hours</a>, or email coaches@schoolrunbook.com.
