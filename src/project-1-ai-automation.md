# Project 1: Finance Inbox Tracker — AI version

This continues [Project 1: Finance Inbox Tracker](project-1.md). You'll add AI to Marcus's tracker, one change at a time. Marcus still approves and pays bills himself.

| Change | Why we're making it |
|---|---|
| Replace **Read PDFs** with AI attachment reading | Important information can arrive in a PDF, a photo, a scan or a spreadsheet. The tracker needs to read all the attachments on an email, even when the files look different. |
| Replace the code in **Sort Emails** with AI sorting | Fixed rules can miss unfamiliar wording or layouts. AI will use the email, its attachments and the bills already on the sheet to decide what to add or update. |

You'll ask Claude for each change and follow its guidance in n8n, just as you did in Project 1.

## Before you start

You need:

- Access to n8n and the Gmail account containing your **srb-test** emails.
- Your **Finance Inbox Tracker chat** inside your **SchoolRunbook projects** project in Claude, with the [course project instructions](prework.md#4-create-your-claude-project).
- The supplied rules workflow and your own copy of the Class 2 spreadsheet. Get both below.

> [!IMPORTANT]
> **Everyone starts from the same version for Class 2.** Download our completed rules workflow and make your own copy of the spreadsheet below, even if you completed all the Project 1 stretch tasks.
>
> Keep your original Project 1 workflow. You'll use this shared starting version to add AI and compare the results.

### Get your Class 2 spreadsheet

<p><a href="https://docs.google.com/spreadsheets/d/1_Ok9nxpc42o7VFwS6Fh2qBfzBlgAUu7-eW_-vt9hFF8/copy" style="display:inline-block; padding:0.7em 1em; border:1px solid var(--links); border-radius:6px; background:var(--links); color:var(--bg); font-weight:600; text-decoration:none;">Make a copy of the Class 2 spreadsheet</a></p>

1. Open **[Make a copy of the Class 2 spreadsheet](https://docs.google.com/spreadsheets/d/1_Ok9nxpc42o7VFwS6Fh2qBfzBlgAUu7-eW_-vt9hFF8/copy)**.
2. On Google's copy screen, click **Make a copy**. Sign in to Google if asked.
3. Rename your copy **[your name] - Finance Inbox Tracker - Class 2**.
4. Keep this sheet open. You'll connect it to n8n and share its link with Claude.

Your copy already has the tabs and columns you need. **Automation - Rules** and **Inbox Log** hold your rules results. **Automation - AI** and **Inbox Log - AI** hold your AI results. Keep these tab names.

### Get the completed rules workflow

A JSON file is a saved copy of a workflow. Importing it adds the nodes and connections to n8n so you don't have to build them again.

<p><a href="finance-inbox-tracker-rules.json" download="Finance Inbox Tracker - Rules.json" style="display:inline-block; padding:0.7em 1em; border:1px solid var(--links); border-radius:6px; background:var(--links); color:var(--bg); font-weight:600; text-decoration:none;">Download the rules workflow (.json)</a></p>

1. Click the download button above. Keep the file in **Downloads**; you don't need to open or edit it.
2. Open the [SchoolRunbook n8n workspace](https://schoolrunbook.app.n8n.cloud/home/workflows) and create a **new workflow** with an empty canvas.
3. Click the **three dots (⋯)** beside the workflow's name.
4. Choose **Import → From file**.
5. Select **Finance Inbox Tracker - Rules.json** from Downloads and click **Open**.
6. Rename the workflow **[your name] - Finance Inbox Tracker - Rules**.

![Import the rules workflow: open the three-dot menu, choose Import and From file, select the JSON, then click Open.](n8n-import-json.gif)

Your imported rules workflow should look like this. It reads the sheet before sorting, then adds bills, updates existing bills, logs emails and marks them done.

![Completed rules workflow showing Run Tracker, Get Test Emails, Read PDFs, Get Bill Rows, Sort Emails, Route Items and the four output steps.](rules-workflow.png)

### Connect your sheet and accounts

**Why:** start with a working tracker so you can see what each AI change adds.

1. Open **Get Test Emails** and **Mark Done** and select your Gmail credential. In **Mark Done**, select the **srb-done** label.
2. Open each Google Sheets step—**Get Bill Rows**, **Add Bill Rows**, **Update Bill Rows** and **Log Emails**—and select your Google Sheets credential and your **new Class 2 spreadsheet**.
3. Keep **Automation - Rules** selected in the three bill steps and **Inbox Log** in **Log Emails**.

If you need help connecting an account or selecting a tab, ask a TA before running the workflow.

### Run the rules workflow once

1. If you've already processed the practice emails, reset their completion label using the instructions below.
2. Click **Execute** at the bottom of the rules workflow and wait for it to finish.
3. Open your new sheet and check **Automation - Rules** and **Inbox Log** for the results. Keep these results for comparison.

<a id="reset-test-emails"></a>

> [!IMPORTANT]
> **To replay the practice emails**
>
> The tracker skips emails labelled **srb-done**. Before running the same practice emails again:
>
> 1. In Gmail, search for `label:srb-test label:srb-done`.
> 2. Select all matching practice emails. If Gmail offers **Select all conversations that match this search**, select it too.
> 3. Click the label icon, untick **srb-done**, then click **Apply**. Keep **srb-test** selected.
>
> If the search finds no matches, there is nothing to reset. You only need this reset when replaying emails that have already been processed.

## Make your AI copy

Once your rules workflow works, export it first, then duplicate it.

1. Open your working **rules workflow** in n8n.
2. Click the **three dots (⋯)** beside its name and choose **Export JSON**. Keep the downloaded file; you'll attach it to Claude.
3. In the same rules workflow, open the **three-dot menu (⋯)** again and choose **Duplicate**.
4. Name the new copy **[your name] - Finance Inbox Tracker - AI**. Make the AI changes in this copy.

<a id="export-workflow-json"></a>

![Export your working rules workflow by opening the three-dot menu and clicking Export JSON.](n8n-export-json.gif)

> [!IMPORTANT]
> **Keep your rules and AI results separate.** Duplicating a workflow also copies its sheet settings. Before you test the AI copy, follow Claude's guidance to point **Get Bill Rows**, **Add Bill Rows** and **Update Bill Rows** to **Automation - AI**, and **Log Emails** to **Inbox Log - AI**, in the same new spreadsheet.
>
> **Get Bill Rows must read the AI tab too**, so the AI checks its own results when deciding whether a bill is already recorded. Keep your rules workflow connected to the rules tabs.

<a id="round-1"></a>
<a id="1-let-claude-read-the-attachments"></a>

## 1. Let Claude read the attachments — Round 1

**Why:** the **Read PDFs** step only reads PDF text. A scanned invoice, receipt photo, spreadsheet or email with several attachments needs a more flexible reader. This first change uses AI to read the files and pass their information along with the email.

1. Open the **same Finance Inbox Tracker chat** inside your **SchoolRunbook projects** project in Claude.
2. Attach the **working rules JSON you just exported** using the chat's attachment button.
3. Copy the prompt below. Replace **[paste the link to your new sheet here]** with the URL of your own new Class 2 spreadsheet, not the template-copy link.
4. Send the prompt with the JSON attached. Follow Claude's guidance in your **AI copy**, one step at a time.

```text
My Google Sheet: [paste the link to your new sheet here]

I've attached a JSON of my current rules workflow in n8n. I'm working in a copy of the workflow for the AI version. Use this JSON as our starting point.

Let's simply use AI to read all the attachments on each email, including PDFs, images and spreadsheets, so we don't miss information when the files look different. This is the only change I want to make right now.

Keep my rules results unchanged and use the AI tabs in the same spreadsheet. Guide me through the change and testing, one step at a time.
```

<a id="round-2"></a>
<a id="2-let-claude-sort-the-emails"></a>

## 2. Let Claude sort the emails — Round 2

**Why:** the code in **Sort Emails** follows fixed rules. New wording, a different invoice layout or information spread across several files can mean rewriting those rules. AI can use the meaning of the email and attachments to decide what happens next, while following the same business rules.

> [!IMPORTANT]
> **Keep the sheet-reading step.** **Get Bill Rows** gives the AI the existing bills before it sorts the emails. That is how it can attach a reminder to a bill already on the sheet. Marcus's approvals, payment decisions and notes still belong to him.

Continue once your attachment-reading step is working. In the **same Claude chat**, send this prompt and follow Claude's guidance in the **same AI workflow**.

```text
Now let's use AI to understand and sort emails and invoices, even when their wording or layout is unfamiliar, and decide what to add or update using the email, all its attachments and the bills already on the sheet. I want to still keep the same business rules.
```

## Compare your results

Once both AI steps are working, compare them with your rules version using the same practice emails.

1. If your AI tabs contain results from earlier tests, ask Claude to guide you through clearing only those generated test rows in **Automation - AI** and **Inbox Log - AI**. Keep the headers and your rules results.
2. [Reset the practice emails' completion label](#reset-test-emails).
3. Run your completed **AI workflow** and wait for it to finish.
4. Compare the rules and AI results with the original emails and attachments. Which gets things right more often? Note a specific example for your submission.

These steps are for a fresh comparison. If you're testing how a reminder updates an existing bill, keep that bill's row and follow Claude's guidance.

## Your AI workflow

Your AI workflow should follow this order:

**Get emails → AI reads attachments → Read existing bills → AI sorts emails → Route items → Update the sheet and mark emails done.**

Claude may add a few supporting nodes. What matters is that both AI steps work and the rest of Marcus's process stays the same.

## Stretch tasks

Finish both AI steps first, then pick a task. Copy its prompt into the **same Finance Inbox Tracker chat in Claude** and follow its guidance in your **AI workflow**.

### Explain what each bill is for

**Why:** a vendor’s name and an amount may not explain what the school bought. A short description on each bill’s row lets Marcus understand the charge without reopening the email and attachments.

```text
Let’s add a short, plain-language description of what each bill is for on its row, so Marcus can understand the charge from the sheet.
```

### Group bills by what the school is buying

**Why:** bills for similar expenses can come from different vendors. Giving each bill an expense category, such as transport, software or repairs, helps Marcus find related costs together on the sheet.

```text
Let’s add an expense category to each bill, such as transport, software or repairs, so Marcus can group similar costs on the sheet. Help me decide what the categories should be.
```

### See what has been paid and what is still owed

**Why:** Marcus can see every bill, but he still has to add up what’s been paid, what’s unpaid and what’s late. A Summary tab puts those totals in one place and shows the period covered by the emails the tracker has processed.

```text
Let’s add a Summary tab that updates after each run. For the bills from all emails processed so far, show the date range covered by those emails, the total paid, the total still outstanding and how much of that outstanding amount is past due. Base the totals on Marcus’s recorded bill statuses, excluding denied bills, and count each bill once.
```

## Submit your project

> [!IMPORTANT]
> **Submit your completed Project 1 before class on November 10.**
>
> Finish both AI steps and compare the results with your rules version. Export your **completed AI workflow** as a JSON file, including any stretch tasks you completed, then **[submit your final project using this form](https://docs.google.com/forms/d/e/1FAIpQLSfTDUwvMkP6TDJliJZKj3Ac6L8GBYBL2sdvzcVkNe4cgXJy2Q/viewform)**. Include a specific example from your comparison in the form.
>
> [Find instructions here on how to export your JSON file](#make-your-ai-copy). Follow the export steps on your **completed AI workflow**; you do not need to duplicate it again.
>
> Stretch tasks are optional.

<!-- Keep every link on this guide in a new tab, without changing other course pages. -->
<script>
(function () {
  if (!window.location.pathname.endsWith('/project-1-ai-automation.html')) return;

  function setNewTab(link) {
    link.target = '_blank';
    link.relList.add('noopener', 'noreferrer');
  }

  function updateLinks(root) {
    if (root.matches?.('a[href]')) setNewTab(root);
    root.querySelectorAll?.('a[href]').forEach(setNewTab);
  }

  function initializeLinks() {
    updateLinks(document);
    // Include links added later, such as search results, without changing downloads.
    new MutationObserver(function (records) {
      records.forEach(function (record) {
        record.addedNodes.forEach(updateLinks);
      });
    }).observe(document.body, { childList: true, subtree: true });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initializeLinks, { once: true });
  } else {
    initializeLinks();
  }
})();
</script>
