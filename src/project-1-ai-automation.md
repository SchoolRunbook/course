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

The download contains the workflow, but you still need to connect **your own Gmail and Google Sheet**.

1. Open your copy of **Marcus - Bills Tracker** and copy its link from the browser’s address bar. If you don’t have a copy, follow [Project 1: Set up your sheet](project-1.md#1-set-up-your-sheet) first.
2. Open your Finance Inbox Tracker chat in **SchoolRunbook projects**. If you haven’t started that chat, start one in that project. Attach the downloaded JSON and paste your sheet link. Tell Claude you’re starting from the supplied completed rules workflow, and ask it to read your sheet and guide you through any missing tabs or columns before you run it.
3. Follow Claude’s sheet setup instructions. Keep Marcus’s original tab unchanged; the workflow uses **Automation - Rules** for its bill rows and **Inbox Log** for the email history.
4. In n8n, double-click each node in the table below. Under **Credential to connect with**, choose your saved Gmail or Google Sheets connection. If you don’t have one, choose **Create new credential** and follow the Google sign-in steps with your course Google account.
5. In each Google Sheets node, select **your own spreadsheet** from the **Document** dropdown. Under **Sheet**, check the tab name against the table below. The download already fills in these tab names; if Claude helped you use different names, choose your matching tabs instead.

| Node | What to connect |
|---|---|
| **Get Test Emails** | Your Gmail account |
| **Get Bill Rows** | Your Google Sheets account → your tracker → **Automation - Rules** |
| **Add Bill Rows** | Your Google Sheets account → your tracker → **Automation - Rules** |
| **Update Bill Rows** | Your Google Sheets account → your tracker → **Automation - Rules** |
| **Log Emails** | Your Google Sheets account → your tracker → **Inbox Log** |
| **Mark Done** | Your Gmail account → select your **srb-done** label |

If **srb-done** is missing, create that label in Gmail, then return to **Mark Done** and select it. If Claude cannot open your sheet, check the Google Drive connection from [Prework](prework.md#4-create-your-claude-project), then send the link again.

### Run the rules workflow once

**Why:** start with a working tracker so you can see what each AI change adds.

1. Check that your Gmail has the course test emails under **srb-test**. See [Project 1](project-1.md#1-set-up-your-sheet) if they’re missing.
2. Click **Execute** at the bottom of the n8n canvas to run the whole workflow.
3. Open your sheet. Check that bill rows appear on **Automation - Rules**, and that **Inbox Log** records the emails handled. Check Gmail for the **srb-done** label on those emails.
4. If the workflow stops, send Claude the error message and a screenshot of the node. Follow its guidance, then try again. If no emails are fetched because they’re already marked done, ask Claude to help you reset the course test run without losing the sheet data you want to keep.

**Done when:** the whole rules workflow runs successfully, its results appear in your sheet, and Claude has helped you resolve any setup problems. You’re ready to add AI.

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
3. Paste the link to **your Google Sheet** into the same message so Claude can check its current tabs and columns. Add the prompt below, then send the message. Attach the file itself; you don’t need to paste its contents.

```text
Let’s use AI to read all the attachments on each email, including PDFs, images and spreadsheets, so we don’t miss important information when the files look different.
```

<ol start="4">
  <li>Tell Claude you’ve made an AI copy. Before testing it, ask Claude to help you use separate AI test tabs and a separate handled-email label, so you can compare both versions on the same sample emails.</li>
  <li>Follow Claude’s guidance in your <strong>AI copy</strong>, one step at a time. Tell it what you see after each step.</li>
  <li><strong>Run only the new attachment-reading step</strong> at this stage. Open its output and compare the extracted information with each file on the email. Also try an email with no attachment. Wait until step 2 is complete before running the whole AI workflow.</li>
  <li>Finish this change with Claude before starting step 2.</li>
</ol>

**Done when:** the AI copy reads the information in the attachments you tested, keeps it associated with the right email, and still handles emails without attachments.

## 2. Let Claude sort the emails

**Why:** the code in **Sort Emails** follows fixed rules. New wording, a different invoice layout or information spread across several files can mean rewriting those rules. You’ll now use AI to read the email and attachment information together, compare it with the bills already on the sheet, and decide what happens next.

> [!IMPORTANT]
> **Keep the sheet-reading step.** **Get Bill Rows** gives the AI the existing bills before it sorts the emails. That is how it can attach a reminder to a bill already on the sheet. Marcus’s approvals, payment decisions and notes still belong to him.

**Steps:**

1. In the **same Claude chat**, copy and send this prompt. You don’t need to attach the files again unless Claude asks for an updated workflow.

```text
Now let’s use AI to sort the emails and decide what to add or update on the bills sheet, using each email, its attachments and the bills already there. Keep the same business rules as my current tracker.
```

<ol start="2">
  <li>Follow Claude’s guidance to replace the sorting logic in your AI copy.</li>
  <li>Finish the connections to <strong>Route Items</strong> and the sheet and Gmail steps, following Claude’s instructions.</li>
  <li>Click <strong>Execute</strong> at the bottom of the canvas and check the results with Claude. Share the error message or output if anything doesn’t match what you expected.</li>
</ol>

## Done when

Your AI workflow should follow this order:

**Get emails → AI reads attachments → Read existing bills → AI sorts emails → Route items → Update the sheet and mark emails done.**

Claude may add a few supporting nodes. What matters is that both AI steps work and the rest of Marcus’s process stays the same.

- The attachment reader uses the information in the files you tested, including all attachments when an email has more than one.
- The sorting step returns structured data that **Route Items** can use. Claude should help you set up n8n’s structured-output feature for this.
- A new invoice becomes a bill row; a reminder or resend links to the existing bill; other emails are logged in the right category.
- Marcus’s **Status**, **Paid date** and existing notes are preserved when a follow-up arrives.
- The full workflow runs successfully, the results appear in your sheet, and handled emails are marked done.
- Your rules workflow is still available for comparison.

## Getting help

Stay in the same Claude chat. Say which step you’re on, what you expected and what happened. Attach a screenshot or the error message so Claude can help you with that specific step.

Still stuck? Come to [office hours](live-classes.md), or email coaches@schoolrunbook.com.
