# Project 1: Finance Inbox Tracker
> **Estimated completion time: 2 hours, plus any stretch projects**
>
> **Note:** this is your homework from Class 1. In class we built part of the Finance Inbox Tracker together. Now you build the whole workflow yourself, then add a step that reads PDF invoices.
>
> Finish steps 1 to 4 before Class 2 on Tuesday, Nov 3 at 3:00pm ET.

Marcus is the Finance Coordinator at InspireAwesomeness Academy, a charter network with three schools. Every invoice, receipt, reminder and vendor newsletter lands in one finance inbox. Each morning he reads every email, decides which ones are bills, and types each bill into his spreadsheet by hand. Bills get missed, and at month-end he hopes his spreadsheet is right.

Your workflow does the first part of his job: it reads the inbox, adds a row to his sheet for every invoice, and labels each email so it's never handled twice. Marcus still approves and pays bills himself.

Complete the steps in order:

1. [Set up your sheet](#1-set-up-your-sheet)
2. [Start your project guide](#2-start-your-project-guide)
3. [Build the workflow](#3-build-the-workflow)
4. [Read PDF invoices](#4-read-pdf-invoices)
5. [Stretch projects (optional)](#5-stretch-projects-optional)
    - [Link each row to its email](#link-each-row-to-its-email)
    - [Flag invoices due within a week](#flag-invoices-due-within-a-week)
    - [Sort every email into a category](#sort-every-email-into-a-category)
    - [Attach reminders and resends to the invoice already on the sheet](#attach-reminders-and-resends-to-the-invoice-already-on-the-sheet)
    - [Flag rows Marcus needs to look at](#flag-rows-marcus-needs-to-look-at)

## 1. Set up your sheet

**Why:** your workflow writes to your own copy of Marcus's bills sheet, so you can compare what the automation adds with what Marcus typed by hand.

**Steps:**

1. Open [Marcus - Bills Tracker (starter)](https://docs.google.com/spreadsheets/d/1fF8V_1j8NA5gBRu5JhOvD-MLSY7qfuQiLDkLCsXSYjQ/copy) and click **Make a copy**. Use the same Google account you'll use for the course.
2. Rename your copy `Marcus - Bills Tracker - [your name]`.
3. Copy its link. You'll paste it into the prompt in step 2.

Leave the Bills tab as it is. Claude's Build tab walks you through making the Automation - Rules tab the workflow writes to.

**Check your test emails:** in Gmail, click the `srb-test` label in the left sidebar (it may be under **More**). You should see 18 test emails. If the label is missing or empty, email coaches@schoolrunbook.com.

## 2. Start your project guide

**Why:** as in the prework, Claude writes your project guide (Context, Design and Build tabs) and you build from it one milestone at a time. The prompt below holds Marcus's process and the details we worked out in class.

**Steps:**

1. In your `SchoolRunbook projects` project in Claude, start a new chat. Copy the prompt below, replace `[paste link]` with your sheet's link, and send it.

```text
Let's start my Finance Inbox Tracker project. Its context is below.

---

## The problem

Bills get missed because Marcus finds and logs invoices from the finance inbox by hand, and month-end depends on his memory.

Marcus is the finance coordinator at a charter school network with three campuses: Northview High, Eastlake Middle and Westside Elementary. Today he works the finance inbox like this:

1. He opens the inbox and reads every new email.
2. He decides which emails are invoices (bills the school needs to pay). Many aren't: receipts for charges that already happened, payment confirmations, newsletters, questions from staff.
3. For each invoice, he adds one row to his Google Sheet.
4. Later, on the sheet, he marks each bill Approved, Denied or Paid and adds notes.

## What the automation should do

The automation finds invoices in the inbox and logs each one as a new row, so none get missed.

1. Read new emails in Gmail.
2. Find the ones that look like invoices.
3. Add one row per invoice to the sheet, filling in as many of Marcus's columns as the email provides.
4. Add a Gmail label to every email it has handled (invoice or not), so the next run skips it.

Marcus still approves, denies and pays bills himself.

## Details you'll need

- Test emails: in my Gmail with the label srb-test. The "handled" label is srb-done. Only fetch emails that have srb-test and don't have srb-done, whether read or unread.
- The sheet: [paste link], my copy of Marcus's sheet. I'll copy his Bills tab, name the copy "Automation - Rules", and delete his rows in the copy. The automation writes only to the Automation - Rules tab.
- Columns: use the sheet's own headers, in this order: Date received, Vendor, Invoice #, Amount, Due date, Campus, Status, Paid date, Notes.
- How Marcus fills them today: dates as YYYY-MM-DD; Amount as dollars, like $1,127.40; Campus is Northview High, Eastlake Middle, Westside Elementary, or Network. Use Network only when the email clearly says the bill covers the whole network or all three campuses. If the email doesn't name a campus, Campus stays blank and Notes says "Campus not stated."
- New rows: Status is "New" and Paid date is blank. If the email doesn't say something, leave that cell blank and say what's missing in Notes.
- Suspicious emails: emails asking to change bank details, or to pay through Venmo, Zelle, Cash App or gift cards, still get a row, with "Needs review: possible fraud" in Notes.
- Nodes: use the six nodes from class, with these names: Run Tracker (manual trigger), Get Test Emails (Gmail), Sort Emails (Code), Invoices Only (Filter), Add Bill Rows (Google Sheets), Mark Done (Gmail label). Mark Done labels every email, invoice or not.

## Scope: keep it small

- Decide what's an invoice and pull out the details with plain rules, all in a single Code node. No AI in the workflow.
- Read only the email's subject, sender and body. Ignore attachments for now.
- Don't match emails to rows already on the sheet, and don't update existing rows. A resent invoice becomes a second row, and that's fine for now.
- Run it manually with a button. No schedule yet.
- Use the fewest nodes that do the job.
```

<ol start="2">
  <li>Claude creates your guide with a Context tab and asks you any questions it has. Answer them.</li>
  <li>Read the Context tab. Edit it yourself or ask Claude to change anything that's missing or wrong. When it looks right, tell Claude to move on.</li>
  <li>Claude adds a Design tab. Read the rules closely: they decide which emails become rows. Ask Claude about anything that's unclear. When the design looks right, tell Claude you're ready to build, and it adds the Build tab.</li>
  <li>Copy the link to your guide, and add it to your SchoolRunbook project instructions in Claude.</li>
</ol>

## 3. Build the workflow

**Why:** this is the whole workflow we started in class, built on your own: get the emails, sort them, write the invoice rows, and mark every email done.

**Steps:**

1. In the SchoolRunbook n8n workspace, create a new workflow called `Finance Inbox Tracker - [your name]`.
2. Follow the Build tab one milestone at a time. Do the checks at the end of each milestone, then tell Claude what you saw.
3. Tell Claude when you're ready for the next milestone.

**Tips from class:**

- **Run the whole workflow:** always click **Execute workflow** at the bottom of the canvas. The play button on a single node runs just that step, and on Add Bill Rows it can write the same rows twice.
- **Look after every node:** open the node's output panel and switch to **Table**. Count the items and read one row before moving on.
- **Pick, don't type:** choose labels, sheets and tabs from the dropdowns in n8n rather than typing their names.
- **Replace all the code:** when Claude gives you new code, select everything in the Code node and paste the whole new version.

**Done when:** your sheet has one row for each item that came out of Invoices Only, every email in `srb-test` also has `srb-done`, and a second run of the workflow fetches no emails.

**Spot checks:** look at your Automation - Rules tab and find these three emails.

| Email | What you should see |
|---|---|
| Invoice PST-10482 from Peach State Student Transport | A row with Amount $18,450.00 |
| URGENT: Updated banking information for Peach State Student Transport | A row whose Notes start with "Needs review: possible fraud" |
| Your KeyVault receipt | No row: it's a receipt for a charge that already happened |

If a row is wrong, tell Claude which email it is, what came out and what you expected.

## 4. Read PDF invoices

**Why:** some vendors put the details in an attached PDF instead of the email. Find the BrightPath Learning row on your sheet: the amount is blank, and Notes says it's missing. Metro Office Solutions sent every detail in a PDF, so it may not be on your sheet at all.

**Steps:**

1. In the same chat, send Claude this:

```text
Let's add PDF reading. Some invoices have their details only in the attached PDF, like the BrightPath Learning email. Right now those rows are blank in the sheet. Read PDFs attached to emails and use that in the workflow.
```

<ol start="2">
  <li>Read the updated Design tab, then build the new milestone the same way as the others.</li>
  <li>Reset before you test, because your emails are already marked done. In Gmail, search for <code>label:srb-done</code>, select all, click the label icon (a tag shape), untick <strong>srb-done</strong> and click <strong>Apply</strong>. Then delete every row under the headers on your Automation - Rules tab.</li>
  <li>Click <strong>Execute workflow</strong>.</li>
</ol>

**Done when:** the BrightPath Learning row shows Amount $6,240.00, and the Metro Office Solutions row shows Invoice # MOS-88317 and Amount $1,127.40. Emails with no PDF should come out the same as before.

## 5. Stretch projects (optional)

**Why:** the workflow you've built only adds rows for new invoices. Marcus still has to read everything else by hand. These projects move him toward managing the whole inbox from his sheet.

Finish steps 1 to 4 first, then pick one. For each, send Claude its prompt, read the updated Design tab, and build it one milestone at a time. Reset your test emails and rows (step 4) before each test run. The prompts are short on purpose: be clear about what you want, and let Claude ask about the details you haven't decided yet.

### Link each row to its email

When Marcus has a question about a bill, he has to search Gmail for the email behind it.

Copy this prompt and send it to Claude in your Finance Inbox Tracker chat:

```text
Let's add a link to the original email on every row, so Marcus can open it from the sheet.
```

### Flag invoices due within a week

A bill due on Friday that nobody has approved turns into a late fee.

Copy this prompt and send it to Claude in your Finance Inbox Tracker chat:

```text
Let's flag invoices that are due within a week and haven't been approved yet, so Marcus sees them before they're late.
```

### Sort every email into a category

Today the workflow only knows "invoice" or "not." Marcus also needs to see receipts for charges that already went through, reminders about bills he already has, and payment notices.

Copy this prompt and send it to Claude in your Finance Inbox Tracker chat:

```text
Let's sort every email into a category, not just invoice or not, and add a row for every email with its category. Help me decide what the categories should be.
```

> [!NOTE]
> **Ask for more test emails:** your 18 test emails aren't enough to test the next two projects. Before you continue, email coaches@schoolrunbook.com to request additional test emails and we'll send you 15 more, including past-due notices, payment confirmations and a credit memo.

### Attach reminders and resends to the invoice already on the sheet

Peach State resent invoice PST-10482, and a principal forwarded the Ace Plumbing invoice. Right now each becomes a duplicate row.

Copy this prompt and send it to Claude in your Finance Inbox Tracker chat:

```text
Let's stop duplicate rows. When a resend, reminder or forward arrives for an invoice already on the sheet, add a note to that row instead of a new row. Don't change anything Marcus typed.
```

This one is harder: the workflow now has to read the sheet before it writes to it. Test it by running the workflow twice after a reset and checking that no invoice appears twice.

### Flag rows Marcus needs to look at

Marcus approves a bill on the sheet, then a past-due notice or a credit memo arrives for it, and nothing on the sheet tells him. Rows with a missing amount or a possible fraud note are easy to miss too. Do this one after the project above, with the extra test emails.

Copy this prompt and send it to Claude in your Finance Inbox Tracker chat:

```text
Let's flag rows Marcus needs to look at: new rows with missing details or possible fraud, and rows that change after he has approved them. Never change his Status. Help me decide how the flag should show on the sheet.
```

## Getting help

**Stuck?** Go back to the same Claude chat, say which milestone you're on, and paste the error message or a screenshot of your canvas. If you come back later, start a new chat in the project and paste your guide's link; Claude will pick up where you left off.

Still stuck? Come to office hours, or email coaches@schoolrunbook.com.
