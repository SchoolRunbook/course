# Project 1: Finance Inbox Tracker — AI version

Your rules workflow follows instructions you wrote in code. Now you'll ask Claude to do the reading and sorting, using the same business rules. Marcus still approves and pays bills himself.

Make these two changes one at a time. Use the same Claude chat and project guide you used to build your Finance Inbox Tracker.

## Before you start

Start with a working version that reads attachments and checks the existing bills sheet through Get Bill Rows. If either part is missing, finish it with Claude first, one milestone at a time.

Attach your current workflow export in the same Claude chat. You'll work in a duplicate so you can keep the rules version for comparison. Before running the duplicate, ask Claude to help you keep its results and handled-email label separate from the rules version.

## 1. Let Claude read the attachments

Some invoices have their details in an attachment. Replace the reading step first, while leaving the rest of your workflow in place.

Copy this prompt and send it to Claude:

```text
Let’s add AI to a duplicate of my attached Finance Inbox Tracker. First, replace Read PDFs with Anthropic’s Message a Model node, using the course Claude credential and Code Execution. Split out the attachments so Claude reads each file separately, then keep each reading with its original email. Keep Get Bill Rows and the remaining flow. Help me test just this reading step, with no extra validation branches.
```

Read the updated Design tab, then build the milestone. **Execute just the new reading step**, not the whole workflow yet. Compare the sample attachments with the information it reads. For an email with multiple files, check that all its attachment content stays with that email. Tell Claude what you see before moving on.

## 2. Let Claude sort the emails

Now change the sorting step. It still needs the emails, the attachment information, and the existing bills from your sheet.

Copy this prompt and send it to Claude:

```text
Now replace Sort Emails with Claude applying the same business rules to each email, its attachments, and the existing Get Bill Rows results. Use n8n’s Structured Output Parser to pass the same add/update/log records to Route Items, with Split Out if needed. Keep the remaining flow and help me build and test this step without extra validation branches.
```

Read the updated Design tab, then build the milestone. Run the two versions on the same sample emails, using the comparison setup Claude helped you prepare.

**Check:** find an invoice, a reminder about an existing bill, and a suspicious payment request. Compare what the two versions did with what each email actually says. Correctly structured JSON can still contain a wrong answer. Which results agree? Where do they differ?

**Done when:** your AI version reads the sample attachments and sorts the emails, the existing bill information still reaches Sort, and you can explain one result from your comparison.

## Getting help

Go back to the same Claude chat, say which of the two steps you're on, and paste the error message or a screenshot of your canvas. Work through that step before starting the next one.

