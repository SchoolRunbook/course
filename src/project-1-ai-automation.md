# Project 1: Finance Inbox Tracker — AI version

This continues [Project 1: Finance Inbox Tracker](project-1.md). You’ll add AI to the tracker you built for Marcus, one change at a time. Marcus still approves and pays bills himself.

| Change | Why we’re making it |
|---|---|
| Replace **Read PDFs** with AI attachment reading | Important information can arrive in a PDF, a photo, a scan or a spreadsheet. The tracker needs to read all the attachments on an email, even when the files look different. |
| Replace the code in **Sort Emails** with AI sorting | Fixed rules can miss unfamiliar wording or layouts. AI will use the email, its attachments and the bills already on the sheet to decide what to add or update. |

You’ll ask Claude for each change and follow its guidance in n8n, just as you did in Project 1.

## Before you start

You need three things:

- A working **rules workflow**, including PDF reading and the Project 1 stretch tasks.
- Your own **Marcus - Bills Tracker** Google Sheet.
- Your **Finance Inbox Tracker chat** inside the **SchoolRunbook projects** project in Claude, with the [course project instructions](prework.md#4-create-your-claude-project).

> [!IMPORTANT]
> **Finished the Project 1 homework and stretch tasks?** Keep using your working tracker. Skip the download and setup below and go to [Make your AI copy](#make-your-ai-copy).
>
> **Not finished yet?** Use the completed rules workflow below. Connect it to your own accounts and sheet, then run it successfully before adding AI.

### Get the completed rules workflow

A JSON file is a saved copy of a workflow. Importing it adds the nodes and connections to n8n so you don’t have to build them again.

<p><a href="finance-inbox-tracker-rules.json" download="Finance Inbox Tracker - Rules.json" style="display:inline-block; padding:0.7em 1em; border:1px solid var(--links); border-radius:6px; background:var(--links); color:var(--bg); font-weight:600; text-decoration:none;">Download the rules workflow (.json)</a></p>

1. Click the download button above. Keep the file in your **Downloads** folder; you don’t need to open or edit it.
2. Open the [SchoolRunbook n8n workspace](https://schoolrunbook.app.n8n.cloud/home/workflows) and create a **new workflow**. Start with an empty canvas.
3. Click the **three dots (⋯)** beside the workflow’s name at the top.
4. Choose **Import → From file**.
5. Select **Finance Inbox Tracker - Rules.json** from Downloads and click **Open**.
6. Rename the workflow **Finance Inbox Tracker - Rules - [your name]**.

![Import the rules workflow: open the three-dot menu, choose Import and From file, select the JSON, then click Open.](n8n-import-json.gif)

Your imported rules workflow should look like this. It reads the sheet before sorting, then adds bills, updates existing bills, logs emails and marks them done.

![Completed rules workflow showing Run Tracker, Get Test Emails, Read PDFs, Get Bill Rows, Sort Emails, Route Items and the four output steps.](rules-workflow.png)

### Connect your sheet and accounts

**Why:** start with a working tracker so you can see what each AI change adds.

1. Click through the Gmail and Google Sheets steps in the imported workflow and select your saved credentials.
2. Connect the Google Sheets steps to your own tracker, and select **srb-done** in **Mark Done**. Need a tracker? Follow [Project 1: Set up your sheet](project-1.md#1-set-up-your-sheet).
3. Click **Execute** at the bottom of the canvas to run the workflow once and check that it finishes successfully.

## Make your AI copy

Everyone starts here once their rules workflow works.

1. Open your working rules workflow in n8n.
2. Click the **three dots (⋯)** beside its name and choose **Duplicate**.
3. Name the new copy **Finance Inbox Tracker - AI - [your name]**. Make the AI changes in this copy so you can compare it with your rules version later.
4. Go back to your **rules workflow**. Click **⋯ → Export JSON**. The file downloads to your computer, usually into Downloads.

![Export your working rules workflow by opening the three-dot menu and clicking Export JSON.](n8n-export-json.gif)

> [!NOTE]
> Duplicating the workflow copies its settings, including the sheet and Gmail labels it uses. You’ll set up separate AI test results with Claude before running this copy.

## 1. Let Claude read the attachments

**Why:** the **Read PDFs** step only reads PDF text. A scanned invoice, receipt photo, spreadsheet or email with several attachments needs a more flexible reader. This first change uses AI to read the files and pass their information along with the email.

**Steps:**

1. Open the **same Finance Inbox Tracker chat** inside your **SchoolRunbook projects** project in Claude.
2. Use the chat’s attachment button to attach the **working rules JSON you just exported**.
3. Copy the prompt below and replace **[paste your Google Sheet link here]** with the link to your tracker. Send it with the JSON attached, then follow Claude’s guidance in your **AI copy**, one step at a time.

```text
I've attached a JSON of the workflow I built in n8n using rules. I've made a copy of this workflow, and want to change the PDF reading to use AI. 

I want to replace the step that reads PDFs with AI so that the data is accurate even when the email has different types of attachments.
```

## 2. Let Claude sort the emails

**Why:** the code in **Sort Emails** follows fixed rules. New wording, a different invoice layout or information spread across several files can mean rewriting those rules. You’ll now use AI to read the email and attachment information together, compare it with the bills already on the sheet, and decide what happens next.

> [!IMPORTANT]
> **Keep the sheet-reading step.** **Get Bill Rows** gives the AI the existing bills before it sorts the emails. That is how it can attach a reminder to a bill already on the sheet. Marcus’s approvals, payment decisions and notes still belong to him.

In the **same Claude chat**, copy and send this prompt, then follow Claude’s guidance.

```text
Now let’s use AI to sort the emails and decide what to add or update on the bills sheet, using each email, its attachments and the bills already there. Keep the same business rules as my current tracker.
```

## Your AI workflow

Your AI workflow should follow this order:

**Get emails → AI reads attachments → Read existing bills → AI sorts emails → Route items → Update the sheet and mark emails done.**

Claude may add a few supporting nodes. What matters is that both AI steps work and the rest of Marcus’s process stays the same.
