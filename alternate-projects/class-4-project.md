# Class 4 project: Oakfield Cover Desk

Continue your <a href="class-3-homework.html" target="_blank" rel="noopener noreferrer">Class 3 homework</a>. Extend the workflow to assign cover, update the timetable and tell the manager what happened.

## Project story

Sam is the office manager at Oakfield School. When a teacher takes time off, Sam checks their leave allowance, searches the timetable and writes down every session that needs cover. The school has 11 teachers and seven teaching assistants across Pre-K, K and Grades 1–3, each with sections A, B and C.

The homework identifies affected sessions. Finding a replacement still means checking several records: someone who looks free might be assisting elsewhere, lack the right qualification or already have two extra cover sessions.

Oakfield needs a cover desk that assigns one eligible person per affected session and makes any remaining gap clear. Prefer a qualified teacher; use a qualified teaching assistant when no teacher is eligible.

**Workflow:** Record decision → Check approved leave → Find affected sessions → Choose eligible cover → Update timetable → Email manager → Record result

> [!IMPORTANT]
> The manager makes the leave decision. This workflow assigns cover automatically after the checks pass. Preserve the original approval and teacher. A blank approval does nothing; no eligible replacement means an unresolved session, not permission to break a rule.

## 1. Continue your build

1. Open your **Oakfield Cover Desk** Claude chat and working homework workflow.
2. Export its JSON, then duplicate the workflow. Name the copy **[your name] - Oakfield Cover Desk - Cover Assignment**. Switch off the homework workflow while testing.
3. Click <a href="https://docs.google.com/spreadsheets/d/1GaBTEm3bK6pN28dCPPtvzlktwh32xT-QVn1n3JQgag4/copy" target="_blank" rel="noopener noreferrer">Make a fresh copy of Oakfield Cover Desk Project</a>, then click **Make a copy** to confirm. When it opens, rename it **[your name] - Oakfield Cover Desk - Cover Assignment**. Keep the homework sheet as evidence.
4. In every Google Sheets node in the new workflow, select this new spreadsheet. Approval status, Automation status and the cover columns should all be blank.
5. Extend your plain-English logic and write your own prompt. Send it with the working JSON and **new sheet link** in the same Claude chat.
6. Review Claude's updated Context and Design, then follow the Build guide.

Move the successful-request email to the end, after timetable updates. Keep the homework's checks and exception routes; do not also send the old preliminary session-list email.

## 2. Find eligible cover

Read **Staff**, approved leave and the current **Timetable**. Apply these **six fictional rules** to every affected session:

| Rule | What must be true |
| --- | --- |
| 1. Free for the whole session | The full session fits within **Staff → Availability**. The person has no overlapping teaching, assisting, homeroom or cover assignment. |
| 2. Not on leave | There is no **Approved** leave request for that person covering the session's date. |
| 3. Certified for the grade | The session's grade appears in that person's **Certified grades** on Staff. |
| 4. Qualified for the subject | The session's subject appears in that person's **Subjects** on Staff. |
| 5. Enough experience | Their **Experience years** on Staff is **2 or more**. |
| 6. Within the daily limit | They have fewer than **two cover sessions already assigned that day**, so this assignment keeps the total at two or fewer. |

These rules apply to teachers and TAs. A TA already assisting cannot cover and leave the session without its assistant. Approved leave makes someone unavailable even if their balance needs review. A timetable gap means free only within that person's availability.

Choose a **teacher first**, then the person with the **fewest covers that day**, then **Staff ID in ascending order** to break a tie.

Process requests in Request ID order and sessions in date, start time and Session ID order. Include earlier assignments in later availability and workload checks. If nobody qualifies, leave **Cover staff** blank and record **No eligible cover** for that session.

## 3. Update the timetable and tell Sam

1. Find the row by **Session ID**. Match staff using the ID prefix in labels such as **T01 - Amara Cole**, not names or row positions.
2. Write the selected person's **ID - Name** in **Cover staff** and the request's ID in **Cover Request ID** together. Preserve **Teacher**, **TA**, and the session details.
3. After the updates, email one result per request to **coaches@schoolrunbook.com**. Include your name and Request ID in the subject.
4. Set **Automation status** to **Manager updated** only after the email sends. Status updates must not restart the request.

The email shows the absent teacher's name and ID, requested dates, days, leave balance, and each affected session's class, subject, time and cover person's name. Identify uncovered sessions. Say **Cover partly arranged** if only some have cover, or **No eligible cover** if none do.

Keep the other routes: **Not approved**, insufficient or zero leave, dates outside the window, missing data or no matching sessions. Explain the result without changing the manager's decision. Make no assignments where checks fail.

**AI's role:** decide where AI would help in your workflow and where another approach would work better. Explain your choices in your Build Plan and write any AI prompts yourself. Whichever approach you choose, the workflow must follow the six school rules and produce results that match the sheet.

## 4. Recover without repeating work

Add a **Run Log** for this stage: Request ID, completed Session IDs, outcome and notification progress. Keep **Automation status** as the visible summary: **Processing** while working, **Needs review** if processing cannot finish, **Manager updated** after the final email. An emailed report may still contain a cover gap.

- **Timetable updated; email failed:** reuse saved assignments and finish the notification.
- **Only some updates succeeded:** continue from the remaining Session IDs.
- **Email may have sent; logging failed:** check Sent mail using the Request ID before resending.
- **Request finished:** skip its assignments and email.

Process one request at a time and recheck availability before writing. Do not reset a partially completed request to recover it. If someone changes a processed approval, review existing assignments before deliberately starting that request again.

## 5. Test, monitor and hand over

1. Predict each sample's result. Select **Approved** for LR001–LR004, LR006 and LR007; select **Not approved** for LR005. Check teacher cover, TA cover, no eligible cover, insufficient or zero leave, and outside-window dates.
2. Leave an approval blank and confirm nothing happens. Repeat an unchanged completed decision and confirm no duplicate assignment or email.
3. In a test copy, stop after timetable updates but before the email. Resume the unfinished step.
4. Check n8n execution history for **failed runs**. Add a failure notification for the workflow owner and test it using an automatic run.
5. Add a scheduled check for **missing work**: recorded decisions with blank Automation status or requests left unfinished. Allow the normal processing time before notifying the owner; blank approvals are not missing work.
6. Ask Claude to create a handover document and to ask you any questions it needs answered first. Include the purpose, owner, sheet and workflow links, trigger, rules, AI instructions, tests, how to find a problem and how to resume or stop. Read the document and correct anything that does not match your actual workflow. Keep your Claude project guide up to date too.

Complete the workflow, testing, monitoring, handover and submission **during class**. Use your own email while debugging, then **coaches@schoolrunbook.com** for the final demonstration. Use a clean test copy for a fresh end-to-end run; do not erase assignments to resend a message.

## Stretch task: let the manager choose

Finished the required work and submitted it? Try this extension if you have time left in class.

Sam may know which teacher recently worked with a class. Recommend the **top two eligible people per session**, using the same rules and ranking, and let Sam choose in the sheet before any assignment is written. Offer one if only one qualifies; report the gap if none do.

Recheck eligibility when the choice arrives. If it changed, request a new choice. Write your own logic and prompt before asking Claude to help build this extension.

## Submit your finished workflow

> [!IMPORTANT]
> Use the <a href="https://docs.google.com/forms/d/e/1FAIpQLSfTDUwvMkP6TDJliJZKj3Ac6L8GBYBL2sdvzcVkNe4cgXJy2Q/viewform" target="_blank" rel="noopener noreferrer">project submission form</a> to upload your completed **workflow JSON**.
>
> In the final written-answer box, enter **Class 4 — Oakfield Cover Desk** and paste your spreadsheet and Build Plan Doc links. Include your updated logic, original prompts, test results and handover in that Doc. Give **coaches@schoolrunbook.com** Viewer access to both files.
>
> <a href="https://schoolrunbook.github.io/course/project-1-ai-automation.html#export-workflow-json" target="_blank" rel="noopener noreferrer">Find instructions here for exporting your workflow JSON.</a>
